require "test_helper"

class Track::Maintainership::CreateTest < ActiveSupport::TestCase
  test "creates track maintainership" do
    track = create :track
    user = create :user

    Track::Maintainership::Create.(track, user, :regular)

    assert_equal 1, Track::Maintainership.count
    maintainership = Track::Maintainership.last

    assert_equal track, maintainership.track
    assert_equal user, maintainership.maintainer
    assert_equal :regular, maintainership.maintainer_type
    assert maintainership.visible
  end

  test "creates polyglot maintainership" do
    track = create :track
    user = create :user

    Track::Maintainership::Create.(track, user, :polyglot)

    assert_equal 1, Track::Maintainership.count
    maintainership = Track::Maintainership.last

    assert_equal track, maintainership.track
    assert_equal user, maintainership.maintainer
    assert_equal :polyglot, maintainership.maintainer_type
    assert maintainership.visible
  end

  test "idempotent" do
    track = create :track
    user = create :user

    assert_idempotent_command do
      Track::Maintainership::Create.(track, user, :regular)
    end
  end
end
