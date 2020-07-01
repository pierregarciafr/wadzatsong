require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  self.use_instantiated_fixtures = true

  def setup
    @playlist = Playlist.new
  end

  test "playlist should get its name" do
    assert_equal @french.name, "french"
  end

end
