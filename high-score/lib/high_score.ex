defmodule HighScore do
  @constant_score 0
  def new(), do: %{}

  def add_player(scores, name, score \\ @constant_score), do: Map.put(scores, name,score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.update(scores, name,@constant_score, fn _ -> @constant_score end) 

  def update_score(scores, name, score), do: Map.update(scores, name, score, fn old -> old + score end) 

  def get_players(scores), do: Map.keys(scores)
end
