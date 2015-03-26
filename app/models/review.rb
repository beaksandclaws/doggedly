# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  rating     :integer
#  active     :boolean
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates :user_id, presence: true
  validates :place_id, presence: true
  validates :rating, presence: true
end
