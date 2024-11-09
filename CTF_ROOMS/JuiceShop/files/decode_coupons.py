from zmq.utils import z85

decodedFile = open("decode_coupon.md", "w")
with open("coupons_2013.md", "r") as file:
    for line in file.readlines():
        #print(line[:9])
        encode = str.encode(line[:10])
        decrypt = z85.decode(encode).decode()
        decodedFile.write(decrypt + "\n")
        #decodedFile.write(z85.decode(str.encode(line[:-1])))

decodedFile.close()
