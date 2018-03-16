import PropTypes from 'prop-types';
import React     from 'react';

import HalfDayAvailability from './HalfDayAvailability.jsx';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);
    this.state = { name: this.props.name };
  }

  updateName = (name) => {
    this.setState({ name });
  };

  render() {
    return (
        <table className='table'>
          <thead>
            <tr>
              <th>TECH</th>
              <th>Lundi</th>
              <th>Mardi</th>
              <th>Mercredi</th>
              <th>Jeudi</th>
              <th>Vendredi</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td rowspan='2'>PATHE</td>
              <td>TECH</td>
              <td>TECH</td>
              <td>TECH</td>
              <td>TECH</td>
              <td>TECH</td>
            </tr>
            <tr>
              <td>TECH</td>
              <td>TECH</td>
              <td>TECH</td>
              <td>TECH</td>
              <td>TECH</td>
            </tr>
          </tbody>
        </table>
    );
  }
}
