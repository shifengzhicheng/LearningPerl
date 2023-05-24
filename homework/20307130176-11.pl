#!/usr/bin/perl -w
use Tk;
use strict;

# 创建主窗口
my $mw = MainWindow->new();
$mw->geometry("400x400");
$mw->title("Calculator");
my $fontEntry = $mw->fontCreate( -size => 25 );

# 创建显示结果的文本框
my $text = $mw->Entry( -font => $fontEntry, -width => 20 )
  ->grid( -row => 0, -column => 0, -columnspan => 3 );
$text->insert( 0, '0' );
print $text->get() . "\n";
$text->configure( -state => 'readonly' );
my $font = $mw->fontCreate( -size => 15 );

# 创建数字按钮
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 9,
    -command => sub { on_button_clicked(9) }
)->grid( -row => 1, -column => 0 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 8,
    -command => sub { on_button_clicked(8) }
)->grid( -row => 1, -column => 1 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 7,
    -command => sub { on_button_clicked(7) }
)->grid( -row => 1, -column => 2 );

$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 6,
    -command => sub { on_button_clicked(6) }
)->grid( -row => 2, -column => 0 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 5,
    -command => sub { on_button_clicked(5) }
)->grid( -row => 2, -column => 1 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 4,
    -command => sub { on_button_clicked(4) }
)->grid( -row => 2, -column => 2 );

$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 3,
    -command => sub { on_button_clicked(3) }
)->grid( -row => 3, -column => 0 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 2,
    -command => sub { on_button_clicked(2) }
)->grid( -row => 3, -column => 1 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 1,
    -command => sub { on_button_clicked(1) }
)->grid( -row => 3, -column => 2 );

$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => 0,
    -command => sub { on_button_clicked(0) }
)->grid( -row => 4, -column => 1 );

# 创建运算符按钮
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "+",
    -command => sub { on_button_clicked("+") }
)->grid( -row => 4, -column => 0 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "-",
    -command => sub { on_button_clicked("-") }
)->grid( -row => 4, -column => 2 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "*",
    -command => sub { on_button_clicked("*") }
)->grid( -row => 5, -column => 0 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "/",
    -command => sub { on_button_clicked("/") }
)->grid( -row => 5, -column => 2 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => ".",
    -command => sub { on_button_clicked(".") }
)->grid( -row => 7, -column => 1 );

# 创建等号和清除按钮
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "=",
    -command => \&on_equal_button_clicked
)->grid( -row => 5, -column => 1 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "C",
    -command => \&on_clear_button_clicked
)->grid( -row => 6, -column => 0 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "del",
    -command => \&on_del_button_clicked
)->grid( -row => 6, -column => 1 );
$mw->Button(
    -font    => $font,
    -width   => 10,
    -text    => "+\\-",
    -command => \&on_neg_button_clicked
)->grid( -row => 6, -column => 2 );

# 启动主事件循环
MainLoop();

# 数字按钮点击事件处理函数
sub on_button_clicked {
    my $thing = shift;
    $text->configure( -state => 'normal' );
    print $text->get() . "\n";
    print $text->get() cmp "0" . "\n";
    if ( $text->get() eq '0' && $thing =~ /^\d/ ) {
        $text->delete( 0, 1 );
    }
    $text->insert( 'end', $thing );
    $text->configure( -state => 'readonly' );
}

# 等号按钮点击事件处理函数
sub on_equal_button_clicked {
    print $text->get() . "\n";
    my $res = eval $text->get();
    $text->configure( -state => 'normal' );
    $text->delete( 0, length( $text->get() ) );
    if ($@) {
        $text->insert( 0, '0' );
    }
    else {
        $text->insert( 0, $res );
    }
    $text->configure( -state => 'readonly' );
}

# 清除按钮点击事件处理函数
sub on_clear_button_clicked {
    $text->configure( -state => 'normal' );
    $text->delete( 0, 'end' );
    $text->insert( 'end', '0' );
    $text->configure( -state => 'readonly' );
}

# 删除一个字符
sub on_del_button_clicked {
    $text->configure( -state => 'normal' );
    $text->delete( length( $text->get() ) - 1, length( $text->get() ) );
    if ( length( $text->get() ) == 0 ) { $text->insert( 'end', '0' ) }
    $text->configure( -state => 'readonly' );
}

# 正负号转换
sub on_neg_button_clicked {
    $text->configure( -state => 'normal' );
    if ( $text->get() =~ /^-/ ) {
        $text->delete( 0, 1 );
    }
    elsif ( $text->get() != '0' ) {
        $text->insert( 0, '-' );
    }
    $text->configure( -state => 'readonly' );
}
