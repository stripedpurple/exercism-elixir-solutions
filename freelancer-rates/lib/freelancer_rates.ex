defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    if discount > 0.0 do
      before_discount - (before_discount * 1.0 * discount / 100)
    else
      before_discount
    end
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) * 22 |> 
      apply_discount(discount) |> 
        Float.ceil() |>
          trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget/8/apply_discount(hourly_rate,discount) |> Float.floor(1)
  end
end
