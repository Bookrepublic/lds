class PubblicationWriter < ActiveRecord::Base
  belongs_to :pubblication
  belongs_to :writer
end
