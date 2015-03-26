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
