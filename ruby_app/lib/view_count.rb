# frozen_string_literal: true

class ViewCount
  def initialize(views)
    @views = views
  end

  def views_count
    @views_count ||= @views.size
  end

  private

  def group_by_page
    @views.group_by { |view| view[:page] }
  end

  def page_count(page, page_views)
    page_views.count { |page_view| page_view[:page] == page }
  end
end
