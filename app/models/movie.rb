class Movie < ActiveRecord::Base
  def self.all_ratings
    return self.select(:rating).distinct.map{|x| x.rating}
  end
  def self.with_ratings(ratings_list)
    if (ratings_list.size == 0)
      ratings_list = self.all_ratings
    end
    return self.where('rating IN (?)', ratings_list)
  end
end
