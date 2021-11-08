class Event < ApplicationRecord
    belongs_to :user
    has_many :attendances
    has_many :users, through: :attendances

    validates :title, presence: true, length: { minimum: 5, maximum: 140}
    validates :start_date, presence: true
    validates :duration, presence: true
    validates :description, presence: true, length: { minimum: 20, maximum: 2000}
    validates :price, presence: true, :inclusion => { in: 1..1000, message: 'Prix entre 1 et 1000 plz'}
    validates :location, presence: true
    validate :date_passed?
    validate :duration_positive_multiple_of_five?


    def date_passed?
        if start_date < Time.now
            errors.add(:start_date, 'Impossible de crée un event dans le passer')
        end
    end

    def duration_positive_multiple_of_five?
        if duration < 0
            errors.add(:duration, 'Durée négative impossible')
        elsif duration % 5 != 0
            errors.add(:duration, 'La durée doit être arrondis à 5')
        end
    end

end
