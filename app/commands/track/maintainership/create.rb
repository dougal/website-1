class Track::Maintainership
  class Create
    include Mandate

    initialize_with :track, :maintainer, :maintainer_type

    def call
      Track::Maintainership.create_or_find_by!(track: track, maintainer: maintainer) do |c|
        c.maintainer_type = maintainer_type
      end
    end
  end
end
