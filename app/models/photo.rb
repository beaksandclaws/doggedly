# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  active         :boolean
#  imageable_type :string(255)
#  imageable_id   :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  image          :string(255)
#  approved       :boolean
#

class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :imageable, polymorphic: true
  mount_uploader :image, ImageUploader

  validates :imageable_type, presence: true
  validates :imageable_id, presence: true
  validates :user_id, presence: true
end
