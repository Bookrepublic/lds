class Sponsor < ActiveRecord::Base

  has_many :sponsor_videos, dependent: :destroy
  has_many :videos, through: :sponsor_videos

  def full_name
    [first_name, last_name].join(" ")
  end

  def avatar_url
    read_attribute(:avatar_file_name).present? ? avatar.url : "http://placehold.it/210x280"
  end

end
