class AddAttachmentFileToNews < ActiveRecord::Migration[5.0]
  def self.up
    change_table :news do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :news, :file
  end
end
