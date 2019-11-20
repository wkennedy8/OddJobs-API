class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.date :card_exp_date
      t.string :card_cvc_number
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
