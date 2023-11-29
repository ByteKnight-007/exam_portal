class CreateApiRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :api_requests do |t|
      t.text :request_params
      t.text :response
      t.datetime :request_time
      t.integer :status_code

      t.timestamps
    end
  end
end
