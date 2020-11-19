class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  validates :first_name, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Full-width characters'  }
  validates :last_name, presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Full-width characters'}
  validates :first_name_katakana, presence: true, format: { with:  /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} 
  validates :last_name_katakana, presence: true , format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
  validates :birth_date, presence: true
end
