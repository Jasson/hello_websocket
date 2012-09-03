%%%==================================================================== 
%%% File    : hello_websocket_users_controller.erl 
%%% Author  : my name <langxianzhe@gmail.com>
%%% Description :  Testing  Chat with misultin websocket  
%%%==================================================================== 

%%%--------------------------------------------------------------------- 
%%% Revision History
%%%--------------------------------------------------------------------- 
%%% reconstructing and adding spec
%%%--------------------------------------------------------------------- 

-module(hello_websocket_users_controller, [Req, SessionID]).
-revision('trends: 1.0').
-created('Date: 2012/08/28 16:00:00').
-modified('Date: 2012/08/28 16:00:00').
-modified_by('langxianzhe@gmail.com').

-export([
         login/2,
         index/2,
         before_/1
        ]).

-include("hello_websocket.hrl").


before_("index") ->
    ok;
before_(Other) ->
    ok.

index('GET',[]) ->
    {ok, ""}.


%%  @spec login() -> {josn,[{result,"ok"}]} | {josn,[{result,"error"}]}
login('GET',[]) ->
    Username = Req:query_param("username"),
    ?DEBUG("login Username=~p ~n SessionID=~p", [Username, SessionID]),
    {redirect, "home"}.












