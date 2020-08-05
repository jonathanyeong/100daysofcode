-module(concurrency).

-export([start/0, im_giving_up_on_you/0, say_something/2]).

im_giving_up_on_you() ->
  receive
    finished ->
      io:format("Say Something I'm giving up on you~n", []);
    {say_something, SAY_PID} ->
      io:format("I'm giving up on you~n", []),
      SAY_PID ! im_giving_up_on_you,
          im_giving_up_on_you()
  end.

% Once N reaches 0 we will finish and print the last statements in this function
% And also the one im_giving_up_on_you
say_something(0, GBW_PID) ->
    GBW_PID ! finished,
    io:format("And anywhere, I would've followed you, oh-oh~n", []);

say_something(N, GBW_PID) ->
    % self() sends the PID of this process (say_something) to im_giving_up_on_you (GBW_PID)
    GBW_PID ! {say_something, self()},
    % Receive construct is how Erlang handles messages being passed between processes.
    % It pattern matches on the message and provides an output.
    receive
        im_giving_up_on_you ->
            io:format("Say Something~n", [])
    end,
    % It spawns another thread with N-1
    say_something(N - 1, GBW_PID).

start() ->
  % Is there a significance to the PID variable?
    GBW_PID = spawn(concurrency, im_giving_up_on_you, []),
    spawn(concurrency, say_something, [3, GBW_PID]).
