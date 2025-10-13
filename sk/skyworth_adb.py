import hashlib
import sys


def calculate_number(answer_md5):
    if answer_md5 and len(answer_md5) >= 32:
        before_str = answer_md5[:16]
        after_str = answer_md5[16:32]

        before_num = 0
        for c in before_str:
            before_num += int(str(ord(c) - 0x30), 10)

        after_num = 0
        for c in after_str:
            after_num += int(str(ord(c) - 0x30))

        return before_num * after_num
    return 0


def calculate_password(mac, random):
    full_str = f"JSCMCC_SKYWORTH{mac}{random}tianhuaxin@skyworth.com"
    print("sb =", full_str)
    answer_md5 = hashlib.md5(full_str.encode("utf-8")).hexdigest()
    return str(calculate_number(answer_md5))


print(calculate_password(sys.argv[1], sys.argv[2]))
