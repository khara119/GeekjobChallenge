<?php
	$num = rand(1, 3);
	// $num = 1;
	// $num = 2;
	// $num = 3;

	echo $num . "<br>\n";

	switch($num) {
		case 1:
			echo "one";
			break;
		case 2:
			echo "two";
			break;
		default:
			echo "想定外";
	}
