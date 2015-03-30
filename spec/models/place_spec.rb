# == Schema Information
#
# Table name: places
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  city_id        :integer
#  alcohol        :boolean
#  location_info  :text(65535)
#  hours          :text(65535)
#  how_enter      :text(65535)
#  food           :boolean
#  waterbowl      :boolean
#  useful_tips    :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  has_wifi       :boolean
#  date_activated :datetime
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

RSpec.describe Place, '.recently_active' do

  it 'displays most recently active places' do
    city = create(:city, :with_places)

    sorted_places = city.places.sort_by { |x| [!(x.date_activated), x.name] }.shift(3)
    places = Place.where(city_id: city.id).recently_activated(3)

    expect(places).to eq sorted_places
  end

  it 'has default of 5' do
    city = create(:city, :with_places, number_of_places: 10)

    places = Place.recently_activated

    expect(places.count).to eq 5
  end

  it 'doesn\'t return inactive places' do
    city = create(:city, :with_places, number_of_places: 3)
    create_list(:place, 7, city: city, date_activated: nil)

    places = Place.where(city_id: city.id).recently_activated

    expect(places.count).to eq 3
  end



end
