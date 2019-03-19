require "servicetrade/version"

module Servicetrade
  @@auth_token = "none"

  def self.set_auth_token=(token_string)
    @@auth_token = token_string
  end

  def self.auth_token
    @@auth_token
  end

  def self.base_url
    'https://api.servicetrade.com/api'
  end

  require 'time'
  require 'restclient'
  require 'json'

  require 'servicetrade/tag_interface'
  require 'servicetrade/job_interface'
  require 'servicetrade/authenticator'
  require 'servicetrade/response_processor'
end
