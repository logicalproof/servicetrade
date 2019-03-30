username = ENV["SERVICETRADE_USERNAME"] #set a valid username in .env
password = ENV["SERVICETRADE_PASSWORD"] #set a valid password in .env
sa = Servicetrade::Authenticator.new username, password
sa.get_auth_token

resource = Servicetrade::TagInterface.new
resource_interface = Servicetrade::ApiInterface.new(resource)
resource.id = 225396

# get one tag
resource_interface.get

resource = Servicetrade::Tag.new
resource_interface = Servicetrade::ApiInterface.new(resource)
# get all tags
resource_interface.get
%w(
Resources to implement
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
Deficiency - in progress
EULA
ExternalId
ExternalSync
Heartbeat
History
Import
Invoice
Invoice Item
Job - complete
Job Context
JobItem
LegacyLookup
LibItem
Location - complete
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
Tag - complete
Tax Rate
Terms
Token
User
User Value
Warehouse
Webhook)


