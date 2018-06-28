require './controllers/input_field_controller.rb'
use Rack::Reloader, 0
Encoding.default_external = 'UTF-8'
map '/' do
	run InputFieldController.new
end
