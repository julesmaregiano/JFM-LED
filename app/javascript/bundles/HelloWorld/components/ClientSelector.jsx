import React from 'react';
import Popup from "reactjs-popup";

export default class ClientSelector extends React.Component {
  constructor(props) {
    super(props);
    this.state = { open: false };
  }

  openModal = () => {
    this.setState({ open: true });
  };

  closeModal = () => {
    this.setState({ open: false });
  };


  render() {
     return (
       <div>
         <i className='fa fa-user fa-2x' onClick={this.openModal} />
         <CreateClientPopup open={this.state.open}  />
       </div>
     );
   }
}

class CreateClientPopup extends React.Component {
  render() {
    var { open } = this.props;
    return (
      <Popup open={open} modal closeOnDocumentClick>
        <div>
          <br />
          <div class='input-group'>
            <label className='input-group-addon'>Nom de l'entreprise</label>
            <input type='text'className="form-control" />
          </div>
          <br />
          <div className='input-group'>
            <label className='input-group-addon'>Siret</label>
            <input type='text' className="form-control" />
          </div>
          <br />
          <div className='input-group'>
            <button>Créer ce client!</button>
          </div>
        </div>
      </Popup>
    )

  }
}
