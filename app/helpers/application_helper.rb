module ApplicationHelper
  # Durations are stored in seconds. This converts a large number of
  # seconds to a human-readable string.
  def seconds_to_hms(seconds)
    sprintf("%d:%02d:%02d", seconds / 3600, seconds % 3600 / 60, seconds % 60)
  end
end
