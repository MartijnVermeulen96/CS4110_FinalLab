from shutil import copyfile
import re
import os


def overwrite(src):
    dst = src + '_backup'

    if os.path.isfile(dst):
        answer = input('Backup already exists, continue (y)?')

        if not (answer == "y"):
            return

    with open(src, 'r') as f:
        content = f.read()
    content_new = re.sub('if\([ ]+cf==1[ ]+\)[\s]*fprintf\(stderr, "Invalid input: [\s\S]*int main\(\)',
                         'if( cf==1 ){\nstd::cout << "Invalid input: " << input << std::endl;\n}\n} \n\n int main()', content,
                         flags=re.M)
    content_new = content_new.replace('extern void __VERIFIER_error(int);',
                                      'void __VERIFIER_error(int i){\n std::cout << "ERROR " << i << std::endl;\n}')
    content_new = re.sub('\/\/ read input[\s\S]*int input;[\s\S]*scanf\("%d", &input\);[\s\S]*\/\/ operate eca engine',
                         '// read input\nint input = 0;\n int ret = scanf("%d", &input);\n if (ret != 1) return 0;\n// operate eca engine',
                         content_new, flags=re.M)
    content_new = "#include <iostream>\n" + content_new.replace('return -2;', 'return 0;')

    copyfile(src, dst)

    with open(src, 'w') as f:
        f.write(content_new)
        f.close()



def main():
    print("What do you want to do?")
    print("1   Overwrite all Problem*/Problem*.c files")
    print("2   Overwrite a single file")
    print("3   Reset all files using the backup")

    choice = int(input("Choose 1/2/3: "))
    if choice == 1:
        for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19]:
            src = 'Problem'+str(i)+'/Problem'+str(i)+'.c'
            overwrite(src)

    if choice == 2:
        src = input("Enter a file path to edit: ")
        overwrite(src)

    if choice == 3:
        for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19]:
            src = 'Problem' + str(i) + '/Problem' + str(i) + '.c'
            dst = src + '_backup'
            copyfile(dst, src)
            os.remove(dst)


if __name__ == "__main__":
    main()

