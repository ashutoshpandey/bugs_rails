class Projects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|

      t.column :name, :string, :null => false
      t.column :description, :string
      t.column :created_by, :timestamp
      t.column :status, :string
      t.column :created_at, :timestamp

    end

  end

  def self.down
    drop_table :projects
  end
end
