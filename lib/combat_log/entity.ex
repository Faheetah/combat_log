defmodule CombatLog.Entity do
  @moduledoc """
  Defines a basic entity in the game world that can be interacted with
  Has basic stats
  """

  use GenServer

  alias CombatLog.EntityRegistry

  defstruct [
    :id,
    :name,
    components: %{}
  ]

  def add_component(entity = %__MODULE__{}, component, val) do
    Map.put(entity, :components, Map.put(entity.components, component, val))
  end

  def get_component(entity = %__MODULE__{}, component) do
    entity
    |> Map.get(:components)
    |> Map.get(component)
  end

  def update_component(entity = %__MODULE__{components: components}, component, value) do
    %{entity | components: Map.put(components, component, value)}
  end

  def spawn(entity = %__MODULE__{}) do
    entity = %{entity | id: make_ref()}
    GenServer.start_link(__MODULE__, entity)
  end

  def get(entity) do
    GenServer.call(entity, :get)
  end

  def update(entity, values) do
    GenServer.cast(entity, {:update, values})
  end

  def register_components(components, pid) do
    Enum.each(components, fn {component, _} ->
      Registry.register(EntityRegistry, component, pid)
    end)
  end

  @impl true
  def init(entity) do
    register_components(entity.components, entity.id)
    {:ok, entity}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:update, values}, _state) do
    {:noreply, values}
  end
end
