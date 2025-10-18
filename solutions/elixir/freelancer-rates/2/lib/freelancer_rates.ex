defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount), do: before_discount - (before_discount * discount / 100)

  def monthly_rate(hourly_rate, discount), do: trunc(Float.ceil(apply_discount(daily_rate(hourly_rate) * 22, discount)))

  def days_in_budget(budget, hourly_rate, discount) do
    daily = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / daily, 1)
  end
end
