class CreateUserAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :user_attendances do |t|
      t.date :present_date
      t.binary :picture, limit: 2.megabytes
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
