class AddFixedPriceContract < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :is_fixed_price, :boolean, :default => false
    Contract.update_all( :is_fixed_price => false )
  end
end
