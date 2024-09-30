class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # A user can have many liked posts through likes
   has_many :liked_posts, through: :likes, source: :post
 
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable,
       :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(u)
    create_with(uid: u[:uid], provider: 'google',
    password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end

end
