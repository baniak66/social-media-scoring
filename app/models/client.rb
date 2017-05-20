class Client < ApplicationRecord
  has_many :likes

  def check_likes
    start = 0
    clients_likes = []
    self.likes.each { |like| clients_likes << like.content }
    important_likes = []
    ImportantLike.all.each { |like| important_likes << like.content }
    clients_likes & important_likes
  end

end
