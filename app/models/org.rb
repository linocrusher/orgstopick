class Org < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :acronym, presence: true, uniqueness: true
	validates :scope, presence: true
	validates :description, presence: true
end
