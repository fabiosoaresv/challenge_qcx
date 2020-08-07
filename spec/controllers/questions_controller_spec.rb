require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  context '#show' do
    describe 'when params choice is' do
      it 'LAST_YEAR and return' do
        response = get :index, params: { choice: Question.ranges[0] }
        expect(response.status).to eq(200)
      end

      it 'LAST_MONTH and return' do
        response = get :index, params: { choice: Question.ranges[1] }
        expect(response.status).to eq(200)
      end

      it 'LAST_WEEK and return' do
        response = get :index, params: { choice: Question.ranges[2] }
        expect(response.status).to eq(200)
      end

      it 'LAST_DAY and return' do
        response = get :index, params: { choice: Question.ranges[3] }
        expect(response.status).to eq(200)
      end
    end
  end
end
