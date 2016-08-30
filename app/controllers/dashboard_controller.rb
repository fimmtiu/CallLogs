class DashboardController < ApplicationController
  def index
    # Show a table of the five longest calls in the past 7 days.
    @longest_calls_this_week = Log.where("created_at >= ?", 1.week.ago).order("duration DESC").limit(5)
    # SQL: SELECT * FROM logs WHERE created_at >= ? ORDER BY duration DESC LIMIT 5

    # Show the top 5 users who have handled the most calls in the past 7 days.
    @busiest_agents_this_week = User.joins(:logs)
                                    .select("users.name, COUNT(*) AS number_of_calls")
                                    .where("logs.created_at >= ?", 1.week.ago)
                                    .group(:name)
                                    .order("number_of_calls DESC")
                                    .limit(5)
    # SQL: SELECT users.name, COUNT(*) AS number_of_calls FROM users JOIN logs ON logs.user_id = users.id
    #       WHERE logs.created_at >= ? GROUP BY users.name ORDER BY number_of_calls DESC LIMIT 5
  end
end
