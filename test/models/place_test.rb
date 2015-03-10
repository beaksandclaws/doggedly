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
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
