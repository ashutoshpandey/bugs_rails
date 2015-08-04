class BugFiles < ActiveRecord::Migration
  def self.up
    create_table :bug_files do |t|

      t.column :file_name, :string, :null => false
      t.column :saved_file_name, :string
      t.column :bug_id, :integer
      t.column :status, :string
      t.column :created_at, :timestamp

    end

  end

  def self.down
    drop_table :bug_files
  end
end
