class SetUpTables < ActiveRecord::Migration
  def self.up
  
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
    end

    
    create_table :illustrations do |t|
      t.string :path
      t.timestamps
    end
    
    create_table :titles do |t|
      t.string :title
      t.timestamps
    end
     
    create_table :covers do |t|
      t.references :illustration
      t.references :title
      t.timestamps
    end
  end

  def self.down
    drop_table :covers
    drop_table :titles
    drop_table :illustrations
    
    change_table :users do |t|
      t.remove :first_name
      t.remove :last_name
    end
    
  end
end
