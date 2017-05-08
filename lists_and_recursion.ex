defmodule ListsAndRecursion do
  @moduledoc false

  def mapsum([], _), do: 0
  def mapsum([head | tail], func) do
    func.(head) + mapsum tail, func
  end

  defp max_([], acc), do: acc
  defp max_([head | tail], acc) do
    if head > acc do
      max_ tail, head
    else
      max_ tail, acc
    end
  end

  def max([]), do: "Max for an empty list is undefined"
  def max([head | tail]), do: max_ [head | tail], head

  def caesar(charlist, n) do 
    map charlist, &(rem &1 + n, 122)
  end

  def map([], _), do: []
  def map([head | tail], func) do
    [func.(head)] ++ map(tail, func)
  end

  def span(from, to) when from > to, do: "Error: from > to"
  def span(to, to), do: [to] 
  def span(from, to) do
    [from] ++ span(from + 1, to)
  end

  def all?([], _), do: true
  def all?([head | tail], question) do
    if question.(head) do
      all? tail, question
    else
      false
    end
  end

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each tail, func
  end

  def filter([], _), do: [] 
  def filter([head | tail], question) do
    if question.(head) do
      [head] ++ filter tail, question
    else
      filter tail, question
    end
  end

  def my_length(list), do: mapsum list, fn x -> 1 end

  def reverse([]), do: []
  def reverse([head | tail]) do
    reverse(tail) ++ [head]
  end
  
  defp split_([], _, _), do: []
  defp split_(list, int, int), do: []
  defp split_([head | tail], int, count) do
    [head] ++ split_(tail, int, count + 1)
  end

  def split(list, int) do
    len = my_length list
    int = cond do
      int < -len ->    0
      int >  len ->  len
      int <    0 ->  int + len
      true       ->  int      
    end
    first_part = split_ list, int, 0
    second_part = reverse(list)
                  |> split_(len - int, 0) 
                  |> reverse
    [first_part] ++ [second_part]
  end

end
