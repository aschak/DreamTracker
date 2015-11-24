class AddDefaultToIsPrivate < ActiveRecord::Migration
  def change
    change_column :goals, :is_private, :boolean, default: false
  end
end
