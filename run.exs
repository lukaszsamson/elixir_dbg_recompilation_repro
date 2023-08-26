defmodule MyDbg do
  use GenServer

  def dbg(code, options, %Macro.Env{} = caller) do
    quote do
      GenServer.call(unquote(__MODULE__), {:dbg, __ENV__, true}, :infinity)
      unquote(Macro.dbg(code, options, caller))
    end
  end

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl GenServer
  def init(_args) do
    {:ok, %{}}
  end

  @impl GenServer
  def handle_call({:dbg, %Macro.Env{}, _}, _from, state) do
    {:reply, :ok, state}
  end
end

{:ok, _pid} = MyDbg.start_link([])
Application.put_env(:elixir, :dbg_callback, {MyDbg, :dbg, []})

Mix.start()
Code.compile_file("mix.exs")
Mix.Task.run("loadconfig")
Mix.Task.run("run", ["-e", "DbgRecompile.hello()"])
