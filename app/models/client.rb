class Client < ApplicationRecord
  has_many :likes

  def check_likes
    clients_likes = []
    self.likes.each { |like| clients_likes << like.content }
    important_likes = []
    ImportantLike.all.each { |like| important_likes << like.content }
    clients_likes & important_likes
  end

  def score(type)
    scores = []
    check_likes.each do |like|
      ImportantLike.where(content: like).each do |l|
        if type == "fin"
          scores << l.fin
        elsif type == "mat"
          scores << l.mat
        elsif type == "gro"
          scores << l.gro
        else type == "hip"
          scores << l.hip
        end
      end
    end
    scores.reduce(:+)
  end

  def list_likes
    likes = []
    check_likes.each do |like|
      ImportantLike.where(content: like).each do |l|
        hash = {content: l.content, fin: l.fin, mat: l.mat, gro: l.gro, hip: l.hip}
        likes.push(hash)
      end
    end
    likes
  end

  def final_score
    final = []
    types = %w(fin mat gro hip)
    types.each do |type|
      final << self.score(type)
    end
    final.reduce(:+)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end

