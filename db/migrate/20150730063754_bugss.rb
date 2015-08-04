class Bugss < ActiveRecord::Migration
  def self.up
    create_table :bugss do |t|

      t.column :title, :string, :null => false
      t.column :description, :string
      t.column :severity, :string
      t.column :created_by, :integer
      t.column :project_id, :integer
      t.column :status, :string
      t.column :created_at, :timestamp

    end

  end

  def self.down
    drop_table :bugss
  end
end
