require File.dirname(__FILE__) + '/test_helper.rb'

class AmazonSesTest < Test::Unit::TestCase
  
  #There are two ways to send emails.
  #One WITHOUT a .erb template
  #One WITH a .erb template
  
  def setup
    options_1 = { 
      :from => 'from@email.com', 
      :to => 'to@email.com', 
      :subject => 'This is the subject of the email', 
      :body => "This is the body of the email", 
      :aws_access_key => "access_key_id",
      :aws_secret_key => "secret_access_key"
    }
      
    options_2 = { 
      :from => 'from@email.com', 
      :to => 'to@email.com', 
      :subject => 'This is the subject of the email',  
      :aws_access_key => "access_key_id",
      :aws_secret_key => "secret_access_key",
      :template => File.new("sample_email.erb").read
    }
    
    @first_email = AmazonEmail.new(options_1)
    @second_email = AmazonEmail.new(options_2)
  end
  
  def test_email_has_correct_data
    assert @first_email.from == "from@email.com"
    assert @first_email.to == "to@email.com"
    assert @first_email.subject == "This is the subject of the email"
    assert @first_email.body == "This is the body of the email"
    assert @first_email.aws_access_key == "access_key_id"
    assert @first_email.aws_secret_key == "secret_access_key"
  end
  
  def test_amazon_email_without_template
    #@first_eamail.send
  end
  
  def test_amazon_email_with_template
    #@second_email.send
  end

  
end