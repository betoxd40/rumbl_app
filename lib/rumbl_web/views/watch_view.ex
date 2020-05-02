defmodule RumblWeb.WatchView do
  use RumblWeb, :view

  @youtube_regex_url ~r{^.*(?:youtu\.be/|\w+/|v=)(?<id>[^#&?]*)}

  def player_id(video) do
    @youtube_regex_url
    |> Regex.named_captures(video.url)
    |> get_in(["id"])
  end
end
