defmodule MovieWeb.TVShowControllerTest do
  # use MovieWeb.ConnCase

  # alias Movie.TVShows

  # @create_attrs %{}
  # @update_attrs %{}
  # @invalid_attrs %{}

  # def fixture(:tv_show) do
  #   {:ok, tv_show} = TVShows.create_tv_show(@create_attrs)
  #   tv_show
  # end

  # describe "index" do
  #   test "lists all tv_shows", %{conn: conn} do
  #     conn = get(conn, Routes.tv_show_path(conn, :index))
  #     assert html_response(conn, 200) =~ "Listing Tv shows"
  #   end
  # end

  # describe "new tv_show" do
  #   test "renders form", %{conn: conn} do
  #     conn = get(conn, Routes.tv_show_path(conn, :new))
  #     assert html_response(conn, 200) =~ "New Tv show"
  #   end
  # end

  # describe "create tv_show" do
  #   test "redirects to show when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.tv_show_path(conn, :create), tv_show: @create_attrs)

  #     assert %{id: id} = redirected_params(conn)
  #     assert redirected_to(conn) == Routes.tv_show_path(conn, :show, id)

  #     conn = get(conn, Routes.tv_show_path(conn, :show, id))
  #     assert html_response(conn, 200) =~ "Show Tv show"
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.tv_show_path(conn, :create), tv_show: @invalid_attrs)
  #     assert html_response(conn, 200) =~ "New Tv show"
  #   end
  # end

  # describe "edit tv_show" do
  #   setup [:create_tv_show]

  #   test "renders form for editing chosen tv_show", %{conn: conn, tv_show: tv_show} do
  #     conn = get(conn, Routes.tv_show_path(conn, :edit, tv_show))
  #     assert html_response(conn, 200) =~ "Edit Tv show"
  #   end
  # end

  # describe "update tv_show" do
  #   setup [:create_tv_show]

  #   test "redirects when data is valid", %{conn: conn, tv_show: tv_show} do
  #     conn = put(conn, Routes.tv_show_path(conn, :update, tv_show), tv_show: @update_attrs)
  #     assert redirected_to(conn) == Routes.tv_show_path(conn, :show, tv_show)

  #     conn = get(conn, Routes.tv_show_path(conn, :show, tv_show))
  #     assert html_response(conn, 200)
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, tv_show: tv_show} do
  #     conn = put(conn, Routes.tv_show_path(conn, :update, tv_show), tv_show: @invalid_attrs)
  #     assert html_response(conn, 200) =~ "Edit Tv show"
  #   end
  # end

  # describe "delete tv_show" do
  #   setup [:create_tv_show]

  #   test "deletes chosen tv_show", %{conn: conn, tv_show: tv_show} do
  #     conn = delete(conn, Routes.tv_show_path(conn, :delete, tv_show))
  #     assert redirected_to(conn) == Routes.tv_show_path(conn, :index)
  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.tv_show_path(conn, :show, tv_show))
  #     end
  #   end
  # end

  # defp create_tv_show(_) do
  #   tv_show = fixture(:tv_show)
  #   %{tv_show: tv_show}
  # end
end
