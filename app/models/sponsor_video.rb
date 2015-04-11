class SponsorVideo < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :video
end
