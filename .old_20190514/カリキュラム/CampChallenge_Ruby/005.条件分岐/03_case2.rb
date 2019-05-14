def func(char)
	case char
		when 'A'
			puts "英語"
		when 'あ'
			puts '日本語'
	end
end

char = 'A'
func(char)

char = 'あ'
func(char)

char = '1'
func(char)

