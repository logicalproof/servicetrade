require "servicetrade/version"

module Servicetrade
  @@auth_token = "none"

  def self.set_auth_token=(token_string)
    @@auth_token = token_string
  end

  def self.auth_token
    @@auth_token
  end

  require 'time'
  require 'restclient'
  require 'json'

  require 'servicetrade/tags'
  require 'servicetrade/authenticator'
  require 'servicetrade/response_processor'
end
