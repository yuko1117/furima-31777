class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
    validates :first_name, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Full-width characters'  }
    validates :last_name, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Full-width characters'}
    validates :first_name_katakana, format: { with:  /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} 
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
    validates :birth_date
  end
end
