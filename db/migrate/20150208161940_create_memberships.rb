class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :member_email
      t.string :admin_email
      t.integer :amount
      t.string :quid

      t.timestamps
    end
  end
end
