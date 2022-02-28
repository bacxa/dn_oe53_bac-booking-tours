# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    return if user.blank?

    if user.admin?
      can :manage, :all
    else
      can %i(show new create), Booking, user_id: user.id
      can %i(show), Tour, user_id: user.id
    end
  end
end
