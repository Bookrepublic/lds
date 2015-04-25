class Pubblication < ActiveRecord::Base
  validates :title, presence: true
end
