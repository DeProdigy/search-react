class Song < ActiveRecord::Base
  include PgSearch
  multisearchable against: :title

  belongs_to :album
end