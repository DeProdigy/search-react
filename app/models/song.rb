class Song < ActiveRecord::Base
  belongs_to :album
  delegate :artist, to: :album
end