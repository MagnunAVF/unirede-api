class ApplicationController < ActionController::API
  before_action :set_cors_in_response_headers

  include Response
  include ExceptionHandler

  def set_cors_in_response_headers
    response.set_header('Access-Control-Allow-Origin', '*')
    response.set_header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept')
  end
end
