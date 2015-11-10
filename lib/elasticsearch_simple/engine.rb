module ElasticsearchSimple
  class Engine < ::Rails::Engine
    isolate_namespace ElasticsearchSimple
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper
    end
  end
end