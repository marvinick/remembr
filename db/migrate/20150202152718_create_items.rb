class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :creator
      t.text :description
      t.float :price
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
