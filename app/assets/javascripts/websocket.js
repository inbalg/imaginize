var socket, host;
host = "ws://localhost:3001";

function connect() {
  try {
    socket = new WebSocket(host);

    // socket.onopen = function() {
    // }

    // socket.onclose = function() {
    // }

    socket.onmessage = function(msg) {
      // this is the button clicked event
    }
  }
}

$(function() {
  connect();
});
