# frozen_string_literal: true

require "openssl"
require "base64"
require "date"
require "json"

require_relative "license/boundary"
require_relative "license/version"

module Crash
  class License
    class Error < StandardError; end
    class ValidationError < Error; end

    class << self
      def encryption_key=(key)

      end
    end
  end
end