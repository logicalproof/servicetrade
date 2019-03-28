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

  require 'servicetrade/resource_interface'
  require 'servicetrade/authenticator'
  require 'servicetrade/response_processor'
  require 'servicetrade/resource'
  require 'servicetrade/resources/job'
  require 'servicetrade/resources/tag'
  require 'servicetrade/resources/deficiency'
  require 'servicetrade/resources/location'
end
