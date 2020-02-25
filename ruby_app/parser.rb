#!/usr/bin/env ruby

require 'byebug'

require_relative './lib/console'
require_relative './lib/reader'
require_relative './lib/processor'
require_relative './lib/utils/desc_sort'

def parse_log_file(file_path)
  if(file_path && File.extname(file_path) == ".log")
    begin
      file = File.open(file_path, 'r')
      reader = Reader.new(file) 
      
      views = reader.views
      processor = Processor.new(views, DescSort, Console)
      processor.print
    rescue Errno::ENOENT => e
      puts "File not found!"
    rescue Exception => e
      puts e.backtrace
    end
  else
    puts "Input file parameter is not passed or it is not a log file!"
  end
end

if $0 == __FILE__
  parse_log_file(ARGV[0])
end
