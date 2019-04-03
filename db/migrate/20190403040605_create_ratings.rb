class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :community
      t.integer :purpose
      t.integer :selfbenefit
      t.integer :application
      t.text :details
      t.references :org, foreign_key: true

      t.timestamps
    end
  end
end
