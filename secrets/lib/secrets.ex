defmodule Secrets do
  def secret_add(secret) do
    fn op ->
      op + secret
    end
  end

  def secret_subtract(secret) do
    &(&1 - secret)
  end

  def secret_multiply(secret) do
    &(&1 * secret)
  end

  def secret_divide(secret) do
    fn op ->
      div(op, secret)
    end
  end

  def secret_and(secret) do
    fn op ->
      Bitwise.&&&(op, secret)
    end
  end

  def secret_xor(secret) do
    &(Bitwise.^^^(&1, secret))
  end

  def secret_combine(secret_function1, secret_function2) do
    fn op ->
      secret_function2.(secret_function1.(op))
    end
  end

end
