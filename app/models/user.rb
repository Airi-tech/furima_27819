class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, format: { with: PASSWORD_REGEX }
    validates :password_confirmation
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name_kana, format: { with: NAME_READING_REGEX }
    validates :first_name_kana, format: { with: NAME_READING_REGEX }
    validates :birth_date
  end

end
