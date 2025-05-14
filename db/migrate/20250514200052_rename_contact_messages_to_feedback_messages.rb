class RenameContactMessagesToFeedbackMessages < ActiveRecord::Migration[8.0]
  def change
    rename_table :contact_messages, :feedback_messages
  end
end
