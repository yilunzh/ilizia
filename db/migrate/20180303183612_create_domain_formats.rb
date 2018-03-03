class CreateDomainFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :domain_formats do |t|
      t.string :domain_url
      t.string :format
      t.string :status
      t.integer :score

      t.timestamps
    end

  create_table :person_searches_domain_formats, id: false do |t|
    t.belongs_to :person_search, index: true
    t.belongs_to :domain_format, index: true
  end
  end
end
