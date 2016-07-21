class Job < ApplicationRecord
	belongs_to :company
	validates :title, :location, :description, :category, :company, presence: true
end
