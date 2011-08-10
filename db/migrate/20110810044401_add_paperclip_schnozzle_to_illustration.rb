class AddPaperclipSchnozzleToIllustration < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :illustration_file_name, :string
    add_column :illustrations, :illustration_content_type, :string
    add_column :illustrations, :illustration_file_size, :integer
  end

  def self.down
    remove_column :illustrations, :illustration_file_name
    remove_column :illustrations, :illustration_content_type
    remove_column :illustrations, :illustration_file_size
  end
end
