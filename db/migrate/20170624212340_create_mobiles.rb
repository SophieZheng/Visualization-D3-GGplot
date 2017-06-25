class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.integer :uid
      t.datetime :signup_dt
      t.string :auth_type
      t.integer :device
      t.datetime :dt

      t.timestamps null: false
    end
  end
end
