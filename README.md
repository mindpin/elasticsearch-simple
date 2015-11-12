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

