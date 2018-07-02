require './controllers/input_form_controller.rb'
require './controllers/input_form_save_controller.rb'

use Rack::Session::Cookie,
secret: 'geek_job'
use Rack::Reloader, 0
Encoding.default_external = 'UTF-8'

map '/' do
	run InputFormController.new
end

map '/save' do
	run InputFormSaveController.new
end
