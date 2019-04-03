class CreateOrgs < ActiveRecord::Migration[5.1]
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :acronym
      t.string :college
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
