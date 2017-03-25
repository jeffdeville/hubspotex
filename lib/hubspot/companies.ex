defmodule Hubspot.Companies do
  @doc """
  Used to get all of the companies in a portal. Returns a paginated list of companies.

  In addition to the list of companies, each request will also return two values, offset and has-more. If has-more is true, you'll need to make another request, using the offset to get the next page of company records.

  Returns a struct that is used in `Hubspot.Client` for
  getting all contacts from Hubspot.

  ## Examples
      iex> Hubspot.Companies.all()
      %Hubspot.HTTP.Request{endpoint: "/companies/v2/companies/paged",
        method: :get, query: [], body: ""}
      iex> Hubspot.Companies.all([count: 10, vidOffset: 100])
      %Hubspot.HTTP.Request{endpoint: "/companies/v2/companies/paged",
      method: :get, query: ["count": 10, "vidOffset": 100], body: ""}
  """
  @spec all(list) :: %Hubspot.HTTP.Request{}
  def all(params \\ []) do
    %Hubspot.HTTP.Request{
      endpoint: "/companies/v2/companies/paged",
      method: :get,
      query: params
    }
  end

  @doc """
  Returns an object representing the company with the id :companyId associated with the specified portal. Particularly useful if you're performing lookups on specific attributes of a company.

  Get a contact matching the email.

  ## Example
      iex> Hubspot.Companies.get_by_id(1234)
      %Hubspot.HTTP.Request{endpoint: "/companies/v2/companies/1234",
        method: :get, query: [], body: ""}

  """
  @spec get_by_id(integer) :: %Hubspot.HTTP.Request{}
  def get_by_id(id) do
    %Hubspot.HTTP.Request{
      endpoint: "/companies/v2/companies/#{id}"
    }
  end
end
