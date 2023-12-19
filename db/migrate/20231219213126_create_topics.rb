class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title

      t.timestamps
    end
    add_index :topics, :title, unique: true
  end
end
