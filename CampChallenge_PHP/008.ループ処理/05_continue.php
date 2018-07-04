<?php
	$nums = array(1, 2, 3, 4, 5, 6, 7, 8, 9);
	$format = "%3d";
	$border = "----";

	echo "    ";
	foreach($nums as $n) {
		if ($n == 5) {
			continue;
		}

		echo sprintf($format, $n);
		$border .= "---";
	}

	echo "<br>\n";
	echo $border . "<br>\n";

	foreach($nums as $a) {
		echo $a . " | ";

		foreach($nums as $b) {
			if ($b == 5) {
				continue;
			}

			echo sprintf($format, $a * $b);
		}

		echo "<br>\n";
	}
