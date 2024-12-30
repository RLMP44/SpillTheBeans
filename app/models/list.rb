class List < ApplicationRecord
  # self.table_name = 'rec_lis_lists'
  belongs_to :user # , foreign_key: 'rec_lis_user_id'
  has_many :bookmarks, dependent: :destroy # , foreign_key: 'rec_lis_list_id'
  has_many :recipes, through: :bookmarks # , foreign_key: 'rec_lis_list_id'
  validates :title, presence: true, uniqueness: true
  # validates :comment, length: { minimum: 3 }
  # validates :user, presence: true, foreign_key: 'rec_lis_user_id'

  # def user_id
  #   rec_lis_user_id
  # end
end
