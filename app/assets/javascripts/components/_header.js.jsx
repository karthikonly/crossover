var Header = React.createClass({
  render() {
    return (
      <div className="header"> 
        <nav className="navbar navbar-default navbar-fixed-top" role="navigation">
          <div className="container">
            <div className="navbar-header">
              <button type="button" className="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span className="sr-only">Toggle navigation</span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
                <span className="icon-bar"></span>
              </button>
              <a className="navbar-brand" href="/">Support Reqest Tool</a>
            </div>
            <div className="collapse navbar-collapse">
              <ul className="nav navbar-nav">
              </ul>
              <p className="navbar-text pull-right">
                Logged in as <strong>customer1@service.com</strong>&nbsp;
                <a href='edit_user_registration_path' className='navbar-link'>Edit profile</a>
                &nbsp;|&nbsp;
                <a href='destroy_user_session_path' className='navbar-link'>Logout</a>
              </p>
            </div>
          </div>
        </nav>
      </div>
    )
  }
});
