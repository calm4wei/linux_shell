#!/bin/sh
BEGIN {
	FS=":"

}
$1 == "mysql"  { print }
