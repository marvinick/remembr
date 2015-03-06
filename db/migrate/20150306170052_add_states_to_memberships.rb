class AddStatesToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :state, :string
    add_column :memberships, :stripe_id, :string
    add_column :memberships, :stripe_token, :string
    add_column :memberships, :error, :text
  end
end
