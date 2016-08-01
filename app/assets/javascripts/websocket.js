var socket, host;
var pressed;
host = "ws://localhost:3001";

function connect() {
  try {
    socket = new WebSocket(host);


    socket.onopen = function() {
      pressed = false;
    }

    // socket.onclose = function() {
    // }

    socket.onmessage = function(msg) {
        if (msg.data == 'button pressed'){
          if (!pressed) {
          pressed = true;
          startGuessing();
          setTimeout(function() {
            pressed = false;
          }, 1000)
        }
      }
    }
  } catch(exception) {
    console.log(exception);
  }
}

$(function() {
  connect();
});
