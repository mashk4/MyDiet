class ApplicationController < ActionController::Base
  include Authorization
  include ErrorHandling
end
