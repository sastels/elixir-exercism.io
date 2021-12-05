defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a0, a1}, {b0, b1}) do
    reduce({a0 * b1 + b0 * a1, a1 * b1})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a0, a1}, {b0, b1}) do
    reduce({a0 * b1 - b0 * a1, a1 * b1})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a0, a1}, {b0, b1}) do
    reduce({a0 * b0, a1 * b1})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, {d0, d1}) do
    multiply(num, {d1, d0})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a0, a1}) do
    {Kernel.abs(a0), Kernel.abs(a1)}
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a0, a1}, n) when n >= 0 do
    {Integer.pow(a0, n), Integer.pow(a1, n)}
  end

  def pow_rational({a0, a1}, n) when n < 0 do
    {Integer.pow(a1, n), Integer.pow(a0, n)}
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {n0, n1}) do
    :math.pow(x, n0 / n1)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a0, a1}) when a1 > 0 do
    gcd = Integer.gcd(a0, a1)
    {div(a0, gcd), div(a1, gcd)}
  end

  def reduce({a0, a1}) when a1 < 0 do
    gcd = Integer.gcd(a0, a1)
    {div(-a0, gcd), div(-a1, gcd)}
  end
end
