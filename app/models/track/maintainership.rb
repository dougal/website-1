class Track::Maintainership < ApplicationRecord
  belongs_to :track
  belongs_to :maintainer,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :maintainerships

  enum type: { track: 0, polyglot: 1 }
end
