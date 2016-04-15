#!/bin/sh
BEGIN {
	FS=":"	
}

{
	if ($1 !~ /mysql/){
		print $0
	}
}

{
	if (NF > 2){
		print $1 " " $2
	}
}

{
	if (NR >= 3){
		print "you have exceed NR == 3"
	}
}
