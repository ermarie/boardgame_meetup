class User < ApplicationRecord
  has_many :games
  has_and_belongs_to_many :groups
  has_many :events, through: :groups
  has_many :mechanisms, through: :games
  has_many :categories, through: :games

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.name = auth.info.name
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end

end
