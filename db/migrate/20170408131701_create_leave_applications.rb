class CreateLeaveApplications < ActiveRecord::Migration
  def change
    create_table :leave_applications do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :leave_type
      t.integer :session_name
      t.boolean :status
      t.string :reason
      t.references :user

      t.timestamps null: false
    end
    add_index :leave_applications, :user_id
    add_index :leave_applications, :status
  end
end
