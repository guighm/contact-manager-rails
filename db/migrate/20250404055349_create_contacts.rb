class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.references :company, null: false, foreign_key: true
      t.datetime :birthday
      t.text :notes

      t.timestamps
    end
  end
end
