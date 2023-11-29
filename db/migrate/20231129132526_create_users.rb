class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :college, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.datetime :start_time

      t.timestamps
    end
  end
end
