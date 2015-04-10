class Post < ActiveRecord::Base

  validates :title, :article, presence: true

  belongs_to :user

  scope :published, -> {
     where(status: true)
  }
end
