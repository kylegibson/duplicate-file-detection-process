from __future__ import print_function
from collections import defaultdict


def main(args):
    group_by_digest = defaultdict(list)
    input_file = args[0]
    with open(input_file) as f:
        for line in f:
            line = line.strip()
            digest, path = line.split('\t')
            group_by_digest[digest].append(path)

    digests_sorted_by_first_path = sorted(
        group_by_digest.items(),
        key=lambda item: (item[1][0]),
    )

    for digest, paths in digests_sorted_by_first_path:
        for path in paths:
            print('{}\t{}'.format(digest, path))
        print()


if __name__ == '__main__':
    import sys
    main(sys.argv[1:])
