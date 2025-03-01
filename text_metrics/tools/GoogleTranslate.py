
def translate(to_translate, to_langage="auto", langage="auto"):
    """Docstring."""
    from urllib.request import Request, urlopen
    from urllib.parse import quote
    agents = {'User-Agent':"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30)"}
    before_trans = 'class="t0">'
    link = "http://translate.google.com/m?hl=%s&sl=%s&q=%s" % (to_langage, langage, quote(to_translate).replace(" ", "+"))
    request = Request(link, headers=agents)
    page = str(urlopen(request).read())
    result = page[page.find(before_trans) + len(before_trans):]
    result = result.split("<")[0].replace('&#39;', "'")
    return result
