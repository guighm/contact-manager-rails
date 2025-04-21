class Contact < ApplicationRecord
  belongs_to :company
  has_many :contact_tags

end
