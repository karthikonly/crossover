class AddStateToSupportLog < ActiveRecord::Migration
  def change
    add_reference :support_logs, :request_state, index: true
    add_foreign_key :support_logs, :request_states
  end
end
