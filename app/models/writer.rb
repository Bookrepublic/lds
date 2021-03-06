class Writer < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_many :pubblication_writers, dependent: :destroy
  has_many :pubblications, through: :pubblication_writers
  has_many :video_writers, dependent: :destroy
  has_many :videos, through: :video_writers

  def to_s
    "#{first_name} #{last_name}"
  end

  def slug
    to_s.tr("àáÀÁèéÈÉìíÌÍòóÒÓùúÙÚ", "aaAAeeEEiiIIooOOuuUU").delete(" ").delete("'").downcase
  end
end
