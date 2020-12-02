class Task < ApplicationRecord
  belongs_to :category
  #バリデーション
  validates :name,
    presence: true,
    length: {minimum:1, maximum: 20, allow_blank: true},
    uniqueness: {care_sensitive: false}
  validates  :priority,
    presence: true,
    numericality: {
      only_integer:true,
      greater_than: 0,
      less_than: 6,
      allow_blank: true
    }
  validates :done,
    inclusion: { in: [true, false] }  
  validates :category_id,
    presence: true,
    numericality: {
      only_integer:true,
      greater_than: 0,
      allow_blank: true
    }
end
