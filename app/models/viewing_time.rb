class ViewingTime < ApplicationRecord
  validates :hold_at, presence: true, uniqueness: { scope: :program_name, 
                                                    message: 'とその観覧時間はすでに登録済みです'}
  validates :program_name, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 0, message: '0人以上で設定してください' }
end
