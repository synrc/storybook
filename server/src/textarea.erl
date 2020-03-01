-module(textarea).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/n2o.hrl").

event(textarea) ->
    nitro:insert_top(text_area, nitro:render(#textarea{cols=5}));

event(_) -> [].