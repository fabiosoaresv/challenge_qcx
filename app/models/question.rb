class Question < ApplicationRecord
  def self.ranges
    Question.all.map(&:description)
  end
end
