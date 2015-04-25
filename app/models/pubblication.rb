class Pubblication < ActiveRecord::Base
  validates :title, presence: true

  has_many :video_pubblications
  has_many :videos, through: :video_pubblications
end
