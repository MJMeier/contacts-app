class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  belongs_to :user_id

  def friendly_updated_at
    created_at.strftime("%B %e, %Y")
  end  

  def full_name
    "#{first_name}" "#{last_name}" 
  end
end
