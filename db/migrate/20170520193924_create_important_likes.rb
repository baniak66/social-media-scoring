class CreateImportantLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :important_likes do |t|
      t.string :content
      t.integer :fin
      t.integer :mat
      t.integer :gro
      t.integer :hip

      t.timestamps
    end
  end
end
