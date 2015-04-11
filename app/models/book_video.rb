class BookVideo < ActiveRecord::Base
  belongs_to :book
  belongs_to :video
end
