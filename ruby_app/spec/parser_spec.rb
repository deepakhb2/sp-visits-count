# frozen_string_literal: true

require_relative '../parser'

describe 'parser' do
  let(:console_output) { File.read('spec/fixtures/parser.txt') }

  it 'test console output with correct webserver.log file' do
    expect { parse_log_file('webserver.log') }
      .to output(console_output).to_stdout
  end

  it 'test console output with nil parameter' do
    console_output =
      "Input file parameter is not passed or it is not a log file!\n"
    expect { parse_log_file(nil) }
      .to output(console_output).to_stdout
  end

  it 'test console output with file not exist' do
    console_output = "File not found!\n"
    expect { parse_log_file('file_not_present.log') }
      .to output(console_output).to_stdout
  end

  it 'test console output with non log file' do
    console_output =
      "Input file parameter is not passed or it is not a log file!\n"
    expect { parse_log_file('parser.rb') }.to output(console_output).to_stdout
    expect { parse_log_file('Gemfile') }.to output(console_output).to_stdout
    expect { parse_log_file('Gemfile.lock') }
      .to output(console_output).to_stdout
  end
end
