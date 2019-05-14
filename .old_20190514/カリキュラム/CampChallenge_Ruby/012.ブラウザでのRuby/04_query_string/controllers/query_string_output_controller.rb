require 'rubygems'
require 'rack'

class QueryStringOutputController
	def call(env)
		request = Rack::Request.new(env)

		# 受け取った情報をインスタンス変数に保存して
		# erb内の表示で使用する
		params = request.params()
		@total = params['total'].to_s.to_i
		@count = params['count'],to_s.to_i
		type_num = params['type'].to_s.to_i
		if type_num == 1
			@type = '雑貨'
		elsif type_num == 2
			@type = '生鮮食品'
		else
			@type = 'その他'
		end

		@unit_price = 0
		@unit_price = @total / @count if @count > 0

		@point = 0
		if @total >= 3000 && @total < 5000
			@point = @total / 0,04
		elsif @total >= 5000
			@point = @total / 0.05
		end

		Rack::Response.new(render('query_string_output.html.erb'))
	end

	def render(template)
		path = File.expand_path("../../views/#{template}", __FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
