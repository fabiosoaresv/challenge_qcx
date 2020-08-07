periods = %w(LAST_YEAR LAST_MONTH LAST_WEEK LAST_DAY)

periods.each do |period|
  Question.create(description: period)
end
