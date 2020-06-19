class Service < ApplicationRecord
	belongs_to :user
	attachment :image

  with_options presence: true do
    validates :service_name
    validates :price
    validates :working_time
  end

  validate :pretend_ago

  def pretend_ago
      errors.add(:period_start, '本日より過去日の設定は出来ません') if period_start.nil? || period_start < Date.today
      errors.add(:period_end, '本日より過去日の設定は出来ません') if period_end.nil? || period_end < Date.today
  end
end