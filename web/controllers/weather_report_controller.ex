defmodule UsualWeather.WeatherReportController do
  use UsualWeather.Web, :controller
  alias UsualWeather.City
  alias UsualWeather.WeatherReport

  def show(conn, %{"city_id" => city_id}) do
    query = City |> Repo.get_by(slug: city_id) |> Repo.preload(:weather_reports)
    render(conn, "index.json", weather_reports: query.weather_reports)
  end
end