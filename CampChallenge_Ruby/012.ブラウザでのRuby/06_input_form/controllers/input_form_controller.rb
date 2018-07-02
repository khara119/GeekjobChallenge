require 'rubygems'
require 'rack'

class InputFormController
	def call(env)
		request = Rack::Request.new(env)
		@name = request.session['name']
		@name = '' if @name.nil?

		@gender = request.session['gender']
		@gender = 0 if @gender.nil?

		@hobby = request.session['hobby']
		@hobby = '' if @hobby.nil?

		@is_saved = false
		Rack::Response.new(render("input_form.html.erb"))
	end

	def render(template)
		path = File.expand_path("../../views/#{template}", __FILE__)
		ERB.new(File.read(path)).result(binding)
	end
end
