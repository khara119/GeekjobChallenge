class Profile
	def getProfile(id)
		profiles = {
			1 => [1, '原昂平', '1992/06/09', '東京都'],
			2 => [2, '田中太郎', '1988/12/21', '北海道'],
			3 => [3, '花山花子', '2000/11/11', '沖縄県']
		}

		return profiles[id]
	end
end

# 表示用関数
def print(array)
	for i in 1..3
		puts array[i]
	end
end

profile = Profile.new
profile_array = profile.getProfile(1)
print(profile_array)

profile_array = profile.getProfile(2)
print(profile_array)

profile_array = profile.getProfile(3)
print(profile_array)


