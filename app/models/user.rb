class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { basic: 0, admin: 1 }, _suffix: :role

  has_many :diets, dependent: :destroy
  has_many :eaten_products, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :remove_redundant_chars!

  validates :email, presence: true, uniqueness: true,
  format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  private

  def remove_redundant_chars!
    return if email.nil?

    email.gsub!(/\.(?=[^@]*?@)|\+.*(?=@)/, '') || email
  end
end
