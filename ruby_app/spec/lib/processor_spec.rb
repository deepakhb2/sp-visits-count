# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require_relative '../../lib/processor'

describe Processor do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:output) { double('Console') }
  let(:view_counts) {
    [
      double('ViewCount::UniquePageViewCount'),
      double('ViewCount::PageViewCount')
    ]
  }

  it 'should print counts on page' do
    expect(output).to receive(:print)
    expect(output).to receive(:print)
    subject = described_class.new(view_counts, output)
    subject.print
  end
end
