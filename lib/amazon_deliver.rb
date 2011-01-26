require 'rubygems'
require 'net/https'

class AmazonDeliver
  include AmazonAuthentication
  include AmazonUrlGenerator

  def self.get(amazon_email, aws_access_key, aws_private_key)
    resource = AmazonUrlGenerator.create_query(amazon_email.from, amazon_email.to, amazon_email.subject, amazon_email.body)

    date = Time.new.localtime.strftime("%a, %d %b %Y %H:%M:%S %Z")
    http = Net::HTTP.new("email.us-east-1.amazonaws.com", 443)
    http.use_ssl = true
    headers = {
      'Date' => date.to_s,
      'x-Amzn-Authorization' => "AWS3-HTTPS AWSAccessKeyId=#{aws_access_key}, Algorithm=HmacSHA1, Signature=#{AmazonAuthentication.key(aws_private_key, date)}"
    }

    http.start do |http|
      req = Net::HTTP::Get.new(resource, headers)
      response = http.request(req)
      resp = response.body
      p resp
    end
  end
   
end