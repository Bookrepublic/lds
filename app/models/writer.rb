class Writer < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_many :pubblication_writers
  has_many :pubblications, through: :pubblication_writers
end
