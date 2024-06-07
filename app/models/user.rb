class User < ApplicationRecord
  # self.table_name = 'rec_lis_users'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes#, foreign_key: 'rec_lis_user_id'
  has_many :lists#, foreign_key: 'rec_lis_user_id'
end
