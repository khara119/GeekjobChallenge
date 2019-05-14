str = 'きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます'

# 置換メソッドで変換して表示
puts str.gsub(/I/, 'い').gsub(/U/, 'う')

### 別解（ループで頑張る）
str.each_char { |c|
	if c == 'I'
		c = 'い'
	elsif c == 'U'
		c = 'う'
	end

	print c
}
### ここまで
