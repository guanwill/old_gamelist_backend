class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
          # removed confirmable
  include DeviseTokenAuth::Concerns::User
  
  has_many :games
end
