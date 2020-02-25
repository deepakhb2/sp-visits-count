# frozen_string_literal: true

class DescSort
  def initialize(view_count)
    @view_count = view_count
  end

  def call
    @view_count.sort_by { |v| -v[:count] }
  end
end
