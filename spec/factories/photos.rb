# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  active         :boolean
#  imageable_type :string(255)
#  imageable_id   :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  image          :string(255)
#  approved       :boolean
#

FactoryGirl.define do
  factory :place_photo, class: Photo do
    active 1
    approved 1
    association :imageable, factory: :place
    image Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/photos/place.jpg"))
    user
  end

  factory :profile_photo, class: Photo do
    active 1
    approved 1
    association :imageable, factory: :user
    image Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/photos/profile.jpg"))
    user
  end
end
