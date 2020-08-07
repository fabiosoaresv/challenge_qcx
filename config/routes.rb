Rails.application.routes.draw do
  resources :questions
    get 'accessed_last_year', to: 'questions#accessed_last_year'
    get 'accessed_last_month', to: 'questions#accessed_last_month'
    get 'accessed_last_week', to: 'questions#accessed_last_week'
    get 'accessed_last_day', to: 'questions#accessed_last_day'
    get 'questions', to: 'questions#index'
    get 'questions/show', to: 'questions#show'
    root 'questions#index'
end
