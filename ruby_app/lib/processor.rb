# frozen_string_literal: true

class Processor
  def initialize(views)
    @views = views
  end

  def desc_page_views_count
    page_views_count.sort_by { |v| -v[:count] }
  end

  def desc_unique_page_views_count
    unique_page_views_count.sort_by { |v| -v[:count] }
  end

  private

  def page_views_count
    @page_views_count ||= group_by_page.map do |page, page_views|
      {
        page: page,
        count: page_count(page, page_views)
      }
    end
  end

  def unique_page_views_count
    @unique_page_views_count ||= group_by_page.map do |page, page_views|
      {
        page: page,
        count: page_count(page, page_views.uniq)
      }
    end
  end

  def group_by_page
    @views.group_by { |view| view[:page] }
  end

  def page_count(page, page_views)
    page_views.count { |page_view| page_view[:page] == page }
  end
end
