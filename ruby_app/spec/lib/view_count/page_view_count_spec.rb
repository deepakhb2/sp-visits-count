require_relative '../view_count'

describe PageViewCount do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:subject) { described_class.new(views) }

  it 'should return page views with count' do
    views_count = [
      { page: '/home', count: 4 },
      { page: '/contact', count: 6 },
      { page: '/contact/1', count: 5 },
    ]

    expect(subject.views_count).to eq(views_count)
  end
end