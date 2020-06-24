#!/bin/sh
($1 compare -metric mae $2 $3_result.png $3_diff.png && printf "\nTest '%s' successful!\n" $3) || printf "\nTest '%s' failed!\n" $3