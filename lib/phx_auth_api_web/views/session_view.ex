defmodule PhxAuthApiWeb.SessionView do
  use PhxAuthApiWeb, :view
  alias PhxAuthApiWeb.SessionView

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token, id: session.id}
  end
end
