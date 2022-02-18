defmodule Exlivery.Users.UserTeste do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      name: "Peixonalta Aquatico",
      email: "peixonalta_aquatico@email.com",
      cpf: "45634578698",
      age: 23
      address: "Mar Vermelho, Lado A"

      response = User.build(address, name, email, cpf, age)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are inválid parameters" do
      address = "Rua Peixoto"
      name = "Peixonalta Peixe Jr."
      email = "peixe_aquatico@email.com"
      cpf = "38594034298"
      age = 10

      response = User.build(address, name, email, cpf, age)
      expected_response = {:error, "inválid parameters"}

      assert response == expected_response
    end
  end
end
