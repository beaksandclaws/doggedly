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
end
