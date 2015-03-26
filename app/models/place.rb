# == Schema Information
#
# Table name: places
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  active        :boolean
#  city_id       :integer
#  alcohol       :boolean
#  location_info :text(65535)
#  hours         :text(65535)
#  how_enter     :text(65535)
#  food          :boolean
#  waterbowl     :boolean
#  useful_tips   :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  has_wifi      :boolean
#

class Place < ActiveRecord::Base
  belongs_to :city
  has_many :photos, as: :imageable, dependent: :destroy

  validates :name, presence: true
  validates :city_id, presence: true
end
