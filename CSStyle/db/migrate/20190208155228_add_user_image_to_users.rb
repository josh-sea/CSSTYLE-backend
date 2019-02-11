class AddUserImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image, :string, default: 'https://images.unsplash.com/photo-1541873676-a18131494184?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80'
  end
end
