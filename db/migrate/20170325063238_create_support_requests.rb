class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.string :title
      t.references :creator, index: true
      t.references :handler, index: true 
      t.references :product, index: true, foreign_key: true
      t.references :request_state, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :support_requests, :users, column: :creator_id
    add_foreign_key :support_requests, :users, column: :handler_id
  end
end
