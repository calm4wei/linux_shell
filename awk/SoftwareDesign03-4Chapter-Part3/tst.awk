BEGIN {
	print "start"
	for (i = 0; i < 10; i++)
		sum += i
	avg = sum / 10
	print avg
	print "end"
}
