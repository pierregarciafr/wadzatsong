require 'test_helper'
require 'generators/user/user_generator'

class UserGeneratorTest < Rails::Generators::TestCase
  tests UserGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
