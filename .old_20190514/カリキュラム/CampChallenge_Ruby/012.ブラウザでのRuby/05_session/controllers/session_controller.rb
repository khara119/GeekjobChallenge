require 'rubygems'
require 'rack'

class SessionController
	def call(env)
		request = Rack::Request.new(env)
		@time = request.session["access"]
		request.session["access"] = Time.now
		Rack::Response.new(render("session.html.erb"))
	end

	def render(template)
		path = File.expand_path("../../views/#{template}", __FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
