require 'rails_helper'

RSpec.describe Question do
  describe 'Question' do
    it 'successfully created' do
      result = Question.create(description: 'LAST_YEAR')
      expect(Question.last.description).to eq('LAST_YEAR')
    end
  end
end
