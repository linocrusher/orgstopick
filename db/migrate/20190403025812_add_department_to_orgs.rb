class AddDepartmentToOrgs < ActiveRecord::Migration[5.1]
  def change
    add_column :orgs, :department, :string
  end
end
