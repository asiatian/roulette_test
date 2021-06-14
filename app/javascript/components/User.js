import React from "react"
import PropTypes from "prop-types"

class User extends React.Component {
  render () {
    return (
      <React.Fragment>
        Name: {this.props.name}
        Lastname: {this.props.lastname}
        Email: {this.props.email}
        Balance: {this.props.balance}
      </React.Fragment>
    );
  }
}

User.propTypes = {
  name: PropTypes.string,
  lastname: PropTypes.string,
  email: PropTypes.string,
  balance: PropTypes.decimal
};
export default User
