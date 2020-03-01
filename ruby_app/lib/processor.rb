# frozen_string_literal: true

require_relative 'utils/desc_sort'

class Processor
  def initialize(page_counts, output)
    @page_counts = page_counts
    @output = output
  end

  def print
    @page_counts.each do |page_count|
      @output.print(page_count)
    end
  end
end
