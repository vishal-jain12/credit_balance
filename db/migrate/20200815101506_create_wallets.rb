class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.string :total_amount

      t.timestamps
    end
  end
end
