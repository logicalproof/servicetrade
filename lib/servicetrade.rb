require File.dirname(__FILE__) +  '/servicetrade/version.rb'

module Servicetrade

  def self.endpoint_host
    'https://api.servicetrade.com/api'
  end

  require 'time'
  require 'restclient'
  require 'json'

  require File.dirname(__FILE__) +  '/servicetrade/api_interface'
  require File.dirname(__FILE__) +  '/servicetrade/authenticator'
  require File.dirname(__FILE__) +  '/servicetrade/create_clock_event'
  require File.dirname(__FILE__) +  '/servicetrade/upload_attachment'
  require File.dirname(__FILE__) +  '/servicetrade/response_processor'
  require File.dirname(__FILE__) +  '/servicetrade/resource_interface'


  require File.dirname(__FILE__) +  '/servicetrade/resources/asset_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/asset_definition_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/tag_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/job_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/deficiency_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/location_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/clock_event_interface'
  require File.dirname(__FILE__) +  '/servicetrade/resources/service_request'
  require File.dirname(__FILE__) +  '/servicetrade/resources/service_recurrence'

  require File.dirname(__FILE__) +  '/servicetrade/actions/clock_in'
  require File.dirname(__FILE__) +  '/servicetrade/actions/clock_out'
  require File.dirname(__FILE__) +  '/servicetrade/actions/prepare_attachment'


end
