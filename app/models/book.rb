class Book < ActiveRecord::Base

  validates :title, :description, presence: true

end
