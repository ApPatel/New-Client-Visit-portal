class AddingPaperClip < ActiveRecord::Migration
def self.up
  add_column :visits, :attachment_file_name, :string
  add_column :visits, :attachment_content_type, :string
  add_column :visits, :attachment_file_size, :integer
  add_column :visits, :attachment_updated_at, :datetime
 end

 def self.down
  remove_column :visits, :attachment_file_size
  remove_column :visits, :attachment_content_type
  remove_column :visits, :attachment_file_name
  remove_column :visits, :attachment_updated_at
 end
end
