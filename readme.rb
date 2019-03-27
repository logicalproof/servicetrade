username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
sa = Servicetrade::Authenticator.new username, password
sa.get_auth_token

resource = Servicetrade::Job.new
resource_interface = Servicetrade::ResourceInterface.new(resource)

# get all jobs
resource_interface.get_all

resource = Servicetrade::Tag.new(225396)
resource_interface = Servicetrade::ResourceInterface.new(resource)

200 request successful, response body contains results
204 request successful, empty response body
400 missing, incomplete or invalid parameters
401 unauthorized request
403 not allowed to perform action
404 requested URI not found
405 method not implemented
500 unknown application error


200 request successful, response body contains results
204 request successful, empty response body
400 missing, incomplete or invalid parameters
401 unauthorized request
403 not allowed to perform action
404 requested URI not found
405 method not implemented
500 unknown application error

Activity
Appointment
Asset
Asset Definition
Attachment
Authentication
Brand
Clockin/Clockout
Comment
Company
Contact
Contract
Contract Rule
Deficiency
EULA
ExternalId
ExternalSync
Heartbeat
History
Import
Invoice
Invoice Item
Job
Job Context
JobItem
LegacyLookup
LibItem
Location
MasterAgreement
Message
Quote
Quote Item
QuoteRequest
QuoteTemplate
QuoteTemplate Item
Region
Role
Service Item
Service Line
ServiceRecurrence
ServiceRequest
ServiceTemplate
Tag
Tax Rate
Terms
Token
User
User Value
Warehouse
Webhook


