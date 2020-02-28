class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :location
      t.integer :creator_id

      t.timestamps
    end
  end
end
