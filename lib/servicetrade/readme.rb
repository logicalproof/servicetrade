username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
sa = Servicetrade::Authenticator.new username, password
sa.get_auth_token

resource = Servicetrade::Job.new
resource_interface = Servicetrade::ResourceInterface.new(resource)

# get all jobs
resource_interface.get_all