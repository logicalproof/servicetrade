require_relative "tags"
require_relative "../response_processor"
service_trade_client = ServiceTradeClient.new "nicksafe123", "1Hiller1"
service_trade_client.get_auth_token

tags = service_trade_client.get_tags
response_processor = ResponseProcessor.new
response_processor.process_tag_data(tags)