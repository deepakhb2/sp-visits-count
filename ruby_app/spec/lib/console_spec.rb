# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require_relative '../../lib/console'

describe Console do
  subject { described_class }
  let(:page_views) { YAML.load_file('spec/fixtures/lib/console.yaml') }

  it 'print page views' do
    console_output = "/contact 10 visits\n/home 5 visits\n"
    views_count = double('PageViewCount')
    expect(views_count).to receive(:text).and_return('visits')
    expect(views_count).to receive(:text).and_return('visits')
    expect(views_count).to receive(:views_count).and_return(page_views)
    expect { subject.print(views_count) }
      .to output(console_output).to_stdout
  end

  it 'print page views' do
    console_output = "/contact 10 unique views\n/home 5 unique views\n"
    views_count = double('UniquePageViewCount')
    expect(views_count).to receive(:text).and_return('unique views')
    expect(views_count).to receive(:text).and_return('unique views')
    expect(views_count).to receive(:views_count).and_return(page_views)
    expect { subject.print(views_count) }
      .to output(console_output).to_stdout
  end
end
