# frozen_string_literal: true

require_relative '../view_count'

class ViewCount
  class UniquePageViewCount < ViewCount
    def initialize(views, sort = nil)
      @views = views
      @sort = sort
    end

    def views_count
      @views_count ||=
        @sort ? @sort.new(page_views_count).call : page_views_count
    end

    def text
      'unique views'
    end

    private

    def page_views_count
      group_by_page.map do |page, page_views|
        {
          page: page,
          count: page_count(page, page_views.uniq)
        }
      end
    end
  end
end
