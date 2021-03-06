# frozen_string_literal: true

require 'yaml'
require_relative '../../lib/view_count'

describe ViewCount do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:subject) { described_class.new(views) }

  it 'should return page views with count' do
    expect(subject.views_count).to eq(15)
  end
end
