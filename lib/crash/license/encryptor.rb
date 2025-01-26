# frozen_string_literal: true

module Crash
  class License
    class Encryptor
      class Error < Crash::License::Error; end
      class KeyError < Error; end
      class DecryptionError < Error; end

      attr_reader :key

      def initialize(key)
        raise KeyError, "No RSA encryption key provided." if key && !key.is_a?(OpenSSL::PKey::RSA)

        @key = key
      end

      def encrypt(data)
        raise KeyError, "Provided key is not a private key." unless key.private?

        cipher = OpenSSL::Cipher.new("aes-128-cbc")
        cipher.encrypt
        aes_key = cipher.random_key
        aes_iv  = cipher.random_iv


      end
    end
  end
end