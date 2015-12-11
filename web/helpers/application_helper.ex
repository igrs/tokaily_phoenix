defmodule TokailyPhoenix.ApplicationHelper do
  use Timex

  def convert_ja_timezone(datetime) do
    case datetime
    |> Timezone.convert("Asia/Tokyo")
    |> standard_format_datetime
  end

  def standard_format_datetime(datetime) do
    case datetime
    |> DateFormat.format("%Y-%m-%d %T", :strftime) do
      { :ok, str_datetime } ->
        str_datetime
      { :error, str_datetime } ->
        ""
    end
  end
end
