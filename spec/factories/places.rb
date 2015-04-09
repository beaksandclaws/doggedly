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
#  slug           :string(255)
#

FactoryGirl.define do

  sequence(:date_activated) { |n| rand(0..30).days.ago }

  # sequence(:name) { |n| "Basecamp#{n}" }

  factory :place do
    name
    date_activated Date.today
    alcohol true
    location_info 'Chill brewery with hiking/outdoors theme.'
    hours '3pm - 12am'
    how_enter 'Back entrance behind food carts.'
    food true
    waterbowl false
    useful_tips 'You can order from the food carts parked outside either at the carts themselves or inside.'
    has_wifi true
    city

    trait :with_reviews do

      transient do
        number_of_reviews 10
      end

      after(:create) do |place, evaluator|
        create_list(:review, evaluator.number_of_reviews, place: place)
      end

    end
  end

end
