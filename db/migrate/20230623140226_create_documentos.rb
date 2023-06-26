class CreateDocumentos < ActiveRecord::Migration[7.0]
  def change
    create_table :documentos do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps
    end
  end
end
