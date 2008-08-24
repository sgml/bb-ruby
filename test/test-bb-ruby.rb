#! /usr/bin/env ruby

require 'test/unit'
require File.expand_path(File.join(File.dirname(__FILE__), '/../lib/bb-ruby'))

class TestBBRuby < Test::Unit::TestCase

  def test_strong
    assert_equal '<strong>simple</strong>', '[b]simple[/b]'.bbcode_to_html
    assert_equal '<strong>simple</strong>', '[b:7a9ca2c5c3]simple[/b:7a9ca2c5c3]'.bbcode_to_html
    assert_equal "<strong>line 1<br />line 2</strong>", "[b:7a9ca2c5c3]line 1\nline 2[/b:7a9ca2c5c3]".bbcode_to_html
    assert_equal '<strong>1. text 1:</strong> text 2<br /><strong>2. text 3</strong>', "[b:post_uid0]1. text 1:[/b:post_uid0] text 2\n[b:post_uid0]2. text 3[/b:post_uid0]".bbcode_to_html
  end
  
  def test_em
    assert_equal '<em>simple</em>', '[i]simple[/i]'.bbcode_to_html
    assert_equal '<em>simple</em>', '[i:7a9ca2c5c3]simple[/i:7a9ca2c5c3]'.bbcode_to_html
    assert_equal "<em>line 1<br />line 2</em>", "[i:7a9ca2c5c3]line 1\nline 2[/i:7a9ca2c5c3]".bbcode_to_html
  end
  
  def test_u
    assert_equal '<u>simple</u>', '[u]simple[/u]'.bbcode_to_html
    assert_equal '<u>simple</u>', '[u:7a9ca2c5c3]simple[/u:7a9ca2c5c3]'.bbcode_to_html
    assert_equal "<u>line 1<br />line 2</u>", "[u:7a9ca2c5c3]line 1\nline 2[/u:7a9ca2c5c3]".bbcode_to_html
  end
  
  def test_del
    assert_equal '<del>simple</del>', '[del]simple[/del]'.bbcode_to_html
    assert_equal '<del>simple</del>', '[del:7a9ca2c5c3]simple[/del:7a9ca2c5c3]'.bbcode_to_html
    assert_equal '<del>simple</del>', '[s]simple[/s]'.bbcode_to_html
    assert_equal '<del>simple</del>', '[s:7a9ca2c5c3]simple[/s:7a9ca2c5c3]'.bbcode_to_html
  end
    
  def test_ins
    assert_equal '<ins>simple</ins>', '[ins]simple[/ins]'.bbcode_to_html
    assert_equal '<ins>simple</ins>', '[ins:7a9ca2c5c3]simple[/ins:7a9ca2c5c3]'.bbcode_to_html
  end  
  
  def test_code
    assert_equal '<code>simple</code>', '[code]simple[/code]'.bbcode_to_html
    assert_equal '<code>simple</code>', '[code:7a9ca2c5c3]simple[/code:7a9ca2c5c3]'.bbcode_to_html
    assert_equal "<code>var bxi = 0;<br />//Holds current speed of scrolling menu</code>", "[code:1:91cbdd72b7]var bxi = 0;\n//Holds current speed of scrolling menu[/code:1:91cbdd72b7]".bbcode_to_html
  end  
  
  def test_size
    assert_equal '<span style="font-size: 32px;">12px Text</span>', '[size=32]12px Text[/size]'.bbcode_to_html
  end
  
  def test_color
    assert_equal '<span style="color: red;">Red Text</span>', '[color=red]Red Text[/color]'.bbcode_to_html
    assert_equal '<span style="color: #ff0023;">Hex Color Text</span>', '[color=#ff0023]Hex Color Text[/color]'.bbcode_to_html
  end
  
  def test_ordered_list
    assert_equal '<ol><li>item 1</li><li>item 2</li></ol>', '[ol][li]item 1[/li][li]item 2[/li][/ol]'.bbcode_to_html
    assert_equal '<ol><li>item 1</li><li>item 2</li></ol>', '[ol][*]item 1[li]item 2[/li][/ol]'.bbcode_to_html
  end

  def test_unordered_list
    assert_equal '<ul><li>item 1</li><li>item 2</li></ul>', '[ul][li]item 1[/li][li]item 2[/li][/ul]'.bbcode_to_html
    assert_equal '<ul><li>item 1</li><li>item 2</li></ul>', '[ul][*]item 1[li]item 2[/li][/ul]'.bbcode_to_html
  end
  
  def test_list_unordered
    assert_equal '<ul><li>item 1</li><li>item 2</li></ul>', '[list][li]item 1[/li][li]item 2[/li][/list]'.bbcode_to_html
    assert_equal '<ul><li>item 1</li><li>item 2</li></ul>', '[list:7a9ca2c5c3][li]item 1[/li][li]item 2[/li][/list:7a9ca2c5c3]'.bbcode_to_html
  end

  def test_list_ordered_numerically
    assert_equal '<ol><li>item 1</li><li>item 2</li></ol>', '[list=1][li]item 1[/li][li]item 2[/li][/list]'.bbcode_to_html
    assert_equal '<ol><li>item 1</li><li>item 2</li></ol>', '[list=1:7a9ca2c5c3][li]item 1[/li][li]item 2[/li][/list:7a9ca2c5c3]'.bbcode_to_html
  end

  def test_list_ordered_alphabetically
    assert_equal '<ol sytle="list-style-type: lower-alpha;"><li>item 1</li><li>item 2</li></ol>', '[list=a][li]item 1[/li][li]item 2[/li][/list]'.bbcode_to_html
    assert_equal '<ol sytle="list-style-type: lower-alpha;"><li>item 1</li><li>item 2</li></ol>', '[list=a:7a9ca2c5c3][li]item 1[/li][li]item 2[/li][/list:7a9ca2c5c3]'.bbcode_to_html
  end
  
  def test_definition_list_term_definition
    assert_equal '<dl><dt>term 1</dt><dd>definition 1</dd><dt>term 2</dt><dd>definition 2</dd></dl>', '[dl][dt]term 1[/dt][dd]definition 1[/dd][dt]term 2[/dt][dd]definition 2[/dd][/dl]'.bbcode_to_html
  end
  
  def test_quote
    assert_equal '<fieldset><blockquote>quoting</blockquote></fieldset>', '[quote]quoting[/quote]'.bbcode_to_html
    assert_equal '<fieldset><legend>"black"</legend><blockquote>si el niño hubiera sido de "penalty" le hubieran llamado <strong>system Error</strong>!!! :)</blockquote></fieldset>', "[quote:7a9ca2c5c3=\"black\"]si el niño hubiera sido de \"penalty\" le hubieran llamado [b:7a9ca2c5c3]system Error[/b:7a9ca2c5c3]!!! :)[/quote:7a9ca2c5c3]".bbcode_to_html
    assert_equal '<fieldset><legend>Who</legend><blockquote>said that</blockquote></fieldset>', '[quote=Who]said that[/quote]'.bbcode_to_html
  end
  
  def test_link
    assert_equal '<a href="http://google.com">Google</a>', '[url=http://google.com]Google[/url]'.bbcode_to_html
    assert_equal '<a href="http://google.com">http://google.com</a>', '[url]http://google.com[/url]'.bbcode_to_html
    assert_equal '<a href="http://www.altctrlsupr.com/dmstk/kdd070803/00.html"> ABRIR ALBUM </a>','[URL=http://www.altctrlsupr.com/dmstk/kdd070803/00.html] ABRIR ALBUM [/URL]'.bbcode_to_html
    assert_equal '<a href="http://www.altctrlsupr.com/dmstk/kdd070803/00.html"> ABRIR<br />ALBUM </a>',"[URL=http://www.altctrlsupr.com/dmstk/kdd070803/00.html] ABRIR\nALBUM [/URL]".bbcode_to_html
    assert_equal '<a href="http://www.urimalet.com/cadaverex.mp3">aha</a>', "[URL=http://www.urimalet.com/cadaverex.mp3]aha[/URL]".bbcode_to_html
  end
  
  def test_image
    assert_equal '<img src="http://zoople/hochzeit.png" alt="" />', '[img]http://zoople/hochzeit.png[/img]'.bbcode_to_html
    assert_equal '<img src="http://zoople/hochzeit.png" alt="" />', '[img=http://zoople/hochzeit.png]'.bbcode_to_html
    assert_equal '<img src="http://zoople/hochzeit.png" style="width: 95px; height: 96px;" />', '[img size=95x96]http://zoople/hochzeit.png[/img]'.bbcode_to_html
    assert_equal '<img src="http://zoople/hochzeit.png" alt="" />', '[img:7a9ca2c5c3]http://zoople/hochzeit.png[/img:7a9ca2c5c3]'.bbcode_to_html
    assert_equal '<img src="http://zoople/hochzeit.png" style="width: 95px; height: 96px;" />', '[img:7a9ca2c5c3 size=95x96]http://zoople/hochzeit.png[/img:7a9ca2c5c3]'.bbcode_to_html
    assert_equal '<img src="http://www.marcodigital.com/sitanddie/sitanddiepequeÃ±o.jpg" alt="" />', '[img:post_uid0]http://www.marcodigital.com/sitanddie/sitanddiepequeÃ±o.jpg[/img:post_uid0]'.bbcode_to_html
  end
  
  def test_youtube
    assert_equal '<object width="400" height="330"><param name="movie" value="http://www.youtube.com/v/E4Fbk52Mk1w"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/v/E4Fbk52Mk1w" type="application/x-shockwave-flash" wmode="transparent" width="400" height="330"></embed></object>','[youtube]http://youtube.com/watch?v=E4Fbk52Mk1w[/youtube]'.bbcode_to_html
  end
  
  def test_google_video
    assert_equal '<embed style="width:400px; height:326px;" id="VideoPlayback" type="application/x-shockwave-flash" src="http://video.google.com/googleplayer.swf?docId=-2200109535941088987" flashvars=""> </embed>', '[gvideo]http://video.google.com/videoplay?docid=-2200109535941088987[/gvideo]'.bbcode_to_html
  end
  
  def test_email
    assert_equal '<a href="mailto:wadus@wadus.com">wadus@wadus.com</a>', '[email]wadus@wadus.com[/email]'.bbcode_to_html
  end
  
  def test_redefinition_of_tag_html
    my_blockquote = {
      'Quote' => [
        /\[quote(:.*)?=(.*?)\](.*?)\[\/quote\1?\]/mi,
        '<div class="quote"><p><cite>\2</cite></p><blockquote>\3</blockquote></div>',
        'Quote with citation',
        nil, nil,
        :quote],      
    }
    assert_equal '<div class="quote"><p><cite>Who</cite></p><blockquote>said that</blockquote></div>', '[quote=Who]said that[/quote]'.bbcode_to_html(my_blockquote)
  end

end
