class List < ApplicationRecord
	scope :active, -> {where(is_trash: false)}
	scope :trashed, -> {where(is_trash: true)}
	has_many :list_items, dependent: :destroy
end
