class Pubblication < ActiveRecord::Base
  validates :title, presence: true

  has_many :video_pubblications
  has_many :videos, through: :video_pubblications
  has_many :pubblication_writers
  has_many :writers, through: :pubblication_writers

  def title_writers
    "#{title} di %i{pubblication.wrtiers}"
  end
end
