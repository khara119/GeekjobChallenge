<?php
	$date1 = mktime(0, 0, 0, 1, 1, 2015);
	$date2 = mktime(23, 59, 59, 12, 31, 2015);

	echo $date2 - $date1;
