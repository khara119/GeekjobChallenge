<?php
	/**
	 * @param number $num 整数
	 * return boolean 偶数: true, 奇数: false
	 */
	function judgeOddEven($num) {
		return $num%2 == 0;
	}

	$num = rand(1, 100);

	echo $num . "<br>\n";
	echo judgeOddEven($num) ? "偶数" : "奇数";

