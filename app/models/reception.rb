class Reception < ApplicationRecord
  belongs_to :viewing_time
  belongs_to :user

  validates :user_id, uniqueness: {scope: :viewing_time_id}

  def checked_in_user?(viewing_time)
    self.viewing_time_id == viewing_time.id
  end
end
