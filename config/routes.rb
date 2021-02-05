Rails.application.routes.draw do
  root to: 'pages#welcome'

  namespace 'api' do
    namespace 'v1' do
      get '/accounts/:account_id', to: 'accounts#show'

      post '/charges/:charge_id', to: 'charges#create'
      post '/fastspring', to: 'fastspring#create'


    end
  end

  get 'free-trial', to: 'pages#free_trial', as: 'free_trial'
  get 'freemium', to: 'pages#freemium', as: 'freemium'
  get 'rollover', to: 'pages#rollover', as: 'rollover'

  get '/:fs_account_id', to: 'users#show'

end
