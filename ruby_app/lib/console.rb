# frozen_string_literal: true

require 'singleton'

class Console
  include Singleton

  def print(object)
    object.views_count.each do |obj|
      puts "#{obj[:page]} #{obj[:count]} #{object.text}"
    end
  end
end
