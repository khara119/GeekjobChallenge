class Judge
	def judge(num)
		return num.even? ? '偶数' : '奇数'
	end
end

judge = Judge.new

puts judge.judge(5)
puts judge.judge(10)
