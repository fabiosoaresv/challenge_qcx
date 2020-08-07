require 'rails_helper'

RSpec.describe 'GET questions', type: :request do
  it "make request to accessed_last_year and return 200" do
    request = get '/accessed_last_year'
    expect(request).to eq(200)
  end

  it "make request to accessed_last_month and return 200" do
    request = get '/accessed_last_month'
    expect(request).to eq(200)
  end

  it "make request to accessed_last_week and return 200" do
    request = get '/accessed_last_week'
    expect(request).to eq(200)
  end

  it "make request to accessed_24_hours and return 200" do
    request = get '/accessed_24_hours'
    expect(request).to eq(200)
  end
end
