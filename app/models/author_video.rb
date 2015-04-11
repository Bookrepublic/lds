class AuthorVideo < ActiveRecord::Base
  belongs_to :author
  belongs_to :video
end
