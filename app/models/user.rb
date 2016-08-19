class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable, -- because we dont want to allow users to register
         :recoverable, :rememberable, :trackable, :validatable
end
