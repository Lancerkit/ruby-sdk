require 'httparty'

HOST = 'https://api.lancerkit.com'

class Lancerkit
  def initialize(api_key)
    @api_key = api_key 
  end
  
  def list_documents(sort='-date', page=1)
    HTTParty.get(HOST + "/documents", {query: {sort:sort, page: page}, headers: {authorization: @api_key}})
  end
  
  def list_contacts(sort='-date', page=1)
    HTTParty.get(HOST + "/contacts", {query: {sort:sort, page: page}, headers: {authorization: @api_key}})
  end
  
  def list_transactions(sort='-date', page=1)
    HTTParty.get(HOST + "/transactions", {query: {sort:sort, page: page}, headers: {authorization: @api_key}})
  end
  
  def create_document(data)
    self.edit_document('new', data)
  end
  
  def create_contact(data)
    self.edit_contact('new', data)
  end
  
  def edit_document(id, data)
    HTTParty.get(HOST + "/documents/#{id}", {body: data.to_json, headers: {authorization: @api_key, 'Content-Type': 'application/json'}})
  end
  
  def edit_contact(id, data)
    HTTParty.get(HOST + "/contacts/#{id}", {body: data.to_json, headers: {authorization: @api_key, 'Content-Type': 'application/json'}})
  end
  
  def edit_transaction(id, data)
    HTTParty.get(HOST + "/transactions/#{id}", {body: data.to_json, headers: {authorization: @api_key, 'Content-Type': 'application/json'}})
  end
  
  def delete_documents(ids)
    HTTParty.post(HOST + "/documents/delete", {body: ids.to_json, headers: {authorization: @api_key, 'Content-Type': 'application/json'}})
  end
  
  def delete_contacts(ids)
    HTTParty.post(HOST + "/contacts/delete", {body: ids.to_json, headers: {authorization: @api_key, 'Content-Type': 'application/json'}})
  end
  
  def delete_transactions(ids)
    HTTParty.post(HOST + "/transactions/delete", {body: ids.to_json, headers: {authorization: @api_key, 'Content-Type': 'application/json'}})
  end
end