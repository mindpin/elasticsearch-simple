Rails.application.routes.draw do
  resources :courses do
    collection do
      get :standard_search
      get :pinyin_search
    end
  end
  #mount ElasticsearchSimple::Engine => '/', :as => 'elasticsearch_simple'
  root to: 'courses#index'
end
