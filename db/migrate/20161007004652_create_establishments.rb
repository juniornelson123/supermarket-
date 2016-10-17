class CreateEstablishments < ActiveRecord::Migration[5.0]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
