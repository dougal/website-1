class CreateTrackMaintainerships < ActiveRecord::Migration[6.1]
  def change
    create_table :track_maintainerships do |t|
      t.belongs_to :track, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false      
      t.boolean :visible, null: false, default: true
      t.column :maintainer_type, :tinyint, null: false

      t.timestamps

      t.index %i[track_id user_id], unique: true, name: 'uniq'
    end

    # TODO: import initial maintainers
  end
end
