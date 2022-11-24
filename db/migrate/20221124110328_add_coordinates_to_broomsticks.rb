class AddCoordinatesToBroomsticks < ActiveRecord::Migration[7.0]
  def change
    add_column :broomsticks, :latitude, :float
    add_column :broomsticks, :longitude, :float
  end
end
