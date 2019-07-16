class User < ApplicationRecord
  has_secure_password
  belongs_to :group
  has_many :games
  has_many :events, through: :group

  validates :name, :email, :password, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  


  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    def self.from_omniauth(auth)
      binding.pry
      where(provider: auth.provider, uid:auth.id).first_or_create do |user|
        user.provider = auth.provider
        user.name = auth.info.name
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end

end
