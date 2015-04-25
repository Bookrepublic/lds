class Pubblication < ActiveRecord::Base
  validates :title, presence: true

  has_many :video_pubblications
  has_many :videos, through: :video_pubblications
  has_many :pubblication_writers
  has_many :writer, through: :pubblication_writers
end
