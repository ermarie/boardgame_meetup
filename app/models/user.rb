class User < ApplicationRecord
  belongs_to :group
  has_many :games


  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid:auth.id).first_or_create do |user|
        user.provider = auth.provider
        user.name = auth.info.name
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end

end
