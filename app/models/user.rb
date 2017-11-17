class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :first_name, :last_name, :email, :password, :remember_me

  def name
    "#{first_name} #{last_name} #{organizations_name}"
  end
end