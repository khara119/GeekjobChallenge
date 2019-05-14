class Profile
	def printProfile
		puts "-----"
		puts "名前：原昂平"
		puts "生年月日：1992/06/09"
		puts "自己紹介：MIL開発してます"
		puts "-----"
	end
end

profile = Profile.new

10.times { |n|
	profile.printProfile
}
