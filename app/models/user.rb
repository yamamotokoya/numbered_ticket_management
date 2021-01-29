class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  belongs_to :viewing_time, optional: true
  has_many :receptions, dependent: :destroy


  def reserved?
     viewing_time_id.nil?
  end

  def reserved(viewing_time)
    update_columns(viewing_time_id: viewing_time.id)
    viewing_time.decrease_capacity
  end

  def reserved_today?
    self.viewing_time.hold_at != Date.current 
  end

  def delete_viewing_time_id
    update_columns(viewing_time_id: nil)
  end

  def checked_in_yet?(viewing_time)
    self.receptions.empty? || !checked_in?(viewing_time)
  end

  def checked_in?(viewing_time)
    self.receptions.include?(
      receptions.find { |reception| reception.checked_in_user?(viewing_time) })
  end

  def self.search(viewing_time, user_name)
    User.where("viewing_time_id = ? and name LIKE ?",
      viewing_time.id, "%#{user_name}%" ) if user_name
  end

  def self.find_users(viewing_time)
    User.where("viewing_time_id = ?", viewing_time.id)
  end

  def self.find_users_by_params(params)
    User.where("viewing_time_id = ?", params)
  end

  def self.paginate(array, page)
    Kaminari.paginate_array(array).page(page).per(15)
  end
end
