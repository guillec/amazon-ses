module AmazonAuthentication
  DIGEST  = OpenSSL::Digest::Digest.new('sha1')
  
  def self.key(aws_private, date)
    hmac = OpenSSL::HMAC.digest(DIGEST, aws_private, date.to_s)
    # make ruby 1.9 compatible
    if RUBY_VERSION < '1.9'
      b64 = Base64.b64encode(hmac)
    else
      b64 = Base64.encode64(hmac)
    end
  end
  
end
