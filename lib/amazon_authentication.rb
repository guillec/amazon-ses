require 'rubygems'
require 'openssl'
require 'base64'

module AmazonAuthentication
  DIGEST  = OpenSSL::Digest::Digest.new('sha1')
  
  def self.key(aws_private, date)
    hmac = OpenSSL::HMAC.digest(DIGEST, aws_private, date.to_s)
    b64 = Base64.b64encode(hmac)
  end
  
end