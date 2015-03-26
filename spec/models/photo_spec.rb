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

  it 'has path' do
    photo = build(:place_photo, path: nil)
    expect(photo).not_to be_valid
  end

  it 'has width' do
    photo = build(:place_photo, width: nil)
    expect(photo).not_to be_valid
  end

  it 'has height' do
    photo = build(:place_photo, height: nil)
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

end
