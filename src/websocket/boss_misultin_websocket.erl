
%%%==================================================================== 
%%% File    : misultin_websocket.erl 
%%% Author  : my name <langxianzhe@gmail.com>
%%% Description :  To handle Data of Ws 
%%%==================================================================== 

%%%--------------------------------------------------------------------- 
%%% Revision History
%%%--------------------------------------------------------------------- 
%%% reconstructing and adding spec
%%%--------------------------------------------------------------------- 
-module(boss_misultin_websocket).                                          

-export([handle_websocket/1]).

-revision('trends: 1.0').
-created('Date: 2012/08/28 19:30:40').
-modified('Date: 2012/08/28 19:30:40').
-modified_by('langxianzhe@gmail.com').

-include("hello_websocket.hrl").

% callback on received websockets data
handle_websocket(Ws) ->
        ?DEBUG("~p:handle_websocket ~p Ws=~p~n", [?MODULE, ?LINE, Ws]),
        receive
                {browser, "token:"} ->
                        mnesia:dirty_write(#wsession{id = Ws}),
                        Ws:send(["connect success!"]),
                        handle_websocket(Ws);
                {browser, Data} ->
                        [begin WsId:send(["receive", Data]) end || #wsession{id = WsId} <- ets:tab2list(wsession)],
                        handle_websocket(Ws);
                _Ignore ->
                        ?DEBUG("The message is not right data of format _Ignore= ~p!", [_Ignore]),
                        Ws:send(["406"])
                        %handle_websocket(Ws)
        after ?SESSION_TIMEOUT -> 
                Ws:send("pushing!"),
                ?DEBUG("session time out= ~p!", [])
                %%handle_websocket(Ws)
        end. 

