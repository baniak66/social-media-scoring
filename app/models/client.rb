class Client < ApplicationRecord
  has_many :likes
  has_many :hashtags
  has_many :schools
  has_many :workplaces
end
