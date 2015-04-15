%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2005-2009. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%
%%
-module(otp_5553).

-export([?MODULE/0,test/0,handle_cast/2]).

?MODULE() ->
    ok.

split_quoted_string([34 | _Rest]) ->	%% 34 is '"'
    ok.

test() ->
    %% does not start with quote
    io:format("test: split_quoted_string/1 - 5~n"),
    try split_quoted_string("foo \"bar\"") of
	SQS_Res5 -> throw({error, test_case_failed, SQS_Res5})
    catch
	error: does_not_start_with_quote -> ok
    end,

    %% no ending quote
    io:format("test: split_quoted_string/1 - 6~n"),
    try split_quoted_string("\"foo ") of
	SQS_Res6 -> throw({error, test_case_failed, SQS_Res6})
    catch
	error: no_end_quote -> ok
    end,

    ok.

test2() ->
    try split_quoted_string("") of
	SQS_Res5 -> throw({error, test_case_failed, SQS_Res5})
    catch
	error: does_not_start_with_quote -> ok
    after
	ok
    end,
    try split_quoted_string("") of
	SQS_Res6 -> throw({error, test_case_failed, SQS_Res6})
    catch
	error: no_end_quote -> ok
    after
	ok
    end,
    ok.

-record(state, {connect_all, known = [], synced = [],
		lockers = [], syncers = [], node_name = node(),
		the_locker, the_deleter}).

handle_cast({in_sync, Node, IsKnown}, S) ->
    NewS = cancel_locker(Node, S, get({sync_tag_my, Node})),
    NKnown = case lists:member(Node, Known = NewS#state.known) of
		 false when IsKnown == true ->
1/0,
		     gen_server:cast({global_name_server, Node},
				     {in_sync, node(), false}),
		     [Node | Known];
		 _ ->
		     Known
	     end.

cancel_locker(Node, S, Tag) ->
    ok.
