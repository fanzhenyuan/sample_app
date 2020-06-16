require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

    #helper full_in
    test "full_title helper testen" do
        assert_equal full_title, "Ruby on Rails Tutorial Sample App"
        assert_equal full_title("Contact"), "Contact | Ruby on Rails Tutorial Sample App"
    end

end 
