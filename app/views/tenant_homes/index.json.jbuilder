json.array!(@tenant_homes) do |tenant_home|
  json.extract! tenant_home, :id, :tenant_id, :home_id
  json.url tenant_home_url(tenant_home, format: :json)
end
