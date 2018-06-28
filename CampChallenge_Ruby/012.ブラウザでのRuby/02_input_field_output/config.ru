require './controllers/input_field_controller.rb'
require './controllers/input_field_result_controller.rb'

use Rack::Reloader, 0
Encoding.default_external = 'UTF-8'
map '/' do
	run InputFieldController.new
end

map '/result' do
	run InputFieldResultController.new
end
