class AddCountryToBroomsticks < ActiveRecord::Migration[7.0]
  def change
    add_column :broomsticks, :country, :string
  end
end
