class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.belongs_to :topic
      t.belongs_to :user
      t.timestamps
    end
  end
end
