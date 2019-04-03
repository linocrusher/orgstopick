class ChangeTypeName < ActiveRecord::Migration[5.1]
  def change
    rename_column :orgs, :type, :scope
  end
end
