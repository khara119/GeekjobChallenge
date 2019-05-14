<?php
	$array = array("A", "あ", "1");
	$letter = $array[rand(0, 2)];
	// $num = "A";
	// $num = "あ";
	// $num = "1";

	echo $letter . "<br>\n";

	switch($letter) {
		case "A":
			echo "英語";
			break;
		case "あ":
			echo "日本語";
			break;
	}
