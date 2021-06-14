// Run this exampoutcomele by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import {Table} from 'react-bootstrap'

const Index = props => (
  <Table responsive id="table_1">
  <thead>
    <tr>
      <th>Numero de Juego</th>
      <th>Resultado</th>
      <th>Detalle del Juego</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    {
      Object.entries(props.bets).reverse().map(([key,value]) =>
      <tr key={key}>
        <td>Nº{key}</td>
        <td>{value.color}</td>
        <td>
          {
            value.plays.map( play =>
              <div className={play.background} key={play.name}>
                <div className="col-1"><h6><strong>{play.text}!</strong></h6></div>
                <div className="col-2"><strong>Nombre:</strong> {play.name}</div>
                <div className="col-3"><strong>Monto Apostado:</strong> {play.bet} ({play.percentage}% del saldo)</div>
                <div className="col-2"><strong>Color Selecionado:</strong> {play.color}</div>
                <div className="col-2"><strong>+/-:</strong> {play.amount}</div>
              </div>
            )
          }
        </td>
        <td></td>
      </tr>
      )
    }

  </tbody>
</Table>
)

Index.defaultProps = {
  bets: ''
}

Index.propTypes = {
  bets: PropTypes.object
}

export default Index
