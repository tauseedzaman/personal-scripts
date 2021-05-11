import os
def main():
    for count, filename in enumerate(os.listdir(".")):
        dst ="Zaman" + str(count) + ".mp4"
        src =filename
        dst =dst
        os.rename(src, dst)
if __name__ == '__main__':
    main()