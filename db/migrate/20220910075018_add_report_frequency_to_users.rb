class AddReportFrequencyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :report_frequency, :integer, default: 0, null: false
    add_index :users, :report_frequency
  end
end
