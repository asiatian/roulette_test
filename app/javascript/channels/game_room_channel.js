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
    var table = document.getElementById('table_1')
    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    cell1.innerHTML = "Nº"+data["id"];
    cell2.innerHTML = data["color"];
    var td = ""
    data["details"].forEach(element => td = td +
      "<div class='"+element['background']+
      "'><div class='col-1'><h6><strong> "+element['text']+
      "!</strong></h6></div><div class='col-2'><strong>Nombre:</strong> "+element['name']+
      "</div><div class='col-3'><strong>Monto Apostado:</strong> "+element['bet']+' ('+element['percentage']+
      '% del saldo)</div><div class="col-2"><strong>Color Selecionado:</strong> '+element['color']+
      '</div><div class="col-2"><strong>+/-:</strong> '+element['amount']+'</div></div>'
    );
    cell3.innerHTML = "<table><tbody>" + td + "</tbody></table>"

    // Called when there's incoming data on the websocket for this channel
  }
});
