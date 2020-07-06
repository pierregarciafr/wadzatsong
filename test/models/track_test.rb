require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # include Devise::Test::IntegrationHelpers
  self.use_instantiated_fixtures = true

  def setup
  end

  test "tracks count" do
    assert_equal 10, Track.count
  end

  test "track should get playlist" do
    assert_equal "french", @track_1.playlist.name
    assert_equal "french", @track_2.playlist.name
    assert_equal "french", @track_3.playlist.name
    assert_equal "french", @track_4.playlist.name
    assert_equal "french", @track_5.playlist.name
  end



end
