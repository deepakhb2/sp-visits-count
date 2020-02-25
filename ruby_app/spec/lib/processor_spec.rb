# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require_relative '../../lib/processor'

describe Processor do
  let(:views) { YAML.load_file('spec/fixtures/lib/processor.yaml') }
  let(:sort) { double('DescSort') }
  let(:output) { double('Console') }

  it 'should print counts on page' do
    expect(output).to receive(:print)
    expect(output).to receive(:print)
    subject = described_class.new(views, sort, output)
    subject.print
  end
end
