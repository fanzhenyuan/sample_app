require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new( name: "fanzhenyuan", email: "fanyfan2020@hotmail.com", 
                      password: "foobar", password_confirmation: "foobar" )
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  
  #presence
  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end
  
  
  #length
  test "name length" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email length" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  #email valid/invalid
  test "email valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} valid"
    end
  end
  
  test "email invalid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} invalid"
    end 
  end
  
  #only database
  test "email unique" do
    duplicate_user = @user.dup 
    @user.save
    assert_not duplicate_user.valid?
  end
  
  #save_before
  test "save_before testen" do
    upcase_email = "FANyfan2020@Hotmail.com"
    @user.email = upcase_email
    @user.save 
    assert_equal upcase_email.downcase , @user.reload.email
  end
  
  #password presence min 6
  test "password presence" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password min 6" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  
  test "authenticate? return false when nil" do
    assert_not @user.authenticated?('')
  end
end
