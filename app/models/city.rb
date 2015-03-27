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

class City < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :state }
  validates :state, presence: true, length: { is: 2 }

  has_many :places

  def state=(val)
    write_attribute(:state, val.upcase) if val.present?
  end
end
