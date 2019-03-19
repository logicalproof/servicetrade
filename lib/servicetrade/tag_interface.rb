
module Servicetrade
  
  class TagInterface
    def get_all   
      begin
        response = RestClient.get 'https://api.servicetrade.com/api/tag', 
                        {  
                          cookies: {
                            PHPSESSID: Servicetrade.auth_token}, 
                            params: {
                                  counts: true
                              #currently there is no way to query officeIds, this list must be hardcoded.
                            }
                          }                    
      rescue => error
        print error
        print "Error Not Authorized"  
      end
      parsed_response = JSON.parse(response.body)["data"]
      tags = parsed_response["tags"]
      if parsed_response["totalPages"] > 1
        2.upto(parsed_response["totalPages"]) do |n|
          begin
            response = RestClient.get 'https://api.servicetrade.com/api/tag', 
                            {  
                              cookies: {
                                PHPSESSID: Servicetrade.auth_token}, 
                                params: {
                                  counts: true,
                                  page: n
                                  #currently there is no way to query officeIds, this list must be hardcoded.
                                }
                              }                    
          rescue => e
            print e
            print "Error Not Authorized"  
          end
          tags += JSON.parse(response.body)["data"]["tags"]
        end
      else
      end 
      tags
    end
    
  end
end
