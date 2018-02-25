class CreateDomainEmailFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :domain_email_formats do |t|
      t.belongs_to :person_email_search, index:true
      t.string :format
      t.boolean :confirmed
      t.string :status
      t.integer :score

      t.timestamps
    end
  end
end
