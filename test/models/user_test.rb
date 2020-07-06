require 'test_helper'

class UserTest < ActiveSupport::TestCase
self.use_instantiated_fixtures = true   # for l 24 to work

  def setup
    @user = User.new(pseudo: 'test', email:'test@gmail.com',
                     password:'password', password_confirmation: 'password',
                     admin: false)
  end

  test "should count 2 user fixtures" do
    assert_equal 2, User.count
    assert_equal 2, users.length
  end

  test "shoul get the expected user fixture pseudo" do
    assert_equal "michelchardou", users(:michel).pseudo
    assert_equal "michelchardou", @michel.pseudo
  end

  test "should raise error if fixture name doesn't exist" do
    assert_raise(StandardError) { users(:nicolas) }
  end

  test "should be valid" do
    assert @michel.valid?
    assert @user.valid?
  end

  test "no pseudo should be valid" do
    @michel.pseudo = ''
    assert @michel.valid?
  end

  test "pseudo should not be too long" do
    @user.pseudo = 'a' * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = 'a'*250 << '@gmail.com'
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn ..abc@gmail.com ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do #user@example,com should not be valid !!
    invalid_addresses = %w[user.com @example.com example.com user@example,com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should not be valid"
    end
  end

  test "email address should be unique" do
    @user.email = 'mich@chardou.com'
    assert_not @user.valid?
  end

  test "email addresses should be saved lowercase" do
    @user.email = 'Eggh4TEZ@Gmail.cOm'
    @user.save
    assert @user.email == @user.email.downcase
  end

  test "password should equal confirmation " do
    @user.password_confirmation = '123456'
    assert_not @user.valid?
  end

  test "password should reject if not equal to confirmation" do
    @user.password_confirmation = '123456'
    assert_not @user.save
  end

  test "password should be present (non_blank)" do
    @user.password = ' ' * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = 'a' * 5
    assert_not @user.valid?
  end

  test "should not destroy participations when destroying user" do
  end

  test "should (not?) destroy answers when destroying user" do
  end

  test "should compute percentage of good answers" do
    # @michel.percentages
  end

end
