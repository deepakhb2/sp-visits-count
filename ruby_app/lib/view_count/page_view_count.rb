# frozen_string_literal: true
require_relative '../view_count'

class ViewCount
  class PageViewCount < ViewCount
    def initialize(views)
      @views = views
    end

    def views_count
      @views_count ||= page_views_count
    end

    private
    
    def page_views_count
      group_by_page.map do |page, page_views|
        {
          page: page,
          count: page_count(page, page_views)
        }
      end
    end
  end
end