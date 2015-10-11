class Listing < ActiveRecord::Base
	attr_accessor :category
	
	has_and_belongs_to_many :categories
end