-module(combolookup).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/comboLookup.hrl").
-include_lib("n2o/include/n2o.hrl").

event(combolookup) ->
    nitro:insert_top(combo_lookup, nitro:render(#comboLookup{value=["SunRise"]}));

event(_) -> [].