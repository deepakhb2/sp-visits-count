# frozen_string_literal: true

class Console
  def self.print(object)
    object.views_count.each do |obj|
      puts "#{obj[:page]} #{obj[:count]} #{object.text}"
    end
  end
end
