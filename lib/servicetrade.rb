require "servicetrade/version"

module Servicetrade
  @@auth_token = "none"

  def self.set_auth_token=(token_string)
    @@auth_token = token_string
  end

  def self.auth_token
    @@auth_token
  end

  def self.endpoint_host
    'https://api.servicetrade.com/api'
  end

  require 'time'
  require 'restclient'
  require 'json'

  require 'servicetrade/api_interface'
  require 'servicetrade/authenticator'
  require 'servicetrade/response_processor'
  require 'servicetrade/resource_interface'
  require 'servicetrade/resources/tag_interface'
  require 'servicetrade/resources/job_interface'
  require 'servicetrade/resources/deficiency_interface'
  require 'servicetrade/resources/location_interface'
  require 'servicetrade/resources/clock_event_interface'


end
