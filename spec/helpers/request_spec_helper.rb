module RequestSpecHelper
  def response_as_json
    JSON.parse(response.body)
  end
end