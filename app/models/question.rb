class Question < ApplicationRecord
    validates :title, :body, presence: true
    has_many :answers, :dependent => :destroy
    has_many :comments, as: :commentable
    belongs_to :user
    
    def voted_by?(user)
        votes.exist?(user: user)
    end
end
