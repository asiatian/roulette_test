import React from 'react'
import {  BrowserRouter as Router, Route, Switch, Link } from "react-router-dom";


const Banner = () => {
  return (
    <div className="row p-5 bg-info text-white">
      <div className="col-4">
        <h1> Ruleta del Tiempo </h1>
      </div>
      <div className="col-4">
        <h3> Opciones </h3>
        <a href="/users" className="btn btn-dark">Ver Jugadores</a>
      </div>
      <div className="col-4">
      </div>
    </div>
  )
}

export default Banner
