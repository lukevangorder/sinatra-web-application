require './config/environment'
use Rack::MethodOverride
use UserController
use MessageController
use PostController
run ApplicationController