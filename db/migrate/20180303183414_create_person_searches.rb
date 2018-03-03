class CreatePersonSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :person_searches do |t|
      t.string :first_name
      t.string :last_name
      t.string :domain_url

      t.timestamps
    end
  end
end
