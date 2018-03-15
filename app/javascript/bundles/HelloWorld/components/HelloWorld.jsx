import PropTypes from 'prop-types';
import React from 'react';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { name: this.props.name };
  }

  updateName = (name) => {
    this.setState({ name });
  };

  render() {
    return (
        <div id="vueGenerale" className="tab-pane fade in active planning">
          <div className='row rowHeading'>
            <div className='col-md-2'>TECH</div>
            <div className='col-md-2'>Lundi</div>
            <div className='col-md-2'>Mardi</div>
            <div className='col-md-2'>Mercredi</div>
            <div className='col-md-2'>Jeudi</div>
            <div className='col-md-2'>Vendredi</div>
          </div>
          <div className='row rowAvailability'>
            <div className='col-md-2'>
              <p className='technicianName'> PATHE </p>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-success'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-danger'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-warning'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
          </div>
          <div className='row rowAvailability'>
            <div className='col-md-2'>
              <p className='technicianName'>Cyril</p>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-success'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-danger'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-warning'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
          </div>
          <div className='row rowAvailability'>
            <div className='col-md-2'>
              <p className='technicianName'>Jules</p>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-success'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-danger'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-warning'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
            <div className='col-md-2'>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
              <div className='panel panel-default'> <div class='panel-heading'>TEST</div> </div>
            </div>
          </div>
        </div>
    );
  }
}
