require "test_helper"

class Track::MaintainershipTest < ActiveSupport::TestCase
  test "track" do
    track = create :track
    maintainership = create :track_maintainership, track: track

    assert_equal track, maintainership.track
  end

  test "maintainer" do
    maintainer = create :user
    maintainership = create :track_maintainership, maintainer: maintainer

    assert_equal maintainer, maintainership.maintainer
  end
end
