# ElasticsearchSimple

elasticsearch-simple 是一个用于简化集成 elasticsearch for rails 的 gem

**注:暂时只支持 Mongoid 4.0，其余数据库类型均为测试 **

## 安装

**Gemfile**

```ruby
gem 'elasticsearch_simple', github: 'mindpin/elasticsearch-simple'
```

然后:
```shell
bundle
```

## 使用说明

### 配置
```
# Gemfile
gem "figaro"
```

```
# config/application.yml
# es索引前缀
  es_simple_index_prefix: kc-dev
# 当为false强制关闭es功能（即不引用回调等）,其余或者不设定，为开启状态
  es_simple_enabled: false
# elasticsearch analyzer 设置，默认为chinese
  es_simple_analyzer: ik
```

或者也可以通过其他方式，传入 **ENV['es_simple_index_prefix']**

注意： 整体索引形式为
```
ENV['es_simple_index_prefix'].to_s + 默认索引名称
```
即 **ENV['es_simple_index_prefix']** 为空的话，则为默认索引名称

### 经典搜索
**app/models/your_model.rb**
```ruby
class YourModel
  include Mongoid::Document
  # 引用
  include ElasticsearchSimple::Concerns::StandardSearch

  field :name, type: String
  field :desc, type: String

  # 经典搜索，包含 name , desc 两个字段
  standard :name, :desc
end
```

```ruby
# 经典搜索
Course.standard_search(query)
#=> #<Mongoid::Criteria >
```

### 拼音搜索(含经典搜索)
**app/models/your_model.rb**
```ruby
class YourModel
  include Mongoid::Document
  # 引用
  include ElasticsearchSimple::Concerns::PinyinSearch

  field :name, type: String
  field :desc, type: String

  # 拼音搜索，包含 name 字段
  pinyin :name
end
```

```ruby
# 拼音搜索
Course.pinyin_search(query)
#=> #<Mongoid::Criteria >
```

### analyzer 分词组件说明
默认使用的为chinese,为官方提供
https://github.com/elastic/elasticsearch-analysis-smartcn

可以改为您喜欢的analyzer, 例如 **ik**
https://github.com/medcl/elasticsearch-analysis-ik

## 示例

示例为项目 sample/ 下，你可以通过以下方式进行查看：
```shell
cd sample
bundle
rails s
```

然后访问 http://localhost:3000

## 测试

测试需要 sample 项目 下进行，你可以通过以下指令进行测试：
```shell
cd sample
bundle
rspec
```

**注:测试需要 elasticsearch 支持**

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mindpin/elasticsearch-simple. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

