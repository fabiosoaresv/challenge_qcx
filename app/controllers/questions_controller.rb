# frozen_string_literal: true

class QuestionsController < ActionController::Base
  attr_reader :service

  def index
    @questions_ranges = Question.ranges
  end

  def show
    ranges = Question.ranges

    case questions_params[:choice]
    when ranges[0]
      accessed_last_year
    when ranges[1]
      accessed_last_month
    when ranges[2]
      accessed_last_week
    when ranges[3]
      accessed_last_day
    else
      redirect_to :root, alert: 'Error unknown'
    end
  end

  # GETs
  def accessed_last_year
    render(json: { data: service.accessed_last_year } )
  end

  def accessed_last_month
    render(json: { data: service.accessed_last_month } )
  end

  def accessed_last_week
    render(json: { data: service.accessed_last_week } )
  end

  def accessed_last_day
    render(json: { data: service.accessed_last_day } )
  end

  private

  def service
    service ||= QuestionsAccessed.new
  end

  def questions_params
    params.require(:params).permit(:choice)
  end
end
