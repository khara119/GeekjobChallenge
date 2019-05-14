class Profile
	def initialize(name='no name', birthday='1900/01/01', introduction='')
		@name = name
		@birthday = birthday
		@introduction = introduction
	end

	def setName(name)
		@name = name
	end

	def setBirthday(birthday)
		@birthday = birthday
	end

	def setIntroduction(introduction)
		@introduction = introduction
	end

	def getName
		return @name
	end

	def getBirthday
		return @birthday
	end

	def getIntroduction
		return @introduction
	end

	def print
		puts @name
		puts @birthday
		puts @introduction
	end
end

profile = Profile.new('原昂平', '1992/06/09', 'MIL開発してます')
profile.print

profile.setName('山田太郎')
puts profile.getName

profile.setBirthday('1988/12/21')
puts profile.getBirthday

profile.setIntroduction('何もしてません')
puts profile.getIntroduction

profile.print

