class Profile
	def printProfile
		puts "-----"
		puts "名前：原昂平"
		puts "生年月日：1992/06/09"
		puts "自己紹介：MIL開発してます"
		puts "-----"

		return true
	end
end

profile = Profile.new

10.times { |n|
	if profile.printProfile
		puts "この処理は正しく実行できました。"
	else
		puts "正しく時刻できませんでした"
	end
}
