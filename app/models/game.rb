class Game < ApplicationRecord
  validates :title, presence: true, :uniqueness => {:scope => :user_id}
  validates :platform, presence: true
  validates :progress, presence: true

  belongs_to :user
end
