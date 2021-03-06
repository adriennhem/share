class Playerstat < ActiveRecord::Base
  include Auditable
  attr_accessible :jersey_number, :goals, :assists, :shots, :fouls, :yellow_cards, :red_cards, :minutes, :saves, :game_id, :person_id, :teamstat_id
  before_validation :init_stats
  before_save :init_stats

  belongs_to :person
  belongs_to :teamstat
  belongs_to :game

  validates :game_id, :presence => true
  validates :teamstat_id, :presence => true
  validates :person_id, :presence => true

  #TODO ensure these are whole numbers?
  validates_numericality_of :jersey_number, :greater_than_or_equal_to => 0
  validates_numericality_of :goals, :greater_than_or_equal_to => 0
  validates_numericality_of :assists, :greater_than_or_equal_to => 0
  validates_numericality_of :shots, :greater_than_or_equal_to => 0
  validates_numericality_of :fouls, :greater_than_or_equal_to => 0
  validates_numericality_of :yellow_cards, :greater_than_or_equal_to => 0
  validates_numericality_of :red_cards, :greater_than_or_equal_to => 0
  validates_numericality_of :minutes, :greater_than_or_equal_to => 0
  validates_numericality_of :saves, :greater_than_or_equal_to => 0

  def team_name
    teamstat.team_name
  end

  private

    def init_stats
      #init valus to 0 if nil. this is too long. find a better "ruby" way to handle this
      if jersey_number.blank?
        self.jersey_number = 0
      end
      if goals.blank?
        self.goals = 0
      end
      if assists.blank?
        self.assists = 0
      end
      if shots.blank?
        self.shots = 0
      end
      if fouls.blank?
        self.fouls = 0
      end
      if yellow_cards.blank?
        self.yellow_cards = 0
      end
      if red_cards.blank?
        self.red_cards = 0
      end
      if minutes.blank?
        self.minutes = 0
      end
      if saves.blank?
        self.saves = 0
      end
    end
end
