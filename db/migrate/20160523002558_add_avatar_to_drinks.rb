class AddAvatarToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :avatar, :string
  end
end
