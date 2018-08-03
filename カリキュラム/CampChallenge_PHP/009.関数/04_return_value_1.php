<?php
	function introduction() {
		echo "名前: 原昂平<br>\n";
		echo "生年月日: 1992年06月09日<br>\n";
		echo "自己紹介: MIL開発してます。<br>\n";

		return true;
	}

	for ($i = 1; $i <= 10; $i++) {
		echo "=====<br>\n";
		if (introduction()) {
			echo "この関数は正しく実行できました。<br>\n";
		} else {
			echo "正しく実行できませんでした。<br>\n";
		}
		echo "=====<br>\n";
	}
