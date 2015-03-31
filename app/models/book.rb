class Book < ActiveRecord::Base

  validates :title, :description, presence: true

  belongs_to :collection
  has_attached_file :cover
  validates_attachment_content_type :cover, content_type: /\Aimage/

end
