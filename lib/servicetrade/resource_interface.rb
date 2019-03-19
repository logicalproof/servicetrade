module Servicetrade

  class ResourceInterface

    def set_url_payload(verb,resource,cookies={})
      url = Servicetrade.base_url
      case verb
      when "POST"
        url = "https://api.servicetrade.com/api/" + resource
      when "GET"
        url = "https://api.servicetrade.com/api/" + resource
      when "PUT"
        url = "https://api.servicetrade.com/api/" + resource
      when "DELETE"
        raise "Not Allowed"
      else
        raise "Error"
      end
    end
  end

  def set_resource

end