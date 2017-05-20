class Hashtag < ApplicationRecord
  belongs_to :category
  belongs_to :client
  # serialize :names_list
end
