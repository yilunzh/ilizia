class CreateDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :domains do |t|
      t.string :domain_url
      t.string :company_name

      t.timestamps
    end
  end
end
