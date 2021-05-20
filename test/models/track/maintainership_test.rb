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

  test "maintainer_type" do
    maintainership = create :track_maintainership

    assert_equal :regular, maintainership.maintainer_type
  end

  test "regular_maintainer?" do
    maintainership = create :track_maintainership, maintainer_type: :regular

    assert maintainership.regular_maintainer?
    refute maintainership.polyglot_maintainer?
  end

  test "regular_maintainer!" do
    maintainership = create :track_maintainership, maintainer_type: :polyglot

    maintainership.regular_maintainer!

    assert maintainership.regular_maintainer?
    refute maintainership.polyglot_maintainer?
  end

  test "polyglot_maintainer?" do
    maintainership = create :track_maintainership, maintainer_type: :polyglot

    assert maintainership.polyglot_maintainer?
    refute maintainership.regular_maintainer?
  end

  test "polyglot_maintainer!" do
    maintainership = create :track_maintainership, maintainer_type: :regular

    maintainership.polyglot_maintainer!

    assert maintainership.polyglot_maintainer?
    refute maintainership.regular_maintainer?
  end
end
