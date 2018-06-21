class Profile
	def initialize(name='no name', birthday='1900/01/01', introduction='')
		@name = name
		@birthday = birthday
		@introduction = introduction
	end

	def print
		puts @name
		puts @birthday
		puts @introduction
	end
end

profile1 = Profile.new('原昂平', '1992/06/09', 'MIL開発してます')
profile1.print

profile2 = Profile.new('原昂平', '1992/06/09')
profile2.print

profile3 = Profile.new('原昂平')
profile3.print

profile4 = Profile.new()
profile4.print

