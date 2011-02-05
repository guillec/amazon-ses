module AmazonUrlGenerator
  def self.create_query(from, to, subject, body)
    "/?Action=SendEmail&Source=#{URI.escape(from, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}&Destination.ToAddresses.member.1=#{URI.escape(to, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}&Message.Subject.Data=#{URI.escape(subject, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}&Message.Body.Text.Data=#{URI.escape(body, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
  end
end