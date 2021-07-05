import urllib.request
import sys
import webbrowser

# urllib.request.urlopen('http://delfi.lt')

print("Opening in separate tabs:\n\n")

for eachArg in sys.argv[1:]:
    for eachParcel in eachArg.split():
        webbrowser.open("https://parcelsapp.com/tracking/{}".format(eachParcel), new=2)
        print(eachParcel)
