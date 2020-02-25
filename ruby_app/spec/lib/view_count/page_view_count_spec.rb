# frozen_string_literal: true

require 'yaml'
require_relative '../../../lib/view_count/page_view_count'

describe ViewCount::PageViewCount do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:subject) { described_class.new(views) }
  let(:views_count) do
    [
      { page: '/home', count: 4 },
      { page: '/contact', count: 6 },
      { page: '/contact/1', count: 5 }
    ]
  end

  it 'should return page views with count' do
    expect(subject.views_count).to eq(views_count)
  end

  it 'text should return visits' do
    expect(subject.text).to eq('visits')
  end

  it 'should return page views with count sorted descending order' do
    sorted_views_count = [
      { page: '/contact', count: 6 },
      { page: '/contact/1', count: 5 },
      { page: '/home', count: 4 }
    ]
    desc_sort = double('DescSort')
    expect(desc_sort).to receive(:call).and_return(sorted_views_count)
    expect(desc_sort).to receive(:new).with(views_count).and_return(desc_sort)

    desc_subject = described_class.new(views, desc_sort)
    expect(desc_subject.views_count).to eq(sorted_views_count)
  end
end
