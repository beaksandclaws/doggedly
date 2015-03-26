# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe City do
  it 'is valid' do
    city = build(:city)
    expect(city).to be_valid
  end

  it 'name cannnot be null' do
    city = build(:city, name: nil)
    expect(city).not_to be_valid
  end

  it 'state cannnot be null' do
    city = build(:city, state: nil)
    expect(city).not_to be_valid
  end

  it 'state must be two letters' do
    city = build(:city, state: 'asd')
    expect(city).not_to be_valid

    city = build(:city, state: 'a')
    expect(city).not_to be_valid
  end

  it 'must be unique' do
    create(:city, name: 'Portland')

    # name/state combo must be unique
    city = build(:city, name: 'Portland')
    expect(city).not_to be_valid

    city = build(:city, name: 'Portland', state: 'ME')
    expect(city).to be_valid

    city = build(:city, name: 'Bend')
    expect(city).to be_valid
  end

  it 'autocapitalizes state' do
    city = create(:city, state: 'or')
    expect(city.state).to eq 'OR'
  end

end
