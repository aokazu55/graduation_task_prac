class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :address
    belongs_to_active_hash :gender
    belongs_to_active_hash :personality
    belongs_to_active_hash :special_skill
    belongs_to :user
end
