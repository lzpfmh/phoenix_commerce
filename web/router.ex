defmodule PhoenixCommerce.Router do
  use PhoenixCommerce.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixCommerce do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/products", ProductController
    get "/cart", CartController, :show
    post "/cart/add", CartController, :add, as: :add_to_cart
    resources "/line_items", LineItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixCommerce do
  #   pipe_through :api
  # end
end
