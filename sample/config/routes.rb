Rails.application.routes.draw do
  mount ElasticsearchSimple::Engine => '/', :as => 'elasticsearch_simple'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
