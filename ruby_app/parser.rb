#!/usr/bin/env ruby

require 'byebug'

require_relative './lib/console'
require_relative './lib/reader'
require_relative './lib/processor'

def parse_log_file(file_path)
  if(file_path && File.extname(file_path) == ".log")
    begin
      file = File.open(file_path, 'r')
      reader = Reader.new(file) 
      
      views = reader.views
      processor = Processor.new(views)
       
      Console.print(processor.desc_page_views_count, 'visits')
      Console.print(processor.desc_unique_page_views_count, 'unique views')
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
