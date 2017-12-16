class User < ApplicationRecord
#  has_many :order_items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessor :first_name, :last_name, :role, :email, :password, :remember_me

  def name
    "#{first_name} #{last_name}"
  end
end
