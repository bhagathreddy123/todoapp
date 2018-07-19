class Chef < ApplicationRecord
    has_many :recipes
    validates :email, :presence => :true
    validates :chefname, :presence => :true
end