defmodule CheapProcess.Process do
  def start_and_time(how_many) do
    {microseconds, :ok} = :timer.tc(__MODULE__, :start, [how_many])
    IO.puts "Completed in #{microseconds/1_000_000} seconds."
  end

  def start(how_many) do
    start_proc(how_many, self)
  end

  def start_proc(0, pid) do
    pid <- :ok
  end
  def start_proc(how_many_more, pid) do
    # Create a child process that runs start_proc (this function)
    new_pid = spawn(__MODULE__, :start_proc, [how_many_more - 1, pid])
    # Send an 'ok' to the child process
    new_pid <- :ok

    # Wait until we receive an 'ok' from our parent
    receive do
      :ok -> :ok
    end
  end
end
