Rails.application.routes.draw do
  concern :assessments do
    resources :results, only: [:new, :create]
  end

  namespace :manage_assessments do
    root "dashboard#show"

    resources :courses, only: [:index] do
      resources :assessments, only: [:index]
    end

    resources :direct_assessments, only: [:new, :create, :edit, :update]
    resources :indirect_assessments, only: [:edit, :update]

    resources :outcomes, only: [] do
      resources :assessments, only: [:new]
      resources :indirect_assessments, only: [:new, :create]
    end
  end

  namespace :manage_outcomes do
    resources :courses, only: [] do
      resources :standard_outcomes, only: [:index, :create]
      resources :outcomes, only: [:index, :new, :create]
    end

    resources :outcomes, only: [:edit, :update]
    root "dashboard#show"
  end

  resources :direct_assessments, only: [:show], concerns: :assessments
  resources :indirect_assessments, only: [:show], concerns: :assessments
  resources :results, only: [:edit, :update, :destroy]
  resources :subjects, only: [:index, :show]

  get "/pages/*id" => "pages#show", as: :page, format: false
  root "manage_outcomes/dashboard#show"
end
