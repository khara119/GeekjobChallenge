<?php
	function calc($a, $b=5, $flag=false) {
		$result = $a * $b;
		if ($flag) {
			$result *= $result;
		}

		echo $result . "<br>\n";
	}

	calc(10, 2, true);
	calc(10, 2);
	calc(10);
