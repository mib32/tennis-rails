class AddFeedbackEmailToOptions < ActiveRecord::Migration
  def change
    add_column :options, :feedback_email, :string
  end
end
