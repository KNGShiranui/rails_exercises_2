Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :blogs do  #get 'blogs/index'のままだとルーティングエラーが出るので書き直し。get '/blogs', to: 'blogks#index'でもいいけどこっちにしとく
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    collection do
      post :confirm
    end
  end
end

