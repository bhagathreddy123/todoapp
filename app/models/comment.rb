class Comment < ApplicationRecord
	validates :description, presence: true, length: { minimum: 5, maximum: 250 }
	belongs_to :chef
	belongs_to :recipe
	validates :chef_id, :recipe_id, presence: true
	default_scope -> { order(updated_at: :desc)}
end