var socket, host;
host = "ws://localhost:3001";

function connect() {
  try {
    socket = new WebSocket(host);

    // socket.onopen = function() {
    // }

    // socket.onclose = function() {
    // }
    var pressed = false;
    socket.onmessage = function(msg) {
      if (!pressed) {
        if (msg.data == 'button pressed'){
          pressed = true;
          startGuessing();
        }
        pressed = false;
      }
    }
  } catch(exception) {
    console.log(exception);
  }
}

$(function() {
  connect();
});
