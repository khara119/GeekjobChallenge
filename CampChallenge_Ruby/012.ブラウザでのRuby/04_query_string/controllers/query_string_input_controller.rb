require 'rubygems'
require 'rack'

class QueryStringInputController
	def call(env)
		Rack::Response.new(render("query_string_input.html.erb"))
	end

	def render(template)
		path = File.expand_path("../../views/#{template}", __FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
