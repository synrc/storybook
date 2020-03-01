-module(koatuu).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("nitro/include/koatuuControl.hrl").
-include_lib("n2o/include/n2o.hrl").

event(koatuu) ->
    nitro:insert_top(koatuu, nitro:render(#koatuu{}));

event(_) -> [].