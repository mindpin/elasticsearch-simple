module ElasticsearchSimple
  module Concerns
    module StandardSearch
      extend ActiveSupport::Concern

      included do
        unless ENV['es_simple_enabled'] == 'false'
          include Searchable

          index_name ENV['es_simple_index_prefix'].to_s + self.model_name.collection.gsub(/\//, '-') unless ENV['es_simple_index_prefix'].blank?
        end
      end

      module ClassMethods
        def standard_search(q)
          return [] if ENV['es_simple_enabled'] == 'false'
          param = {
            :query => {
              :multi_match => {
                :fields   => standard_fields,
                :type     => "cross_fields",
                :query    => q,
                :analyzer => ENV['es_simple_analyzer'] || "standard",
                :operator => "and"
              }
            }
          }

          self.search(param).records.all
        end

        def standard(*fields)
          return if ENV['es_simple_enabled'] == 'false'
          standard_fields.merge fields

          settings :index => {:number_of_shards => 1} do
            mappings :dynamic => "false" do
              fields.each do |f|
                indexes f, :analyzer => ENV['es_simple_analyzer'] || "chinese"
              end
            end
          end
        end

        def standard_fields
          @_standard_fields ||= Set.new
        end
      end
    end
  end
end
