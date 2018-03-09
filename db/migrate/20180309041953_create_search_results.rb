class CreateSearchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :search_results do |t|
      t.belongs_to :person_search, index: true
      t.string :email_address
      t.string :status
      t.string :sub_status
      t.string :account
      t.string :domain
      t.boolean :disposable
      t.boolean :toxic
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
