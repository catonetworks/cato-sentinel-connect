import sys
import urllib.parse

if len(sys.argv) != 2:
    print("invalid arguments...")
    print("should be url.py <url>")
    quit()

url_string = urllib.parse.quote_plus(sys.argv[1])

print(url_string)