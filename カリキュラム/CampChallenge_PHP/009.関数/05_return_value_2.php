<?php
	function getProfile() {
		return array("MIL-004", "原昂平", "東京都xxx区");
	}

	$profile = getProfile();
	for ($i=1; $i<3; $i++) {
		echo $profile[$i] . "<br>\n";
	}

