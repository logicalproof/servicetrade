require 'servicetrade'

username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
sa = Servicetrade::Authenticator.new username, password
sa.get_auth_token


resource = Servicetrade::LocationInterface.new
resource_interface = Servicetrade::ApiInterface.new(resource)

# add company id's to the companies array and run this script
companies = [ 80174,
              144874
            ]
location_objects = resource_interface.get({companyId: companies.join(',')})
location_ids = location_objects.map {|loc| loc["id"]}

location_ids.each do |loc|
  resource.id = loc
  resource_interface.put({taxable: false})
end


resource = Servicetrade::TagInterface.new
resource_interface = Servicetrade::ApiInterface.new(resource)

location_ids.each do |location_id|
  resource_interface.post({name: "TAX-EXEMPT", entityId: location_id, entityType: 11})
end