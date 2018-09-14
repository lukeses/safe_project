defmodule Core.Pricing.PromoCodeQueries do
  import Ecto.Query, warn: false

  def is_active_query(query) do
    from(
      p in query,
      where: p.is_active == true
    )
  end

  def not_expired(query) do
    current_time = NaiveDateTime.utc_now()

    from(
      p in query,
      where: p.expiration_datetime >= ^current_time
    )
  end
end
