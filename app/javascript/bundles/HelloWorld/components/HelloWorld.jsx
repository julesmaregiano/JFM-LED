import PropTypes from 'prop-types';
import React     from 'react';

import HalfDayAvailability from './HalfDayAvailability.jsx';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired,
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
        <table className='table tableAvailabilities'>
          <tbody>
            <tr>
              <td rowspan='2' class='tech'>Pathé</td>
              <Availability />
              <Availability checked={true}/>
              <Availability css='danger' />
              <Availability css='warning' />
              <Availability css='success' />
            </tr>
            <tr>
              <Availability css='danger' />
              <Availability />
              <Availability  css='warning' />
              <Availability checked={true} />
              <Availability  checked={true} css='success' />
            </tr>
            <tr>
              <td rowspan='2' class='tech'>MarieTech</td>
              <Availability />
              <Availability checked={true}/>
              <Availability css='danger' />
              <Availability css='warning' />
              <Availability css='success' />
            </tr>
            <tr>
              <Availability css='danger' />
              <Availability />
              <Availability  css='warning' />
              <Availability checked={true} />
              <Availability  checked={true} css='success' />
            </tr>
            <tr>
              <td rowspan='2' class='tech'>Jules Tech</td>
              <Availability />
              <Availability  />
              <Availability  />
              <Availability />
              <Availability css='success' />
            </tr>
            <tr>
              <Availability />
              <Availability />
              <Availability  css='warning' />
              <Availability />
              <Availability  checked={true} css='success' />
            </tr>
          </tbody>
        </table>
    );
  }
}

class Availability extends React.Component {
  render() {
    let { css, checked } = this.props
    return (
        <td className={css}>
          <input type='checkbox' checked={checked} />
        </td>
    );
  }
}
