class Contact < ApplicationRecord
  belongs_to :user
  has_many :groups, through: :contact_group
end
