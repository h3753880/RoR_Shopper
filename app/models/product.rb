class Product < ApplicationRecord
  validates :name, :description, :image, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  validates :image, allow_blank: true,
            format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'Must be GIF, JPG, PNG iamges'}

  has_many :lineitems

  # return boolean
  before_destroy :make_sure_no_line_items

  def make_sure_no_line_items
    if lineitems.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end