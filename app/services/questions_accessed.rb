# frozen_string_literal: true

class QuestionsAccessed
  GITHUB_QCX = 'http://raw.githubusercontent.com/qcx'
  QUESTIONS = GITHUB_QCX + '/desafio-backend/master/questions.json'
  QUESTION_ACCESS = GITHUB_QCX + '/desafio-backend/master/question_access.json'

  def accessed_last_year
    accessed_date(1.year)
  end

  def accessed_last_month
    accessed_date(1.month)
  end

  def accessed_last_week
    accessed_date(1.week)
  end

  def accessed_24_hours
    accessed_date(24.hours)
  end

  private

  def accessed_date(date)
    return questions_access if questions_access['success'] == false

    last_date = get_last_date - date

    if date == 24.hours
      get_questions = questions_access['data'].select do |question|
        parse_date(question['date']) == last_date
      end
    else
      get_questions = questions_access['data'].select do |question|
        parse_date(question['date']) >= last_date &&
          parse_date(question['date']) <= (last_date + date)
      end
    end

    more_accessed = get_questions.sort_by { |hsh| hsh[:times_accessed] }&.last

    get_discipline = questions['data'].select do |question|
      question['id'] == more_accessed['question_id']
    end

    get_discipline&.first['discipline']&.capitalize if get_discipline
  end

  def get_last_date
    initial_date = { 'date' => '' }

    questions_access['data'].select do |date|
      initial_date = date if date['date'] > initial_date['date']
    end

    parse_date(initial_date['date'])
  end

  def questions
    endpoint = QUESTIONS
    response = RestClient.get endpoint, { accept: :json }

    {
      'data' => JSON.parse(response.body),
      'success' => true,
      'code' => response.code
    }

    rescue => e
      { 'error' => e.message, 'success' => false }
  end

  def questions_access
    endpoint = QUESTION_ACCESS
    response = RestClient.get endpoint, { accept: :json }

    {
      'data' => JSON.parse(response.body),
      'success' => true,
      'code' => response.code
    }

    rescue => e
      { 'error' => e.message, 'success' => false }
  end

  def parse_date(date)
    Date.parse(date)
  end
end
