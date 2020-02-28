# N2O STORYBOOK

This is an example of how to integrate n2o elements into storybook environment. You can build your user interface based on n2o elements in isolation from the main application

## Intro

An example consists of three elements `comboLookUp`, `comboLookUp2` and `calendar`. It creates WebSocket connection to n2o server.
Application is accessible at http://localhost:6006/.

## How to interact with n2o server

In `preview-body.html` you should initialize the webSocket connection and after that send direct messages to your n2o server in the setTimeout

```
<script>host = location.hostname; port = 8050; debug = true;</script>
<script>function disableDays4Charge() { return true; };</script>
<script>function i18n(word) { return word; };</script>
<script>$io.do = function(r) { console.log(r); };</script>
<script>
  protos = [$bert];
  N2O_start();
  setTimeout(() => {
    direct(atom("combolookup"));
    direct(atom("combolookup2"));
    direct(atom("calendar"));
  }, 200);
</script>
```
And on the server side in your router module

```
def route(<<"iframe.html", _::binary>>) do
  case :nitro.qc(:id) do
    "controls--combo-look-up" -> COMBOLOOKUP.Index
    "controls--combo-look-up-2" -> COMBOLOOKUP2.Index
    "controls--calendar" -> CALENDAR.Index
    _ -> COMBOLOOKUP.Index
  end
end
```

## Setup

To run review application clone and follow the steps necessary to install a [storybook/html](https://storybook.js.org/docs/guides/guide-html/)
```
$ git clone https://github.com/synrc/storybook.git
$ cd storybook
$ npm run storybook
```