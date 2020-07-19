class Fixgroupmodel < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :contact_id, :integer
    add_column :groups, :contact_group_id, :integer
    add_column :contacts, :contact_group_id, :integer
  end
end
