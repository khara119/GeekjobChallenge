<?php
	require('07_utils.php');

	for ($i = 1; $i <= 10; $i++) {
		echo "=====<br>\n";
		if (introduction()) {
			echo "この関数は正しく実行できました。<br>\n";
		} else {
			echo "正しく実行できませんでした。<br>\n";
		}
		echo "=====<br>\n";
	}
