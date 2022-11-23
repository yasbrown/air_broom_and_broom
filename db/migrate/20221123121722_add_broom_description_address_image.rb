class AddBroomDescriptionAddressImage < ActiveRecord::Migration[7.0]
  def change
    add_column :broomsticks, :description, :string
    add_column :broomsticks, :address, :string
    add_column :broomsticks, :photo, :string
  end
end
