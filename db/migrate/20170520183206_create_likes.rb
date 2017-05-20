class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.string :content
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
