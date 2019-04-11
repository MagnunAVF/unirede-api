module Response
  extend ActiveSupport::Concern

  def json_response(object, status = :ok)
    render json: object, except: [:password, :password_digest], status: status
  end
end