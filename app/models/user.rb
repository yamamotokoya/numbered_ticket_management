class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true

  belongs_to :viewing_time, optional: true

  def reserved?
     viewing_time_id.nil?
  end

  def reserved(viewing_time)
    update(viewing_time_id: viewing_time.id)
  end

  def has_viewing_time?
    self.viewing_time.hold_at != Date.current 
  end
end
