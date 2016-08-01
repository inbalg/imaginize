module PhrasesHelper
  PRE_DEFINED = {
      "a" => %w(http://www.clker.com/cliparts/3/4/7/b/7/P/uppercase-a-md.png,
              http://www.seattlestagedtosell.com/wp-content/uploads/2012/08/3499401481_2188e5cd42.jpg,
              http://www.clker.com/cliparts/e/P/o/2/U/Q/letter-a-md.png),
      "the" => %w(http://www.twainquotes.com/thewordthe.jpg,
                https://www.newcastle.edu.au/__data/assets/image/0006/215880/THE-UONWebsite-Homepage-TileFeature-246x143_02.jpg,
                https://sporadicallyupdated.files.wordpress.com/2014/12/the-copy-54773ed37044e362cda4eb8a261e079fb8c7d553-s6-c30.jpg),
      "i'm" => %w(http://static1.squarespace.com/static/550f4b99e4b04f84a0e5b87b/56578143e4b06b23bf182ff9/56578170e4b06b23bf183121/1455995921751/I'm_Isola_Marras.png?format=500w,
               https://pbs.twimg.com/profile_images/459600086087901185/ugscX3mw_400x400.jpeg,
               https://media.licdn.com/mpr/mpr/shrink_200_200/AAEAAQAAAAAAAAPKAAAAJDQxY2EzZWVkLWY1OTItNGRhNy1iNmEwLTA0NTE4MzQyYzFlYg.png),
      "i" => %w(http://static1.squarespace.com/static/550f4b99e4b04f84a0e5b87b/56578143e4b06b23bf182ff9/56578170e4b06b23bf183121/1455995921751/I'm_Isola_Marras.png?format=500w,
               https://pbs.twimg.com/profile_images/459600086087901185/ugscX3mw_400x400.jpeg,
               https://media.licdn.com/mpr/mpr/shrink_200_200/AAEAAQAAAAAAAAPKAAAAJDQxY2EzZWVkLWY1OTItNGRhNy1iNmEwLTA0NTE4MzQyYzFlYg.png),
      "of" => %w(http://www.lisani.jp/admin/wp-content/uploads/2013/08/130811_lisani_kishio01.jpg,
               http://kazuyo.cocolog-nifty.com/kazuyoblog/Windows-Live-Writer/6e29b24c14e0_12E29/B-20130810-1_2.jpg),
      "to" => %w(http://www.clker.com/cliparts/L/A/o/s/z/b/puzzle-piece-word-to-md.png,
               https://pbs.twimg.com/profile_images/1816531408/TO_Logo.png,
                https://clisawrite.files.wordpress.com/2015/11/d793f7b4e335a6e06852939905bc9840.jpg),
      "it's" => %w(https://pbs.twimg.com/profile_images/497454779849658372/fjWc0B_l.jpeg,
                http://media.urbandictionary.com/image/page/its-38696.jpg,
                http://tranbc.ca/wp-content/uploads/2013/09/ITS_icon.jpg),
      "it" =>   %w(http://www.img.lx.it.pt/it_logo.jpg,
                 http://moodle.clip.pt/pluginfile.php/5059/coursecat/description/IT.jpg,
                 https://my.sunderland.ac.uk/download/attachments/48105010/uniitsupport?version=2&modificationDate=1442499174000&api=v2),
      "and" => %w(http://www.allsyllabus.com/aj/note/ECE/Logic_Design/Unit1/AND%20Gates1.PNG,
                 http://orig01.deviantart.net/03b0/f/2012/035/6/3/and_symbol_by_lucraciamichaelis66-d4olwf9.png,
                 http://saatchi.com/assets/image/profile.png,
                 https://shewritesright.files.wordpress.com/2012/01/ampersand1.jpg)
  }

  SUCCESS = %w(http://i.amz.mshcdn.com/LgZmZ2JPMJayp39AdhJiRvwPpr4=/fit-in/850x850/http%3A%2F%2Fmashable.com%2Fwp-content%2Fgallery%2Ftriumph%2Fcolbert-report.gif
               http://67.media.tumblr.com/96f7840e5dce741191faebf6aff16a8a/tumblr_inline_oa4chhpbo61tybhwg_500.gif
               http://66.media.tumblr.com/c19f500799a0f67d8c167b647f94d7a2/tumblr_mot8zxRS9N1rcy99do1_500.gif
               http://67.media.tumblr.com/9bd2432e8aac58d364bc7255e1f09935/tumblr_morwuuOO1o1rcy99do1_500.gif
               https://m.popkey.co/6e1f7c/K04NL.gif)

  FAIL = %w(http://67.media.tumblr.com/91ede7d6da9220dfce3d024dc7182371/tumblr_mhf7kfsMKZ1qe5ugfo2_500.gif
            http://66.media.tumblr.com/1a41ea9febd9ceb832405d91d8874e08/tumblr_mhf7kfsMKZ1qe5ugfo1_500.gif
            http://66.media.tumblr.com/8993e169fb712897d17cf83262a16d6c/tumblr_mhf7kfsMKZ1qe5ugfo3_500.gif)

  SUCCESS_SOUNDS = %w(success1.wav success2.wav success3.wav success4.wav success5.wav)
  FAIL_SOUNDS = %w(fail1.wav fail2.wav fail3.wav fail4.wav)
end
