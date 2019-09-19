class Blog < ApplicationRecord
  validates_presence_of :content
  validates :content, length: { maximum: 140 }
end
