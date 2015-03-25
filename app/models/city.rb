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
  validates :name, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :city, uniqueness: { scope: [:name, :state] }

  def state=(val)
    write_attribute(:state, val.upcase)
  end
end
