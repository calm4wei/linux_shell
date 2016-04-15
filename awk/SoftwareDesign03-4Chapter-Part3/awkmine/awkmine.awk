#!/usr/bin/awk -f
BEGIN {
	BOARD_ROW = 8
	BOARD_COL = 8
	MINE_PERCENT = ARGV[1] !=  "" ? ARGV[1] : 15

	term_init()

	set_cell()
	cursor_row = cursor_col = 1

	main_loop()
}

function main_loop() {
	display()

	for ( ; ; ) {
		term_cursor_move(cursor_row, cursor_col * 2 - 1)

		key = term_getkey()

		if (key == " ") {
			open(cursor_row, cursor_col)
			judge_win()
			display()
		} else if (key == "f") {
			toggle_flag(cursor_row, cursor_col)
			display()
		} else if (key == "j") {
			cursor_row = (++cursor_row > BOARD_ROW) ? BOARD_ROW : cursor_row
		} else if (key == "k") {
			cursor_row = (--cursor_row < 1) ? 1 : cursor_row
		} else if (key == "l") {
			cursor_col = (++cursor_col > BOARD_COL) ? BOARD_COL : cursor_col
		} else if (key == "h") {
			cursor_col = (--cursor_col < 1) ? 1 : cursor_col
		} else if (key == "0") {
			cursor_col = 1
		} else if (key == "$") {
			cursor_col = BOARD_COL
		} else if (key == "g") {
			cursor_row = 1
		} else if (key == "G") {
			cursor_row = BOARD_ROW
		} else if (key == "q") {
			exit 0
		}
	}
}

function display(    i, j) {
	term_clear()
	term_cursor_move(1, 1)

	for (i = 1; i <= BOARD_ROW; i++) {
		for (j = 1; j <= BOARD_ROW; j++) {
			printf "%s ", disp_cell[i, j]
		}
		term_cursor_down(1)
		term_cursor_left(BOARD_ROW * 2)
	}

	print ""
	print "Left of Mine :", mine_num - flag_num
}

function open(row, col) {
	disp_cell[row, col] = cell[row, col]
	open_cell_num++

	if (cell[row, col] == "*")  {
		explosion()
	} else if (cell[row, col] == "-")  {
		if (cell[row - 1, col    ] != "*" && disp_cell[row - 1, col    ] == "X") {
			open(row - 1, col    )
		}
		if (cell[row + 1, col    ] != "*" && disp_cell[row + 1, col    ] == "X") {
			open(row + 1, col    )
		}
		if (cell[row    , col - 1] != "*" && disp_cell[row    , col - 1] == "X") {
			open(row    , col - 1)
		}
		if (cell[row    , col + 1] != "*" && disp_cell[row    , col + 1] == "X") {
			open(row    , col + 1)
		}
	}
}

function explosion() {
	for (i = 1; i <= BOARD_ROW; i++) {
		for (j = 1; j <= BOARD_ROW; j++) {
			if (cell[i, j] == "*") {
				disp_cell[i, j] = cell[i, j]
			}
		}
	}

	lose = 1
	exit 0
}

function judge_win() {
	if (open_cell_num == BOARD_ROW * BOARD_COL - mine_num) {
		win = 1
		exit 0
	}
}

function toggle_flag(row, col) {
	if (disp_cell[row, col] == "X") {
		disp_cell[row, col] = "F"
		flag_num++
	} else if (disp_cell[row, col] == "F") {
		disp_cell[row, col] = "X"
		flag_num--
	}
}

function set_cell(    i, j) {
	srand()
	for (i = 1; i <= BOARD_ROW; i++) {
		for (j = 1; j <= BOARD_ROW; j++) {
			if (rand() * 100 <= MINE_PERCENT) {
				cell[i, j] = "*"
				mine_num++
			}
			disp_cell[i, j] = "X"
		}
	}

	for (i = 1; i <= BOARD_ROW; i++) {
		for (j = 1; j <= BOARD_ROW; j++) {
			if (cell[i, j] != "*") {
				n = 0
				if (cell[i - 1, j - 1] == "*") n++
				if (cell[i - 1, j    ] == "*") n++
				if (cell[i - 1, j + 1] == "*") n++
				if (cell[i    , j - 1] == "*") n++
				if (cell[i    , j + 1] == "*") n++
				if (cell[i + 1, j - 1] == "*") n++
				if (cell[i + 1, j    ] == "*") n++
				if (cell[i + 1, j + 1] == "*") n++
				cell[i, j] = n ? n : "-"
			}
		}
	}
}

END {
	display()

	ORS = "\r\n"
	if (win) {
		term_fg_color("green")
		print ""
		print "*************************"
		print "*                       *"
		print "*   Mission complete.   *"
		print "*                       *"
		print "*    You win.  (^o^)    *"
		print "*                       *"
		print "*************************"
		print ""
		print ""
	} else if (lose) {
		term_fg_color("red")
		print ""
		print "!!!!!!!!!!!!!!!!!!!!!!!!!"
		print "!                       !"
		print "!   A mine exploded!!   !"
		print "!                       !"
		print "!    You lose. (>_<)    !"
		print "!                       !"
		print "!!!!!!!!!!!!!!!!!!!!!!!!!"
		print ""
		print ""
	} else {
		term_fg_color("cyan")
		print ""
		print "Quit the game...         "
		print ""
		print ""
	}

	term_finish()
}
