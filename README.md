# CheapProcess

Time how long it takes to spin up a given number of processes in a chain, and
have each of them send a message to their parent when they receive a message
from their parent.  The last process spawned starts the replies.

## Usage

```
iex -S mix
CheapProcess.Process.start_and_time(1000000)
```
