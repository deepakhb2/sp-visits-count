# frozen_string_literal: true

require_relative '../../lib/reader'

describe Reader do
  let(:valid_file) do
    File.open('spec/fixtures/lib/reader/valid-lines.log', 'r')
  end
  let(:invalid_file) do
    File.open('spec/fixtures/lib/reader/invalid-lines.log', 'r')
  end

  it 'read should return the views by reading the only valid lines' do
    reader = Reader.new(valid_file)
    views = reader.views
    expect(views.count).to eq(50)
  end

  it 'read should ignore the invalid lines from file' do
    reader = Reader.new(invalid_file)
    expect(reader.views.size).to eq(50)
  end
end
