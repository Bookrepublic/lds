class Pubblication < ActiveRecord::Base
  validates :title, presence: true

  has_many :video_pubblications, dependent: :destroy
  has_many :videos, through: :video_pubblications
  has_many :pubblication_writers, dependent: :destroy
  has_many :writers, through: :pubblication_writers

  def title_writers
    "#{title} di %i{pubblication.writers}"
  end

  def slug
    title.tr("àáÀÁèéÈÉìíÌÍòóÒÓùúÙÚ", "aaAAeeEEiiIIooOOuuUU").delete(" ").delete("'").downcase
  end
end
