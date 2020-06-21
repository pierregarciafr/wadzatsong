ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  class ActionDispatch::IntegrationTest # for chapter 10
    # login as a particular user
    def log_in_as(user)
      post user_session_path, params: { session: { email: user.email,
                                           encrypted_password: user.encrypted_password
                                           } }
    end
  end

end
