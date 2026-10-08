class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # サイドバーは全ページ共通なので、表示用データの取得はここに1か所だけ書く（DRY原則）
  before_action :set_sidebar_data

  private

  def set_sidebar_data
    today = Date.current
    @sidebar_task_count = Task.count
    @sidebar_overdue_count = Task.where(due_date: ...today).count
    @sidebar_upcoming_tasks = Task.where(due_date: today..).order(:due_date).limit(5)
    logger.debug("サイドバー: 全#{@sidebar_task_count}件 / 期限切れ#{@sidebar_overdue_count}件")
  end
end