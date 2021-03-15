require './config/environment'
use Rack::MethodOverride
use PostController
run ApplicationController