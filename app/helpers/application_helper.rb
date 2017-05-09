module ApplicationHelper

  def chat_title
    current_page?(:action => 'new') ? "新規チャットグループ": "チャットグループ編集"
  end

end
