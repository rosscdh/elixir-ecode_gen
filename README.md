# EcodeGen


time MIX_ENV=test mix test test/lib/code_generation_test.exs

interesting points

1. lib/code_message_generator.ex - hooked into a exposed api EP that takes :batch_uuid and runs the processs
2. lib/secret_sauce.ex - goes the magic numbers
