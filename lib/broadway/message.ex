defmodule Broadway.Message do
  @type t :: %__MODULE__{
          data: any,
          acknowledger: {module, data :: any},
          publisher: atom,
          processor_pid: pid
        }

  defstruct data: nil,
            acknowledger: nil,
            publisher: :default,
            processor_pid: nil

  defmodule Actions do
    alias Broadway.Message

    def update_data(message, fun) do
      %Message{message | data: fun.(message.data)}
    end

    def put_publisher(message, publisher) do
      %Message{message | publisher: publisher}
    end
  end
end
