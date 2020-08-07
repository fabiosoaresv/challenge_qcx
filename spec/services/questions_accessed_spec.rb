require 'rails_helper'

RSpec.describe QuestionsAccessed do
  describe '#accessed_last_year' do
    let!(:subject) { QuestionsAccessed.new }
    context 'when you want to know what questions more accessed' do
      it 'in last year and return' do
        expect(subject.accessed_last_year).to eq('Português')
      end
    end
  end

  describe '#accessed_last_month' do
    let!(:subject) { QuestionsAccessed.new }
    context 'when you want to know what questions more accessed' do
      it 'in last month and return' do
        expect(subject.accessed_last_month).to eq('Português')
      end
    end
  end

  describe '#accessed_last_week' do
    let!(:subject) { QuestionsAccessed.new }
    context 'when you want to know what questions more accessed' do
      it 'in last week and return' do
        expect(subject.accessed_last_week).to eq('Português')
      end
    end
  end

  describe '#accessed_last_week' do
    let!(:subject) { QuestionsAccessed.new }
    context 'when you want to know what questions more accessed' do
      it 'in last 24 hours and return' do
        expect(subject.accessed_24_hours).to eq('Literatura')
      end
    end
  end

  describe 'when RestClient broken in' do
    let!(:subject) { QuestionsAccessed.new }

    before do
      allow(RestClient)
        .to receive(:get)
        .and_raise(RestClient::RequestFailed)
    end

    context 'you want get accessed_last_year and' do
      it 'raise and return' do
        expect(subject.accessed_last_year).to eq(
          {
            'error'=>'HTTP status code ', 'success'=>false
          }
        )
      end
    end

    context 'you want get accessed_last_month and' do
      it 'raise and return' do
        expect(subject.accessed_last_month).to eq(
          {
            'error'=>'HTTP status code ', 'success'=>false
          }
        )
      end
    end

    context 'you want get accessed_last_week and' do
      it 'raise and return' do
        expect(subject.accessed_last_week).to eq(
          {
            'error'=>'HTTP status code ', 'success'=>false
          }
        )
      end
    end

    context 'you want get accessed_last_week and' do
      it 'raise and return' do
        expect(subject.accessed_last_week).to eq(
          {
            'error'=>'HTTP status code ', 'success'=>false
          }
        )
      end
    end
  end
end
