# N2O STORYBOOK

This is an example of how to integrate n2o elements into storybook environment. You can build your user interface based on n2o elements in isolation from the main application

## Intro

An example consists of two elements `comboLookup` and `textarea`. It creates WebSocket connection to n2o server.
Application is accessible at http://localhost:6006/.

## How to interact with n2o server

This example comes with a simple H2O server, but you can also use your own server, you only need to follow the following steps

In `preview-body.html` you should initialize the WebSocket connection and after that send direct messages to your n2o server in the `setTimeout`

```
<script>host = location.hostname; port = 8001; debug = true;</script>
<script>$io.do = function(r) { console.log(r); };</script>
<script>
  protos = [$bert];
  N2O_start();
  setTimeout(() => {
    direct(atom("combolookup"));
    direct(atom("textarea"));
  }, 200);
</script>
```
And on the server side in your router module

```
route(<<"iframe.html",_/binary>>) ->
  Id = nitro:qc(id),
  case Id of
    <<"controls--combo-look-up">> -> combolookup;
    <<"controls--text-area">> -> textarea
  end;

```
In the page module, you need process a direct message from the client and render your elements. And you can handle any events related to your elements.

```
event(combolookup) ->
    nitro:insert_top(combo_lookup, nitro:render(#comboLookup{value=["SunRise"]}));
```

## Setup

To run review application, clone and follow the steps necessary to install a [storybook/html](https://storybook.js.org/docs/guides/guide-html/)
```
$ git clone https://github.com/synrc/storybook.git
$ cd storybook
$ npm run storybook
```

And in another console you need start the server

```
$ cd server
$ mad dep com pla rep
```