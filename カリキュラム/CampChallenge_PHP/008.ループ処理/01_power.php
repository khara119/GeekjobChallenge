<?php
	$ans = 1;
	for ($i = 1; $i <= 20; $i++) {
		$ans *= 8;
	}

	// PHPの整数の最大値はプラットフォーム依存なので、
	// 結果が指数表記で出力される
	echo $ans;
