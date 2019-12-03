# frozen_string_literal: true

class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the Roller Coaster. " \
      "You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      not_enough_tickets
    elsif user.height < attraction.min_height
      not_tall_enough
    else
      new_tickets = user.tickets - attraction.tickets
      new_happiness = user.happiness + attraction.happiness_rating
      new_nausea = user.nausea + attraction.nausea_rating
      user.update(tickets: new_tickets,
                  happiness: new_happiness,
                  nausea: new_nausea)
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def not_tall_enough
    "Sorry. You are not tall enough to ride the #{attraction.name}."
  end

  def not_enough_tickets
    "Sorry. You do not have enough tickets to ride the #{attraction.name}."
  end
end
