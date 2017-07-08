class RemoveAddNameToUsersFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :date_of_birth, :datetime
    add_column :users, :company, :string
  end
end
