defmodule BrambleEngineeringWeb.PageLiveTest do
  use BrambleEngineeringWeb.ConnCase

  import Phoenix.LiveViewTest
  setup :register_and_log_in_user

  test "disconnected and connected render", %{conn: conn} do
    {:ok, view, html} = live(conn, "/")
    assert html =~ "Quality"
    assert render(view) =~ "Quality"
  end

  test "new submitter character appears on table", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    refute render(view) =~ "Char Name"

    view
    |> form("#new-char-form",
      form_validator: %{label: "Char Name", value: "12"}
    )
    |> render_submit()

    assert render(view) =~ "Char Name"
  end

  test "render change show's error tags", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    refute render(view) =~ "can&#39;t be blank"

    view
    |> form("#new-char-form",
      form_validator: %{label: "", value: ""}
    )
    |> render_change()

    assert render(view) =~ "can&#39;t be blank"
  end
end
