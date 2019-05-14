<?php
	date_default_timezone_set("Asia/Tokyo");
	function summary_log($fp, $func, $isStart = true) {
		$date = date("Y-m-d H:i:s");
		$status = $isStart ? "開始" : "終了";
		fwrite($fp, $date . ", " . $func . ", " . $status . "\n");
	}

	$fp = fopen("10_exec.log", 'w');

	summary_log($fp, "rand()");
	$num = rand(1, 10000);
	echo $num . "が選ばれました。<br>\n";
	summary_log($fp, "rand()", false);

	summary_log($fp, "explode()");
	$text = "晴れ,雨,曇り,雪";
	echo $text . "<br>\n";
	print_r(explode(",", $text));
	summary_log($fp, "explode()", false);
