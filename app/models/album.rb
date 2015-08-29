class Album < ActiveRecord::Base
  include PgSearch
  multisearchable against: :title

  belongs_to :artist
  has_many :songs
end