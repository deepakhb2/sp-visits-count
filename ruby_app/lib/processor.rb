# frozen_string_literal: true

require_relative 'utils/desc_sort'
require_relative 'view_count/page_view_count'
require_relative 'view_count/unique_page_view_count'

class Processor
  def initialize(views, sort, output)
    @views = views
    @sort = sort
    @output = output
  end

  def print
    page_counts.each do |page_count|
      @output.print(page_count)
    end
  end

  private

  def page_counts
    @page_counts ||= [
      ViewCount::PageViewCount.new(@views, @sort),
      ViewCount::UniquePageViewCount.new(@views, @sort)
    ]
  end
end
