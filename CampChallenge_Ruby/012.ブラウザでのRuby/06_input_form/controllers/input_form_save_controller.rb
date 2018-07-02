require 'rubygems'
require 'rack'

class InputFormSaveController
	def call(env)
		request = Rack::Request.new(env)
		params = request.params()

		request.session['name'] = params['name']
		@name = params['name']

		request.session['gender'] = params['gender']
		@gender = params['gender']

		request.session['hobby'] = params['hobby']
		@hobby = params['hobby']

		@is_saved = true
		Rack::Response.new(render("input_form.html.erb"))
	end

	def render(template)
		path = File.expand_path("../../views/#{template}", __FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
