<?php
	$before = array('I', 'U');
	$after = array('い', 'う');

	$text = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";

	echo str_replace($before, $after, $text);
