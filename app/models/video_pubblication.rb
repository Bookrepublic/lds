class VideoPubblication < ActiveRecord::Base
  belongs_to :video
  belongs_to :pubblication
end
