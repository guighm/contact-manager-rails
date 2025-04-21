class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.string :phone
      t.string :email
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
