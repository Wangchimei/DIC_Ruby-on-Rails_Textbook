class Contact < ApplicationRecord
  validates :name, :email, :content, presence: true
  validates :content, length: { maximum: 140 }
end
