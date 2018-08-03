array = [10, 100, "soeda", "hayashi", -20, 118, "END"]

array.each { |item|
	puts '要素は' + item.to_s + 'です'
}
