class Profile
	def getProfile(id)
		profiles = {
			1 => [1, '原昂平', '1992/06/09', nil],
			2 => [2, '田中太郎', '1988/12/21', '北海道'],
			3 => [3, '花山花子', '2000/11/11', '沖縄県']
		}

		return profiles[id]
	end

	def printProfile
		for i in 1..3
			profile = getProfile(i)

			next if profile[3].nil?

			for j in 1..3
				puts profile[j]
			end
		end
	end
end

# 表示用関数
def print(array)
	for i in 1..3
		puts array[i]
	end
end

profile = Profile.new
profile.printProfile
