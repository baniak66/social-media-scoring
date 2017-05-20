class CreateWorkplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workplaces do |t|
      t.string :name
      t.integer :score
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
