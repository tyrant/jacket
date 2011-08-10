class ForeignKeysMightBeAnIdeaJustSaying < ActiveRecord::Migration
  def self.up
    change_table :illustrations do |t|
      t.references :user
    end
    
    change_table :titles do |t|
      t.references :user
    end
  end

  def self.down
    remove_column :illustrations, :user_id
    remove_column :titles, :user_id
  end
end
