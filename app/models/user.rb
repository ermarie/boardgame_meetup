class User < ApplicationRecord
  has_many :game_users
  has_many :games, through: :games_users
  has_and_belongs_to_many :groups
  has_many :events, through: :groups

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

  private

  # def to_param
  #   name
  # end

end
