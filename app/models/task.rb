class Task < ApplicationRecord
      validates :title, presence: { message: "を入力してください" },
                     length: { maximum: 50, message: "は50文字以内で入力してください" }
  validates :description, presence: { message: "を入力してください" },
                           length: { maximum: 500, message: "は500文字以内で入力してください" }
  validates :due_date, presence: { message: "を入力してください" }

  validate :due_date_cannot_be_in_the_past

  private

  def due_date_cannot_be_in_the_past
    return if due_date.blank?

    if due_date < Date.today
      errors.add(:due_date, "は今日以降の日付にしてください")
    end
  end
end
