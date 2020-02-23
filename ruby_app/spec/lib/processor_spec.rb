# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require_relative '../../lib/processor'

describe Processor do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:subject) { Processor.new(views) }

  it 'should return page views with count' do
    desc_page_views_count = [
      { page: '/contact', count: 6 },
      { page: '/contact/1', count: 5 },
      { page: '/home', count: 4 }
    ]
    expect(subject.desc_page_views_count).to eq(desc_page_views_count)
  end

  it 'should return unique page views with count' do
    desc_unique_page_views_count = [
      { page: '/contact', count: 3 },
      { page: '/contact/1', count: 2 },
      { page: '/home', count: 1 }
    ]
    expect(subject.desc_unique_page_views_count)
      .to eq(desc_unique_page_views_count)
  end
end
