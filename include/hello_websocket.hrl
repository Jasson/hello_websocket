
-define(DEBUG(), error_logger:info_msg("~p:  ~p",[?MODULE, ?LINE])).
-define(DEBUG(Input), 
        error_logger:info_msg("~p:" ++ Input ++ "~n",[?MODULE])).
-define(DEBUG(Input, Args), 
        error_logger:info_msg("~p:" ++ Input ++ "~n",[?MODULE |Args])).
-define(ERROR(Input, Args), 
        error_logger:error_msg("~p:" ++ Input ++ "~n",[?MODULE |Args])).
-define(SESSION_TIMEOUT, 60000*24*60).
        

%% 
%% @type trends_session() = {trends_session, Id, Username, Ws, Updated}
%%       Id = string() 
%%       Username = string() 
%%       Ws = {misultin_ws,<0.177.0>} 
%%       Updated = calendar:local_time()}
-record(trends_session, {id = "", username = "", ws = "", updated = ""}).
-record(wsession, {id = "", name = ""}).

