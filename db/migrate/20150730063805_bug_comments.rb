class BugComments < ActiveRecord::Migration
  def self.up
    create_table :bug_comments do |t|

      t.column :comment, :string, :null => false
      t.column :created_by, :integer
      t.column :bug_id, :integer
      t.column :status, :string
      t.column :created_at, :timestamp

    end

  end

  def self.down
    drop_table :bug_comments
  end
end
