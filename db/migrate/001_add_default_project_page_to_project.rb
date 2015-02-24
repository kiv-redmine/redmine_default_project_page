 class AddDefaultProjectPageToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :default_project_page, :string, :default => nil
  end

  def self.down
    remove_column :projects, :default_project_page
  end
end