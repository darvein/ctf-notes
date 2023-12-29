# Easy - H1 Thermostat
Category: Android

We firstly get the challenge APK file:
```bash
~➤ du -hs thermostat.apk
2.5M    thermostat.apk
~➤ file thermostat.apk
thermostat.apk: Android package (APK), with AndroidManifest.xml, with APK Signing Block
```

Let's now decompile, something went wrong though but I don't think its critical, we still have a bunch of files to read.
```bash
~z➤ jadx -d src thermostat.apk
INFO  - loading ...
INFO  - processing ...
ERROR - finished with errors, count: 3

~z/src➤ cloc .
    1274 text files.
    1211 unique files.
     360 files ignored.

github.com/AlDanial/cloc v 1.98  T=1.22 s (989.3 files/s, 161454.9 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Java                           873          18186           6341         163057
XML                            338              0              0          10052
-------------------------------------------------------------------------------
SUM:                          1211          18186           6341         173109
-------------------------------------------------------------------------------
```

Humm... this was so easy:
```bash
~z/src➤ ag '\^FLAG'
sources/com/hacker101/level11/PayloadRequest.java
31:        messageDigest.update("^FLAG^xxxxxxxxxxxxxxxxxxx$FLAG$".getBytes());
34:        this.mHeaders.put("X-Flag", "^FLAG^xxxxxxxxxxxxxxxxxxx$FLAG$");
```

Done.
