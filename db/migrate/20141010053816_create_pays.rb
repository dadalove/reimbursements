class CreatePays < ActiveRecord::Migration
  def change
    create_table :pays do |t|
      t.string :date
      t.string :payer
      t.integer :money
      t.string :description
      t.integer :paid
      t.string  :status
      t.timestamps
    end
  end
end
