module ElasticsearchSimple
  class Engine < ::Rails::Engine
    isolate_namespace ElasticsearchSimple
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper

      Dir.glob(Rails.root + "app/decorators/elasticsearch_simple/**/*_decorator.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
