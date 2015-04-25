class VideoWriter < ActiveRecord::Base
  belongs_to :video
  belongs_to :writer
end
