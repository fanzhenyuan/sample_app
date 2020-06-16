require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end 
  
  test "should get home" do
    #先访问 URL
    get root_url
    #200 OK
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  
  test "shoule get about" do 
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  
  test "should get Contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end

end
