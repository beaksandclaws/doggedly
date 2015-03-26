# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  path           :string(255)
#  active         :boolean
#  imageable_type :string(255)
#  imageable_id   :integer
#  user_id        :integer
#  width          :integer
#  height         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Photo < ActiveRecord::Base
  # mount_uploader :photo, ImageUploader
  belongs_to :user
  belongs_to :imageable, polymorphic: true

  validates :path, presence: true
  validates :imageable_type, presence: true
  validates :imageable_id, presence: true
  validates :user_id, presence: true
  validates :width, presence: true
  validates :height, presence: true
end
