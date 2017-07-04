class User < ApplicationRecord
  VALID_ROLES = ['admin', 'superadmin']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: {in: VALID_ROLES, message: '%{value} is not a valid user role'}
end
