var AllItems = React.createClass({
  getInitialState() {
    return { support_requests: [] }
  },

  componentDidMount() {
    $.getJSON('/customers.json', (response) => { this.setState({ support_requests: response }) });
  },

  render() {
    var support_requests= this.state.support_requests.map((support_request) => {
      return (
        <div key={support_request.id}>
          <h3>{support_request.product_name}</h3>
          <p>{support_request.created_at}</p>
          <p>{support_request.request_state}</p>
          <p>{support_request.title}</p>
        </div>
      )
    });

    return(
      <div>
        {support_requests}
      </div>
    )
  }
});
