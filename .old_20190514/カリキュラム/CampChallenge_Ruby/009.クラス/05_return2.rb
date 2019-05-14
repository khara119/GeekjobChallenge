class Profile
	def getProfile
		return [1, '原昂平', '1992/06/09', '東京都']
	end
end

profile = Profile.new
profile_array = profile.getProfile

for i in 1..3
	puts profile_array[i]
end
