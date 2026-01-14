class AddPrecisionToHourlyRate < ActiveRecord::Migration[6.1]
  def up
    change_column :contracts, :hourly_rate, :decimal, :precision => 16, :scale => 2
  end
end
