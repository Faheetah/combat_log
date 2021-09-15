defmodule CombatLog.System.Inventory do
  def add(inventory, item) do
    IO.inspect {inventory, item}, label: :added
  end

  def destroy(inventory, item) do
    IO.inspect {inventory, item}, label: :destroyed
  end

  def drop(inventory, item) do
    IO.inspect {inventory, item}, label: :dropped
  end
end
