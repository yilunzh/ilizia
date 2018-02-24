class CreateEmailFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :email_formats do |t|
      t.belongs_to :domain, index:true
      t.string :format
      t.boolean :confirmed
      t.string :status
      t.integer :score

      t.timestamps
    end
  end
end
