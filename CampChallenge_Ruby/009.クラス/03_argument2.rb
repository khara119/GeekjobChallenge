class Calc
	def multi(a, b=5, flag=false)
		ans = a * b
		ans *= ans if flag
		return ans
	end
end

calc = Calc.new

puts calc.multi(2, 3, true)
puts calc.multi(2, 3, false)
puts calc.multi(2, 3)
puts calc.multi(2)
