
module Servicetrade

  class JobInterface

    def set_url_payload(verb,cookies={})
      url = Servicetrade.base_url
      case verb
      when "POST"
        url = "https://api.servicetrade.com/api/tag" + "/job/"
      when "GET"
        url = "https://api.servicetrade.com/api/tag" + "/job"
      when "PUT"
        url = "https://api.servicetrade.com/api/tag" + "/job"
      when "DELETE"
        raise "Not Allowed"
      else
        raise "Error"
      end
    end
  end

end