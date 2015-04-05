class Post < ActiveRecord::Base

  validates :title, :article, presence: true

  belongs_to :user
end
