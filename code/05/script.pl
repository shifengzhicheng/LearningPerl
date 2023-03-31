use strict;
use warnings;
use Tie::File;

my @files = glob("*");

foreach my $file (@files) {
    if (-f $file && -T $file) {  # 判断是否为普通文本文件
        tie my @lines, 'Tie::File', $file or die "Can't open file $file: $!";
        splice @lines, 0, 1 if $lines[0] =~ /^#!\/usr\/bin\/perl\s*-?\w*/; # 删除第一行
        untie @lines;
        print "Deleted shebang line in $file\n";
    }
}