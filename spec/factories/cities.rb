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
  end

end
