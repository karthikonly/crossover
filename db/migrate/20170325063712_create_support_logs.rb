class CreateSupportLogs < ActiveRecord::Migration
  def change
    create_table :support_logs do |t|
      t.string :content
      t.references :agent, index: true
      t.references :support_request, index: true

      t.timestamps null: false
    end
  end
end
