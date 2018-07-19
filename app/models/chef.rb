class Chef < ApplicationRecord
    has_many :recipes, :dependent => :destroy
    validates :email, :presence => :true
    validates :chefname, :presence => :true
end