import os, string

if __name__ == '__main__':

    train_in_file = os.path.join('..','..','data','ijcnlp_dailydialog','parsed_dailydialog','dd_train.txt')
    train_out_file = os.path.join('amr-dailydialog-train.txt')
    dev_in_file = os.path.join('..','..','data','ijcnlp_dailydialog','parsed_dailydialog','dd_validation.txt')
    dev_out_file = os.path.join('amr-dailydialog-dev.txt')
    test_in_file = os.path.join('..','..','data','ijcnlp_dailydialog','parsed_dailydialog','dd_test.txt')
    test_out_file = os.path.join('amr-dailydialog-test.txt')

    print('Converting to STOG input format...')


    for in_file,out_file in [(train_in_file,train_out_file),
                             (dev_in_file, dev_out_file),
                             (test_in_file, test_out_file)]:
        convo = 0
        sentence = 0
        with open(out_file, 'w') as w:
            with open(in_file, 'r') as f:
                for id, line in enumerate(f):
                    line = line.strip()
                    if '###' in line:
                        convo += 1
                        sentence = 0
                    if '###' not in line and line != '':
                        w.write('# ::id %d.%d\n'%(convo,sentence))
                        line = line.translate(str.maketrans({key: " {0} ".format(key) for key in string.punctuation if key not in "-'"}))
                        line = line.replace(" ' ", "'")
                        line = line.replace(" ’ ", "'")
                        w.write('# ::snt %s\n'%line)
                        w.write('(d / dummy)\n')
                        w.write('\n')
                        sentence += 1
        print('Done!')