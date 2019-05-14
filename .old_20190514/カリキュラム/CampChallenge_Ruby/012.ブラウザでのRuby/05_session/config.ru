require './controllers/session_controller.rb'

use Rack::Session::Cookie,
secret: Digest::SHA256.hexdigest(rand.to_s)
use Rack::Reloader, 0
Encoding.default_external = 'UTF-8'
map '/' do
	run SessionController.new
end
