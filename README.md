# pen_test

This is a very simple penetration test that will use a mocked up Auth module to test and identify if valid users take a different amount of time than an invalid user.  This type of test is helpful to prevent brute forcing usernames to find valid usernames.

  - Auth Module used to mock user/password lookup
  - simple test file to run through n itterations and find an average

### How To Run the test
```sh
$ perl t/pen_test.t
User: aaaaa     Average: 0.000005
User: aabbcc    Average: 0.000006
User: bbbbb     Average: 0.000005
User: bob       Average: 1.000203
User: frank     Average: 0.000012
User: jessica   Average: 0.000004
User: john      Average: 1.000209
User: matt      Average: 1.000211
User: sarah     Average: 0.000006
User: suzy      Average: 0.000005
```
