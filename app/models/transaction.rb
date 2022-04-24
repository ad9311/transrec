class Transaction < ApplicationRecord
  belongs_to :cycle

  enum :category, {
    deposit: 0,
    groceries: 1,
    video_games: 2,
    online_shopping: 3,
    other: 4
  }
end
