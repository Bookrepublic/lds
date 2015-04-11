class AddAttachmentAvatarToSponsors < ActiveRecord::Migration
  def self.up
    change_table :sponsors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :sponsors, :avatar
  end
end
