class CreateHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :hashtags do |t|
      t.string :names_list
      t.integer :score
      t.references :category, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
