class AddUserForeignKeyToBroomsticks < ActiveRecord::Migration[7.0]
  def change
    add_reference :broomsticks, :user, foreign_key: true
  end
end
