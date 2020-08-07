# frozen_string_literal: true

class QuestionsController < ActionController::Base
  PERIODS = %w(LAST_YEAR LAST_MONTH LAST_WEEK LAST_24_YOURS)
  attr_reader :service

  def index
    @questions = PERIODS
  end

  def show
    case questions_params[:choice]
    when PERIODS[0]
      accessed_last_year
    when PERIODS[1]
      accessed_last_month
    when PERIODS[2]
      accessed_last_week
    when PERIODS[3]
      accessed_24_hours
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

  def accessed_24_hours
    render(json: { data: service.accessed_24_hours } )
  end

  private

  def service
    service ||= QuestionsAccessed.new
  end

  def questions_params
    params.require(:params).permit(:choice)
  end
end
