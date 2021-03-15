require './config/environment'
use Rack::MethodOverride
use MessageController
use PostController
run ApplicationController