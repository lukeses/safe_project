defmodule CoreWeb do
  def controller do
    quote do
      use Phoenix.Controller, namespace: CoreWeb
      import Plug.Conn
      import CoreWeb.Router.Helpers
      import CoreWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/core_web/templates",
        namespace: CoreWeb

      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      use Phoenix.HTML

      import CoreWeb.Router.Helpers
      import CoreWeb.ErrorHelpers
      import CoreWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import CoreWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
