class ReplacePrivacyInGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :private
    add_column :goals, :is_private, :boolean
    change_column :goals, :is_private, :boolean, null: false
  end
end
