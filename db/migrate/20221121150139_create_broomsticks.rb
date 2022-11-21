class CreateBroomsticks < ActiveRecord::Migration[7.0]
  def change
    create_table :broomsticks do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
