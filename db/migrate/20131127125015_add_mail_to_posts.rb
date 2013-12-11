class AddMailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :email, :text
  end
end
