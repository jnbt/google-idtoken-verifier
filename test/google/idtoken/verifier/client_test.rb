require "test_helper"

class ClientTest < Minitest::Test
  include WithFixtures

  def test_it_returns_success_api_result
    stub_api_call_with_body(fixture_content("success.json"))
    result = client.call
    expected = {
      "iss"            => "accounts.google.com",
      "aud"            => "some-id.apps.googleusercontent.com",
      "sub"            => "123456789012345678901",
      "email_verified" => "true",
      "azp"            => "some-otherid.apps.googleusercontent.com",
      "email"          => "foo@bar.com",
      "iat"            => "1234567890",
      "exp"            => "0987654321",
      "name"           => "Max Mustermann",
      "given_name"     => "Max",
      "family_name"    => "Mustermann",
      "alg"            => "RS256",
      "kid"            => "some_random_data_from_google"
    }
    assert_equal expected, result
  end

  def test_it_returns_failing_api_result
    stub_api_call_with_body(fixture_content("failure.json"))
    result = client.call
    expected = {
      "error_description" => "Invalid Value"
    }
    assert_equal expected, result
  end

  def test_it_wraps_any_network_error
    stub_api_call.to_timeout
    assert_raises Google::Idtoken::Verifier::Error do
      client.call
    end
  end

  def test_connect_to_real_api_but_fails
    real do
      result = client.call
      expected = {
        "error_description" => "Invalid Value"
      }
      assert_equal expected, result
    end
  end

  private

  def stub_api_call_with_body(body)
    stub_api_call
      .to_return(status: 200, body: body, headers: {})
  end

  def stub_api_call
    uri = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{id_token}"
    stub_request(:get, uri)
  end

  def client
    @client ||= Google::Idtoken::Verifier::Client.new(id_token)
  end

  def id_token
    "any_id_token"
  end

  def real
    WebMock.allow_net_connect!
    yield
  ensure
    WebMock.disable_net_connect!
  end
end
