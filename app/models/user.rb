class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end

  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :family_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name_kana,       presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
end
