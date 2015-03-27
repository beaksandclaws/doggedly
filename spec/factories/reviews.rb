# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  rating     :integer
#  active     :boolean
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

  sequence(:rating) { |n| n%5+1 }

  factory :review do
    content 'I love bringing my dog here!'
    rating
    active true
    user
    place
  end

end