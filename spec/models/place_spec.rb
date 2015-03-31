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

    places = Place.where(city_id: city.id).recently_activated(5)

    expect(places.count).to eq 3
  end

end

RSpec.describe Place, '.highest_rating' do

  it 'displays places with highest rating' do
    city = create(:city, :with_places_and_reviews)

    all_reviews = Review.all
    sorted_places = Hash.new

    # create an array of ratings for each place
    all_reviews.each do |review|
      if sorted_places[review.place.name].present?
        sorted_places[review.place.name] << review.rating
      else
        sorted_places[review.place.name] = [review.rating]
      end
    end

    # get the average rating of each place
    sorted_places.keys.each do |place|
      sorted_places[place] = sorted_places[place].inject{ |sum, rating| sum+rating }.to_f / sorted_places[place].size
    end

    # get the sorted place ids
    sorted_places = sorted_places.sort_by{ |place, rating| [-(rating), place] }.map{ |x| x[0] }.shift(3)

    # get sorted place id's using function
    places = Place.where(city_id: city.id).highest_rated(3).map{ |x| x.name }

    expect(places).to eq sorted_places
  end

  it 'has default of 5' do
    city = create(:city, :with_places_and_reviews)

    places = Place.highest_rated

    expect(places.length).to eq 5
  end

  it 'doesn\'t return inactive places' do
    create_list(:place, 3, :with_reviews)
    create_list(:place, 7, :with_reviews, date_activated: nil)

    places = Place.highest_rated
    expect(places.length).to eq 3
  end
end

RSpec.describe Place, '#activate!' do

  it 'sets date_activated to current date' do
    place = create(:place, date_activated: nil)

    place.activate!

    expect(place.date_activated).to eq Date.today
  end

end