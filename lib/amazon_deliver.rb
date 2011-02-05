module AmazonDeliver

  def self.get(amazon_email)
    resource = AmazonUrlGenerator.create_query(amazon_email.from, amazon_email.to, amazon_email.subject, amazon_email.body)

    date = Time.new.localtime.strftime("%a, %d %b %Y %H:%M:%S %Z")
    http = Net::HTTP.new("email.us-east-1.amazonaws.com", 443)
    http.use_ssl = true
    headers = {
      'Date' => date.to_s,
      'x-Amzn-Authorization' => "AWS3-HTTPS AWSAccessKeyId=#{amazon_email.aws_access_key}, Algorithm=HmacSHA1, Signature=#{AmazonAuthentication.key(amazon_email.aws_secret_key, date)}"
    }

    http.start do |http|
      req = Net::HTTP::Get.new(resource, headers)
      response = http.request(req)
      resp = response.body
    end
  end
   
end