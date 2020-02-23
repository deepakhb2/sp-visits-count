# frozen_string_literal: true

class Console
  def self.print(objects, str)
    objects.each do |object|
      puts "#{object[:page]} #{object[:count]} #{str}"
    end
  end
end
