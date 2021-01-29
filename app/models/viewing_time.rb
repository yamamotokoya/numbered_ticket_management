class ViewingTime < ApplicationRecord
  validates :hold_at, presence: true, uniqueness: { scope: :program_name, 
                                                    message: 'とその観覧時間はすでに登録済みです'}
  validates :program_name, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 0, message: '0人以上で設定してください' }

  has_many :users
  has_many :receptions, dependent: :destroy
  def decrease_capacity
    update_columns(capacity: self.capacity -= 1)
  end


  def reserved_other_time?
    time_table = get_today_schedule
    time_table.include?(current_user.viewing_time)
  end

  def users_viewing_time_id_delete
    self.users.each { |user| user.delete_viewing_time_id }
  end

  def not_checked_in_users
    self.users.select { |user| user.checked_in_yet?(self)}
  end


  def self.get_today_schedule
    ViewingTime.where("hold_at = ? and capacity > ?", Date.current, 0)
  end

end
