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

require 'rails_helper'

RSpec.describe Photo, type: :model do

  it 'is valid' do
    photo = build(:place_photo)
    expect(photo).to be_valid
  end

  it 'has user' do
    photo = build(:place_photo, user_id: nil)
    expect(photo).not_to be_valid
  end

  it 'has imageable' do
    photo = build(:place_photo, imageable_type: nil)
    expect(photo).not_to be_valid

    photo = build(:place_photo, imageable_id: nil)
    expect(photo).not_to be_valid
  end

  it 'belongs to place' do
    photo = create(:place_photo)
    expect(photo.imageable.class).to eq Place
  end

  it 'belongs to user' do
    photo = create(:profile_photo)
    expect(photo.imageable.class).to eq User
  end

  it 'has file attached' do
    photo = create(:place_photo)

    expect(photo.image_url).not_to eq nil
  end

end
