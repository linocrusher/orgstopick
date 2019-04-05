class AddRatingToOrg < ActiveRecord::Migration[5.1]
  def change
    add_column :orgs, :rating, :float
  end
end
