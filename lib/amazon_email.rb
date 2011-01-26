require 'rubygems'

class AmazonEmail
  
  attr_accessor :from, :to, :subject, :body  
  
  def initialize(from, to, subject, body)
    @from = from
    @to = to
    @subject = subject
    @body = body
  end
  
end