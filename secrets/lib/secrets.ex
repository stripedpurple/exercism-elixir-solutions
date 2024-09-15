defmodule Secrets do
  def secret_add(secret) do
    fn s2 -> s2 + secret end
  end

  def secret_subtract(secret) do
    fn s2 -> s2 - secret end
  end

  def secret_multiply(secret) do
    fn s2 -> s2 * secret end
  end

  def secret_divide(secret) do
    fn s2 -> div s2 , secret end
  end

  def secret_and(secret) do
    fn s2 -> Bitwise.band(s2, secret) end
  end

  def secret_xor(secret) do
    fn s2 -> Bitwise.bxor(s2, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn s2 -> secret_function2.(secret_function1.(s2)) end
  end
end
