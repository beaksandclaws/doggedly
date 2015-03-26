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

  factory :city do
    name
    state 'OR'
  end

  sequence :name do |n|
    "Portland#{n}"
  end

end
