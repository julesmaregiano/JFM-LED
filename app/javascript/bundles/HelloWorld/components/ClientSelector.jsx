import React from 'react';
import Popup from "reactjs-popup";

export default class ClientSelector extends React.Component {
  render() {
    return (
      <Popup
        trigger={<i className="fa fa-user"> Open Modal </i>}
        modal
        closeOnDocumentClick
      >
        <div>
          <div class='input-group'>
            <label className='input-group-addon'>Nom de l'entreprise</label>
            <input type='text'className="form-control" />
          </div>
          <div className='input-group'>
            <label className='input-group-addon'>Siret</label>
            <input type='text' className="form-control" />
          </div>
        </div>
      </Popup>
    )
  }
}
