class AddContractIdToTimeEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :time_entries, :contract_id, :integer
  end
end
