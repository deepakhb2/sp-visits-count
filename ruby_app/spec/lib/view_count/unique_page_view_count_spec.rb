require 'yaml'
require_relative '../../../lib/view_count/unique_page_view_count'

describe ViewCount::UniquePageViewCount do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:subject) { described_class.new(views) }

  it 'should return page views with count' do
    views_count = [
      { page: '/home', count: 1 },
      { page: '/contact', count: 3 },
      { page: '/contact/1', count: 2 }
    ]

    expect(subject.views_count).to eq(views_count)
  end
end