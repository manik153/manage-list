class ListItem < ApplicationRecord
  scope :active, -> {where(is_trash: false)}
  scope :trashed, -> {where(is_trash: true)}
  belongs_to :list
end
