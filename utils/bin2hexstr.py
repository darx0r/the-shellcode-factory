import sys

def main():

    if len(sys.argv) != 2:
        print 'usage: %s <bin_file>' % sys.argv[0]
        return 

    binf = sys.argv[1]
    cbytes = bytearray(open(binf,"rb").read())
    print "".join(["\\x%02x" % b for b in cbytes])

main()

