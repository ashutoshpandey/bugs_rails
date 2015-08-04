class BugUser < ActiveRecord::Migration
  def self.up
    create_table :bug_users do |t|

      t.column :bug_id, :integer
      t.column :user_id, :integer
      t.column :status, :string
      t.column :created_at, :timestamp

    end

  end

  def self.down
    drop_table :bug_users
  end
end
