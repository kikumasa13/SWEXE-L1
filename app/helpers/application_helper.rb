module ApplicationHelper
  # 日付を「2026年10月2日(金)」の形式で返す
  def format_date(date)
    return "未設定" if date.blank?

    "#{date.year}年#{date.month}月#{date.day}日(#{%w[日 月 火 水 木 金 土][date.wday]})"
  end

  # 期限までの残り日数をバッジで表示する
  def due_badge(task)
    return if task.due_date.blank?

    days = (task.due_date - Date.current).to_i
    if days < 0
      tag.span("期限切れ", class: "badge badge-over")
    elsif days == 0
      tag.span("今日まで", class: "badge badge-today")
    elsif days <= 3
      tag.span("あと#{days}日", class: "badge badge-soon")
    else
      tag.span("あと#{days}日", class: "badge")
    end
  end

  # 表示中のページならヘッダーのリンクを強調する
  def nav_link_class(path)
    current_page?(path) ? "nav-link is-current" : "nav-link"
  end
end