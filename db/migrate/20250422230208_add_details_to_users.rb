class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :last_login_at, :datetime
  end
end
