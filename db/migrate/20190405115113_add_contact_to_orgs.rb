class AddContactToOrgs < ActiveRecord::Migration[5.1]
  def change
      add_column :orgs, :contact, :text
  end
end
