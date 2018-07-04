<?php
	function searchProfile($profiles, $str) {
		foreach ($profiles as $profile) {
			// strposは位置（数値）or falseを返すので、厳格チェックする
			if (strpos($profile[1], $str) !== false) {
				return $profile;
			}
		}

		return null;
	}

	$profiles = array(
		array("MIL-001", "ABC", "北海道"),
		array("MIL-002", "DEF", "沖縄"),
		array("MIL-003", "GHI", "香川"),
		array("MIL-004", "JKL", "東京"),
		array("MIL-005", "MNO", "石川"),
		array("MIL-006", "PQR", "佐賀")
	);

	// 検索文字列を自動生成する処理。
	// 課題と関係なし
	$length = rand(1, 3);
	$name_letters = "ABCDEFGHIJKLMNOPQR";
	$search_text = substr($name_letters, rand(0, iconv_strlen($name_letters)), $length);

	echo "検索文字列： " . $search_text . "<br>\n";

	$profile = searchProfile($profiles, $search_text);

	if (is_null($profile)) {
		echo "見つかりませんでした。";
	} else {
		for ($i=1; $i<3; $i++) {
			echo $profile[$i] . "<br>\n";
		}
	}
