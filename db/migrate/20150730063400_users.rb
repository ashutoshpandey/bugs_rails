class Users < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

      t.column :name, :string, :null => false
      t.column :gender, :string
      t.column :status, :string
      t.column :created_at, :timestamp

    end

  end

  def self.down
    drop_table :users
  end
end
