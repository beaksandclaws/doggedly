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

require 'rails_helper'

RSpec.describe Place do

  it 'is valid' do
    place = build(:place)
    expect(place).to be_valid
  end

  it 'has a name' do
    place = build(:place, name: nil)
    expect(place).not_to be_valid
  end

  it 'belongs to a city' do
    place = build(:place, city_id: nil)
    expect(place).not_to be_valid
  end
end
