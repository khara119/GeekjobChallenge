hash = {"1" => "AAA", "hello" => "world",
	"soeda" => "33", "20" => "20"}

hash.each { |key, value|
	puts "キーに" + key + "、要素は" + value + "です。"
}
