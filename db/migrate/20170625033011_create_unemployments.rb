class CreateUnemployments < ActiveRecord::Migration
  def change
    create_table :unemployments do |t|
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
