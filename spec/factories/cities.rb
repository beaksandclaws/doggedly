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

FactoryGirl.define do

  sequence(:name) { |n| "Portland#{n}" }

  factory :city do
    name
    state 'OR'

    trait :with_places do

      transient do
        number_of_places 10
      end

      after(:create) do |city, evaluator|
        create_list(:place, evaluator.number_of_places, city: city)
      end
    end

    trait :with_places_and_reviews do

      transient do
        number_of_places 10
        number_of_reviews 10
      end

      after(:create) do |city, evaluator|
        create_list(:place, evaluator.number_of_places, :with_reviews, city: city, number_of_reviews: evaluator.number_of_reviews)
      end
    end
  end

end
