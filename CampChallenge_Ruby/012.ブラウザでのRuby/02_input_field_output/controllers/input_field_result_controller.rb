require 'rubygems'
require 'rack'

class InputFieldResultController
	def call(env)
		request = Rack::Request.new(env)

		# 受け取った情報をインスタンス変数に保存して
		# erb内の表示で使用する
		@params = request.params()
		Rack::Response.new(render('input_field_result.html.erb'))
	end

	def render(template)
		path = File.expand_path("../../views/#{template}", __FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
