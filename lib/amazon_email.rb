class AmazonEmail
  include AmazonDeliver
  
  attr_accessor :from, :to, :subject, :body, :template, :aws_access_key, :aws_secret_key  
  
  def initialize(options)
    @from = options[:from]
    @to = options[:to]
    @subject = options[:subject]
    @body = options[:body]
    @template = options[:template]
    @aws_access_key = options[:aws_access_key] || ENV['AWS_ACCESS_KEY']
    @aws_secret_key = options[:aws_secret_key] || ENV['AWS_SECRET_KEY']   
  end
  
  def get_binding
    binding
  end 
   
  def send
    if self.template
      self.body = ERB.new(self.template).result(self.get_binding)
    end
    AmazonDeliver.get(self)
  end
  
end