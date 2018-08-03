<?php
	date_default_timezone_set("Asia/Tokyo");
	$timestamp = mktime(10, 0, 0, 11, 4, 2016);
	echo date("Y-m-d H:i:s", $timestamp);
