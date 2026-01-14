class AddRecurringContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :recurring_frequency, :integer, :default => 0
    add_column :contracts, :series_id, :integer
  end
end
