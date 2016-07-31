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
      startGuessing();
    }
  } catch(exception) {
      alert('error!!!');
      console.log(exception);
  }
}

$(function() {
  connect();
});
