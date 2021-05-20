FactoryBot.define do
  factory :track_maintainership, class: 'Track::Maintainership' do
    track do
      Track.find_by(slug: :ruby) || build(:track, slug: 'ruby')
    end

    maintainer { create :user }
    visible { true }
    type { :track }
  end
end
