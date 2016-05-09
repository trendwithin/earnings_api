class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.string :company_symbol, null: false
      t.datetime :earnings_released_on, null: false
      t.string :earnings, null: false
      t.string :expectation
      t.string :earnings_last_q
      t.string :revenue

      t.timestamps null: false
    end
  end
end
