require 'rails_helper'

RSpec.describe Review do

  it 'is valid' do
    review = build(:review)
    expect(review).to be_valid
  end

  it 'has user' do
    review = build(:review, user_id: nil)
    expect(review).not_to be_valid
  end

  it 'has place' do
    review = build(:review, place_id: nil)
    expect(review).not_to be_valid
  end

  it 'has rating' do
    review = build(:review, rating: nil)
    expect(review).not_to be_valid
  end

end
