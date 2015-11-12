require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'standard' do
    expect(Course.respond_to?(:standard)).to eq(true)
  end

  it 'standard_search' do
    expect(Course.respond_to?(:standard_search)).to eq(true)
  end

  it 'pinyin' do
    expect(Course.respond_to?(:pinyin)).to eq(true)
  end

  it 'pinyin_search' do
    expect(Course.respond_to?(:pinyin_search)).to eq(true)
  end

  describe "实际搜搜测试" do
    it '#standard_search' do
      expect(Course.standard_search('了解').count).to eq(3)
      expect(Course.standard_search('顶翻').count).to eq(2)
      expect(Course.standard_search('测试').count).to eq(2)
    end

    it '#pinyin_search' do
      expect(Course.standard_search('lj').count).to eq(3)
      expect(Course.standard_search('ljdf').count).to eq(2)
      expect(Course.standard_search('df').count).to eq(2)
      expect(Course.standard_search('cs').count).to eq(2)
    end
  end
end
