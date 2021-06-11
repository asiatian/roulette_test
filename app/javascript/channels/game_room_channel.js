import consumer from "./consumer"

consumer.subscriptions.create("GameRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    var table = document.getElementById('rounds_table')
    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    cell1.innerHTML = "Juego Nº"+data["id"];
    cell2.innerHTML = data["color"];
    var td = ""
    data["details"].forEach(element => td = td + "<th>"+ element["name"] + "</th><td>"+element["color"]+ "</td><td>$ "+ element["amount"]+ "</td>");
    cell3.innerHTML = "<table><tbody>" + td + "</tbody></table>"

    // Called when there's incoming data on the websocket for this channel
  }
});
