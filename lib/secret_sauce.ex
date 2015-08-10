defmodule EcodeGen.SecretSauce do
  @acceptable_characters "0123456789ABCDEFGHIJKLMNOPQRSTUV"

  def generate_message(bits, args) do
      step1 = for x <- Enum.zip(args, bits), do: format_field(elem(x, 0), elem(x, 1))
      # step1 = [format_field(elem(x[0]), elem(x[1])) for x in Enum.zip(args, bits)]

      step1_joined_list = Enum.join([step1], "")
      step2 = for x <- chunks(step1_joined_list, 5), do: String.to_integer(x, 2)
      # step2 = [int(x, base=2) for x in chunks(''.join(step1), 5)]

      step3 = for x <- step2, do: String.slice(@acceptable_characters, x, 1)
      Enum.join(step3, "")
      # step3 = [CHARS[x] for x in step2]
      # return ''.join(step3)
  end

  defp format_field(value, bit) when is_float(value) do
      format_field(round(value), bit)
  end
  defp format_field(value, bit) when is_integer(value) do
      enc_value = Integer.to_char_list(value, 2)

      stringA = ""
      repeat_n_times = bit - length(enc_value)
      if repeat_n_times >= 0 do
        stringA = String.duplicate("0", bit - length(enc_value))
      end

      Enum.join([stringA, enc_value], "")
  end

  defp chunks(l, n) do
      for i <- Enum.take_every(0..String.length(l) - n, n), do: String.slice(l, i, n)
      # return [l[i:i+n] for i in range(0, len(l), n)]
  end

end