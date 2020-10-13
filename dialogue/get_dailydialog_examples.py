import os

if __name__ == '__main__':

    in_file = os.path.join('..','..','dialogues','ijcnlp_dailydialog','train_parsed','dial.txt')
    out_file = os.path.join('dailydialog_examples.txt')
    k = 100

    print('Converting to STOG input format...')

    count = 0
    with open(out_file, 'w') as w:
        with open(in_file, 'r') as f:
            for id, line in enumerate(f):
                line = line.strip()
                if '###' not in line and line != '':
                    w.write('# ::id %d\n'%id)
                    w.write('# ::snt %s\n'%line)
                    w.write('\n')
                    count += 1
                if count == k:
                    break

    print('Done!')