class Course
  include Mongoid::Document
  include ElasticsearchSimple::Concerns::PinyinSearch

  field :name, type: String
  field :desc, type: String

  pinyin :name, :desc
end
