class AddSpeedToBroomsticks < ActiveRecord::Migration[7.0]
  def change
    add_column :broomsticks, :speed, :integer
    add_column :broomsticks, :stability, :integer
    add_column :broomsticks, :price, :integer

    remove_column :broomsticks, :rating
  end
end
