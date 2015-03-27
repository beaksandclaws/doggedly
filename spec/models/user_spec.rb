# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  name                   :string(255)
#  active                 :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default("0"), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  admin_level            :integer
#

require 'rails_helper'

RSpec.describe User do

  it 'is valid' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'admin is valid' do
    admin = build(:admin)
    expect(admin).to be_valid
  end

  it 'hashes password' do
    user = create(:user, password: 'a new password')
    expect(user.encrypted_password).not_to eq 'a new password'
  end

  it 'has unique email' do
    create(:user, email: 'test1@test.com')
    second_user = build(:user, email: 'test2@test.com')

    expect(second_user).to be_valid

    third_user = build(:user, email: 'test1@test.com')
    expect(third_user).not_to be_valid
  end

  it 'has email length >= 3' do
    user = build(:user, email: 'ee')
    expect(user).not_to be_valid
  end

  it 'has password length > 7' do
    user = build(:user, password: nil)
    expect(user).not_to be_valid

    user = build(:user, password: '')
    expect(user).not_to be_valid

    user = build(:user, password: '1234567')
    expect(user).not_to be_valid
  end

end
