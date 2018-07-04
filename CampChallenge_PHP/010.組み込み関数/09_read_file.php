<?php
	$fp = fopen("08_introduction.txt", 'r');
	if ($fp != false) {
		while (($line = fgets($fp))) {
			echo $line . "<br>\n";
		}

		fclose($fp);
	}
 
