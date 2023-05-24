#/usr/bin/perl -w
use strict;
use PDF::Create;

# 创建PDF文件
my $pdf = PDF::Create->new(
    'filename' => '20307130176.pdf',
    'Version'      => 1.2,
    'PageMode'     => 'UseOutlines',
    'Title'    => 'Math Exercises',
    'CreationDate' => [localtime],
);

# 添加一页
my $page = $pdf->new_page('MediaBox' => $pdf->get_page_size('A4'));
# 设置字体
my $font = $pdf->font('BaseFont' => 'Helvetica');

# 随机产生40道加减法题目
my @questions = ();
for (my $i = 1; $i <= 40; ) {
    my $num1 = int(rand(100)) + 1;
    my $num2 = int(rand(100)) + 1;
    my $operator = int(rand(2)) ? '+' : '-';
    my $answer = ($operator eq '+') ? ($num1 + $num2) : ($num1 - $num2);
    next if $answer < 0 or $answer >=100;
    push @questions, sprintf("%2d %s %-2d %2s %-2s", $num1, $operator, $num2, "=", "__");
    $i++;
}

# 在页面上添加题目
$page->string($font, 40, 175, 750,'Math Exercises');
my $x;
my $y = 700;
my $count = 1;
for (@questions){
    if($count == 5){
        $count = 1;
        $y = $y - 50;
    }
    $x = 100 * $count;
    $page->string($font, 14, $x, $y, $_);
    $count++;
}

# 保存PDF文件
$pdf->close();
1;