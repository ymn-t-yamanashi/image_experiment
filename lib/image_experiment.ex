defmodule ImageExperiment do
  @moduledoc """
  Documentation for `ImageExperiment`.
  """
  @tmp_image_path "/dev/shm/cv.png"

  @doc """
  Hello world.

  ## Examples

      iex> ImageExperiment.hello()
      :world

  """
  def hello do
    Image.open!("test.png")
    |> lines(1..1000//5 |> Enum.to_list())
    |> display_image()

    :world
  end

  def lines(image, []), do: image
  def lines(image, [x | range]), do: line(image, x) |> lines(range)

  def line(image, x) do
    Image.Draw.line!(image, 0, 0, x, 450, color: "#0000ff")
  end

  def display_image(image) do
    Image.write(image, @tmp_image_path)
    System.cmd("eog", [@tmp_image_path])
  end
end
