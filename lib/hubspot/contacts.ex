defmodule Hubspot.Contacts do
  @base Application.get_env(:hubspotex, :base_url)

  @doc """
  Returns a struct that is used in `Hubspot.Client` for
  getting all contacts from Hubspot.

  ## Examples
      iex> Hubspot.Contacts.all()
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/lists/all/contacts/all",
        method: :get, query: nil, json: nil}

      iex> Hubspot.Contacts.all([count: 10, vidOffset: 100])
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/lists/all/contacts/all",
        method: :get, query: [count: 10, vidOffset: 100], json: nil}
  """
  @spec all(list) :: %Hubspot.Request{}
  def all(params \\ nil) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/lists/all/contacts/all",
      method: :get,
      query: params }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_email("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_by_email(String.t) :: %Hubspot.Request{}
  def get_by_email(email) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/email/#{email}/profile",
      method: :get }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create([properties: [name: "test", value: "test"]])
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact",
        method: :get, query: nil, json: [properties: [name: "test", value: "test"]]}
  """
  @spec create(list) :: %Hubspot.Request{}
  def create(properties) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact",
      method: :post,
      json: properties }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.update(1234, [properties: [name: "first_name", value: "Fred"]])
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/vid/1234/profile",
        method: :get, query: nil, json: [properties: [name: "first_name", value: "Fred"]]}
  """
  @spec update(integer, list) :: %Hubspot.Request{}
  def update(id, properties) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/vid/#{id}/profile",
      method: :post,
      json: properties }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create_or_update("test@hubspot.com", [properties: [name: "first_name", value: "Fred"]])
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/createOrUpdate/email/test@hubspot.com",
        method: :post, query: nil, json: [properties: [name: "first_name", value: "Fred"]]}
  """
  @spec create_or_update(String.t, list) :: %Hubspot.Request{}
  def create_or_update(email, properties \\ nil) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/createOrUpdate/email/#{email}",
      method: :post,
      json: properties }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create_or_update_batch([vid: [1234, 1235]])
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/batch",
        method: :post, query: nil, json: [vid: [1234, 1235]]}
  """
  @spec create_or_update_batch(list) :: %Hubspot.Request{}
  def create_or_update_batch(contacts) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/batch",
      method: :post,
      json: contacts }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.delete("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec delete(integer) :: %Hubspot.Request{}
  def delete(id) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/vid/#{id}",
      method: :delete }
  end

  @doc """
  For a given portal, return all contacts that have been recently updated or created.
  A paginated list of contacts will be returned to you, with a maximum of 100 contacts per page, as specified by
  the "count" parameter. The endpoint only scrolls back in time 30 days.

  ## Example
      iex> Hubspot.Contacts.recent("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec recent(list) :: %Hubspot.Request{}
  def recent(params \\ nil) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/lists/recently_updated/contacts/recent",
      method: :get,
      query: params }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_id("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_by_id(integer) :: %Hubspot.Request{}
  def get_by_id(id) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/vid/#{id}/profile",
      method: :get }
  end

  @doc """
  For a given portal, return information about a group of contacts by their unique ID's. A contact's unique ID's
  is stored in a field called 'vid' which stands for 'visitor ID'.

  This method will also return you much of the HubSpot lead "intelligence" for each requested contact record. The
  endpoint accepts many query parameters that allow for customization based on a variety of integration use cases.

  ## Example
      iex> Hubspot.Contacts.get_batch_by_ids("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_batch_by_ids(list) :: %Hubspot.Request{}
  def get_batch_by_ids(params) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/vids/batch/",
      method: :get,
      query: params }
  end

  @doc """
  For a given portal, return information about a group of contacts by their email addresses.

  This method will also return you much of the HubSpot lead "intelligence" for each requested contact record. The
  endpoint accepts many query parameters that allow for customization based on a variety of integration use cases.

  ## Example
      iex> Hubspot.Contacts.get_batch_by_emails("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_batch_by_emails(list) :: %Hubspot.Request{}
  def get_batch_by_emails(params) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/emails/batch/",
      method: :get,
      query: params }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_token("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_by_token(String.t) :: %Hubspot.Request{}
  def get_by_token(utk) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/utk/#{utk}/profile",
      method: :get }
  end

  @doc """
  For a given portal, return information about a group of contacts by their user tokens (hubspotutk).

  This method will also return you much of the HubSpot lead "intelligence" for each requested contact
  record. The endpoint accepts many query parameters that allow for customization based on a variety of
  integration use cases.

  The endpoint does not allow for CORS, so if you are looking up contacts from their user token on the client,
  you'll need to spin up a proxy server to interact with the API.

  ## Example
      iex> Hubspot.Contacts.get_batch_by_tokens("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_batch_by_tokens(list) :: %Hubspot.Request{}
  def get_batch_by_tokens(params) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contact/utks/batch/",
      method: :get,
      query: params }
  end

  @doc """
  For a given portal, return contacts and some data associated with
  those contacts by the contact's email address or name.

  Please note that you should expect this method to only return a small
  subset of data about the contact. One piece of data that the method will
  return is the contact ID (vid) that you can then use to look up much
  more data about that particular contact by its ID.

  ## Example
      iex> Hubspot.Contacts.search("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec search(String.t, list) :: %Hubspot.Request{}
  def search(query, params \\ nil) do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/search/query",
      method: :get,
      query: params }
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.statistics("test@hubspot.com")
      %Hubspot.Request{endpoint: "#{@base}/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec statistics() :: %Hubspot.Request{}
  def statistics() do
    %Hubspot.Request{
      endpoint: "#{@base}/contacts/v1/contacts/statistics",
      method: :get }
  end
end
