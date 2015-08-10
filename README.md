# EcodeGen

Read:

http://www.phoenixframework.org/docs/installation


Testing
=======

```
time MIX_ENV=test mix test test/lib/code_generation_test.exs
```

**1M codes generated**

```
time MIX_ENV=test mix test test/lib/code_generation_test.exs  108.21s user 3.42s system 99% cpu 1:52.40 total
```

**interesting points**

1. lib/code_message_generator.ex - hooked into a exposed api EP that takes :batch_uuid and runs the processs
2. lib/secret_sauce.ex - goes the magic numbers
