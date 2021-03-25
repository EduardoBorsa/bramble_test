defmodule BrambleEngineeringWeb.PageLive do
  use BrambleEngineeringWeb, :live_view

  alias BrambleEngineeringWeb.FormValidator

  @impl true
  def mount(_params, _session, socket) do
    labels = [
      "Jules Winnfield",
      "Marsellus Wallace",
      "Vincent Vega"
    ]

    values = [15, 32, 65]

    background_colors = [
      "Crimson",
      "DarkMagenta",
      "DarkOrange"
    ]

    table_data =
      0..2
      |> Enum.to_list()
      |> Enum.map(fn x ->
        %{
          label: Enum.at(labels, x),
          value: Enum.at(values, x),
          background_color: Enum.at(background_colors, x)
        }
      end)

    chart_data = %{
      labels: labels,
      values: values,
      background_colors: background_colors
    }

    {:ok,
     socket
     |> assign(chart_data: chart_data)
     |> assign_changeset()
     |> assign(table_data: table_data)}
  end

  @impl true
  def handle_event("validate", %{"form_validator" => form_data}, socket) do
    changeset =
      FormValidator.changeset(%FormValidator{}, form_data)
      |> Map.put(:action, :validate)

    {:noreply, update(socket, :changeset, fn _ -> changeset end)}
  end

  @impl true
  def handle_event("add_to_chart", %{"form_validator" => new_data}, socket) do
    {:noreply, add_point(socket, new_data)}
  end

  defp add_point(socket, %{"label" => label, "value" => value}) do
    point = %{
      label: label,
      value: value,
      background_color: random_color()
    }

    socket
    |> push_event("new-point", point)
    |> assign_changeset()
    |> update(:table_data, fn table_data -> [point | table_data] end)
  end

  # --------- REDUCERS --------
  defp assign_changeset(socket) do
    changeset = FormValidator.changeset(%FormValidator{})
    assign(socket, changeset: changeset)
  end

  # =========== PRIVATE FUNCTIONS ===========
  defp random_color do
    [
      "AliceBlue",
      "Brown",
      "Coral",
      "Crimson",
      "DarkMagenta",
      "DarkOrange",
      "DeepPink",
      "MediumTurquoise"
    ]
    |> Enum.random()
  end
end
