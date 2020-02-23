# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require_relative '../../lib/console'

describe Console do
  subject { described_class }
  let(:page_views) { YAML.load_file('spec/fixtures/lib/console.yaml') }

  it 'print page views' do
    console_output = "/contact 10 visits\n/home 5 visits\n"
    expect { subject.print(page_views, 'visits') }
      .to output(console_output).to_stdout
  end

  it 'print page views' do
    console_output = "/contact 10 unique views\n/home 5 unique views\n"
    expect { subject.print(page_views, 'unique views') }
      .to output(console_output).to_stdout
  end
end
