require 'rubygems'

class AmazonEmail
  include AmazonDeliver
  
  attr_accessor :from, :to, :subject, :body, :aws_access_key, :aws_secret_key  
  
  def initialize(options)
    @from = options[:from]
    @to = options[:to]
    @subject = options[:subject] || "Hello"
    @body = options[:body] || "I don't know why someone would send you a empty email but they did"
    @aws_access_key = options[:aws_access_key] || ENV['AWS_ACCESS_KEY']
    @aws_secret_key = options[:aws_secret_key] || ENV['AWS_SECRET_KEY']
  end
   
  def send
    AmazonDeliver.get(self)
  end
  
end