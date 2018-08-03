require './controllers/query_string_input_controller.rb'
require './controllers/query_string_output_controller.rb'

use Rack::Reloader, 0
Encoding.default_external = 'UTF-8'
map '/' do
	run QueryStringInputController.new
end

map '/output' do
	run QueryStringOutputController.new
end
