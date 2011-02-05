class TestClass < AmazonEmail
  
  def initialize(options)
    super(options)
    @name = "Test User"
    @more_data = "This is the part of the email in which I really dont know what to write about so I will leave this up to you"
  end
  
end