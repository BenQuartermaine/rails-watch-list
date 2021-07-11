class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # Why is this through bookmarks?
  ## Bookmarks is the way to add the movie to the list (the list table doesn't store a movie_id)
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true
  
  
end
