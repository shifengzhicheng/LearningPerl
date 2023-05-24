#!/usr/bin/perl -w

# 用perl语言按照文件大小列出当前目录中的文件

use strict;
print "This uses Hashtable\n";
Hashetable();
print "This dose not use Hashtable, use -s to get the size\n";
Nohashtable();

sub Hashetable {
    my @list = grep { -f $_ } <*>;

    # 读取目录文件

    my %f;

    # 定义哈希table

    foreach my $file (@list) {
        my $s = ( stat($file) )[7];
        $f{$file} = $s;
    }

    # 遍历list中的文件，读取其大小并存储
    my @k = sort { $f{$a} <=> $f{$b} || $a cmp $b } keys %f;

    # 根据value的大小比较并排序key,将key存在@k数组中

    foreach my $file (@k) {
        my $size = $f{$file};
        print $size, "\t", $file, "\n";
    }
    print "\n";
}

sub Nohashtable {
    my @files = grep { -f $_ } <*>;

    # 对文件按大小排序

    @files = sort { -s $a <=> -s $b || $a cmp $b } @files;

    # 输出文件名和大小
    # 因为-s操作可以直接得到文件的大小，所以实际上并不需要两个循环
    foreach my $file (@files) {
        my $size = -s $file;
        printf "%s\t%s \n", $size, $file;
    }
}
