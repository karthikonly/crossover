class CreateRequestStates < ActiveRecord::Migration
  def change
    create_table :request_states do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
