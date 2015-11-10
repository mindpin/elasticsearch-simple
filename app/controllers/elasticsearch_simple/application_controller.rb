module ElasticsearchSimple
  class ApplicationController < ActionController::Base
    layout "elasticsearch_simple/application"

    if defined? PlayAuth
      helper PlayAuth::SessionsHelper
    end
  end
end