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

  factory :review do
    content 'I love bringing my dog here!'
    rating 5
    active true
    user
    place
  end

end