class Track::Maintainership < ApplicationRecord
  belongs_to :track
  belongs_to :maintainer,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :maintainerships

  enum maintainer_type: { regular: 0, polyglot: 1 }, _suffix: :maintainer

  def maintainer_type
    super.to_sym
  end
end
