# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  path           :string(255)
#  active         :boolean
#  imageable_type :string(255)
#  imageable_id   :integer
#  user_id        :integer
#  width          :integer
#  height         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :place_photo, class: Photo do
    id 1
    path '/public/img/000.jpg'
    active 1
    user_id 2
    width 100
    height 100
    association :imageable, factory: :place
  end

  factory :profile_photo, class: Photo do
    id 1
    path '/public/img/001.jpg'
    active 1
    user_id 2
    width 100
    height 100
    association :imageable, factory: :user
  end
end