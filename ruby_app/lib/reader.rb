# frozen_string_literal: true

class Reader
  FORMAT = %r(^\/(\w+\/\d+|\w+) (\d{3}\.\d{3}\.\d{3}.\d{3})$).freeze

  def initialize(file)
    @file = file
  end

  def views
    @views ||= @file.readlines.map(&:chomp).inject([]) do |views, line|
      if line.match(FORMAT)
        views << parse_line(line)
      else
        views
      end
    end
  end

  private

  def parse_line(line)
    line = line.split(' ')
    { page: line[0], ip: line[1] }
  end
end
