import 'package:wnews/wnews.dart';
import 'package:test/test.dart';

void main() {
  test('throws from empty string', () {
    expect(() => extractNews(''), throwsArgumentError);
  });

  test('extracts the correct number of news items', () {
    expect(extractNews(_html).length, 4);
  });

  test('the first item is correct', () {
    final firstItem = extractNews(_html).first;
    expect(firstItem.text, contains('Croatia'));
    expect(firstItem.link, isNotNull);
  });

  test('italics do not break the extraction', () {
    final news = extractNews(_htmlWithItalics);
    final lastItem = news.last;
    expect(lastItem.link, isNotNull);
    expect(lastItem.link!.pathSegments, contains('Montevideo_Maru'));
  });
}

const _html = r'''
<!DOCTYPE html>
<html class="client-nojs" lang="en" dir="ltr">
<head>
<meta charset="UTF-8"/>
<title>Wikipedia, the free encyclopedia</title>
<script>document.documentElement.className="client-js";RLCONF={"wgBreakFrames":false,"wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],"wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgRequestId":"79122bf1-305a-42b1-a261-3e7b47c52ba0","wgCSPNonce":false,"wgCanonicalNamespace":"","wgCanonicalSpecialPageName":false,"wgNamespaceNumber":0,"wgPageName":"Main_Page","wgTitle":"Main Page","wgCurRevisionId":1114291180,"wgRevisionId":1114291180,"wgArticleId":15580374,"wgIsArticle":true,"wgIsRedirect":false,"wgAction":"view","wgUserName":null,"wgUserGroups":["*"],"wgPageContentLanguage":"en","wgPageContentModel":"wikitext","wgRelevantPageName":"Main_Page","wgRelevantArticleId":15580374,"wgIsProbablyEditable":false,"wgRelevantPageIsProbablyEditable":false,"wgRestrictionEdit":["sysop"],"wgRestrictionMove":["sysop"],"wgIsMainPage":true,"wgFlaggedRevsParams":{"tags":{"status":{
"levels":1}}},"wgVisualEditor":{"pageLanguageCode":"en","pageLanguageDir":"ltr","pageVariantFallbacks":"en"},"wgMFMode":"stable","wgMFAmc":false,"wgMFAmcOutreachActive":false,"wgMFAmcOutreachUserEligible":false,"wgMFLazyLoadImages":true,"wgMFDisplayWikibaseDescriptions":{"search":true,"watchlist":true,"tagline":false,"nearby":true},"wgMFIsPageContentModelEditable":true,"wgWMESchemaEditAttemptStepOversample":false,"wgWMEPageLength":3000,"wgNoticeProject":"wikipedia","wgMediaViewerOnClick":true,"wgMediaViewerEnabledByDefault":true,"wgPopupsFlags":10,"wgULSCurrentAutonym":"English","wgEditSubmitButtonLabelPublish":true,"wgSectionTranslationTargetLanguages":["am","as","ast","ay","az","ba","bcl","be","bg","bho","bm","bn","bs","ceb","ckb","co","cs","cu","cy","dv","ee","el","eo","et","eu","fa","gl","gn","gom","gu","ha","haw","he","hr","ht","hy","ig","ilo","is","jv","ka","kg","km","kn","ko","ku","lb","lg","ln","lo","lt","lv","mai","mg","mi","mk","ml","mn","mni","mr","ms","mt","my","ne","nso",
"oc","om","or","pa","pap","ps","qu","ro","rw","sa","sah","sd","si","sl","sn","so","sq","sr","ss","su","sw","ta","te","tg","th","ti","tk","tl","tn","tr","ts","tt","tw","ur","uz","wo","xh","yi","yo","zu"],"wgCentralAuthMobileDomain":true,"wgSectionTranslationMissingLanguages":[{"lang":"am","autonym":"አማርኛ","dir":"ltr"},{"lang":"as","autonym":"অসমীয়া","dir":"ltr"},{"lang":"ast","autonym":"asturianu","dir":"ltr"},{"lang":"ay","autonym":"Aymar aru","dir":"ltr"},{"lang":"az","autonym":"azərbaycanca","dir":"ltr"},{"lang":"ba","autonym":"башҡортса","dir":"ltr"},{"lang":"bcl","autonym":"Bikol Central","dir":"ltr"},{"lang":"be","autonym":"беларуская","dir":"ltr"},{"lang":"bho","autonym":"भोजपुरी","dir":"ltr"},{"lang":"bm","autonym":"bamanankan","dir":"ltr"},{"lang":"ceb","autonym":"Cebuano","dir":"ltr"},{"lang":"ckb","autonym":"کوردی","dir":"rtl"},{"lang":"co","autonym":"corsu","dir":"ltr"},{"lang":"cu","autonym":
"словѣньскъ / ⰔⰎⰑⰂⰡⰐⰠⰔⰍⰟ","dir":"ltr"},{"lang":"cy","autonym":"Cymraeg","dir":"ltr"},{"lang":"dv","autonym":"ދިވެހިބަސް","dir":"rtl"},{"lang":"ee","autonym":"eʋegbe","dir":"ltr"},{"lang":"gn","autonym":"Avañe'ẽ","dir":"ltr"},{"lang":"gom","autonym":"गोंयची कोंकणी / Gõychi Konknni","dir":"ltr"},{"lang":"gu","autonym":"ગુજરાતી","dir":"ltr"},{"lang":"ha","autonym":"Hausa","dir":"ltr"},{"lang":"haw","autonym":"Hawaiʻi","dir":"ltr"},{"lang":"ht","autonym":"Kreyòl ayisyen","dir":"ltr"},{"lang":"hy","autonym":"հայերեն","dir":"ltr"},{"lang":"ig","autonym":"Igbo","dir":"ltr"},{"lang":"ilo","autonym":"Ilokano","dir":"ltr"},{"lang":"is","autonym":"íslenska","dir":"ltr"},{"lang":"jv","autonym":"Jawa","dir":"ltr"},{"lang":"kg","autonym":"Kongo","dir":"ltr"},{"lang":"km","autonym":"ភាសាខ្មែរ","dir":"ltr"},{"lang":"kn","autonym":"ಕನ್ನಡ","dir":"ltr"},{"lang":"ku","autonym":
"Kurdî/کوردی","dir":"ltr"},{"lang":"lb","autonym":"Lëtzebuergesch","dir":"ltr"},{"lang":"lg","autonym":"Luganda","dir":"ltr"},{"lang":"ln","autonym":"lingála","dir":"ltr"},{"lang":"lo","autonym":"ລາວ","dir":"ltr"},{"lang":"mai","autonym":"मैथिली","dir":"ltr"},{"lang":"mg","autonym":"Malagasy","dir":"ltr"},{"lang":"mi","autonym":"Māori","dir":"ltr"},{"lang":"ml","autonym":"മലയാളം","dir":"ltr"},{"lang":"mn","autonym":"монгол","dir":"ltr"},{"lang":"mni","autonym":"ꯃꯤꯇꯩ ꯂꯣꯟ","dir":"ltr"},{"lang":"mr","autonym":"मराठी","dir":"ltr"},{"lang":"mt","autonym":"Malti","dir":"ltr"},{"lang":"my","autonym":"မြန်မာဘာသာ","dir":"ltr"},{"lang":"ne","autonym":"नेपाली","dir":"ltr"},{"lang":"nso","autonym":"Sesotho sa Leboa","dir":"ltr"},{"lang":"oc","autonym":"occitan","dir":"ltr"},{"lang":"om","autonym":"Oromoo","dir":"ltr"},{"lang":"or","autonym":"ଓଡ଼ିଆ","dir":"ltr"},{"lang":"pa","autonym":
"ਪੰਜਾਬੀ","dir":"ltr"},{"lang":"pap","autonym":"Papiamentu","dir":"ltr"},{"lang":"ps","autonym":"پښتو","dir":"rtl"},{"lang":"qu","autonym":"Runa Simi","dir":"ltr"},{"lang":"rw","autonym":"Ikinyarwanda","dir":"ltr"},{"lang":"sa","autonym":"संस्कृतम्","dir":"ltr"},{"lang":"sah","autonym":"саха тыла","dir":"ltr"},{"lang":"sd","autonym":"سنڌي","dir":"rtl"},{"lang":"si","autonym":"සිංහල","dir":"ltr"},{"lang":"sn","autonym":"chiShona","dir":"ltr"},{"lang":"so","autonym":"Soomaaliga","dir":"ltr"},{"lang":"sq","autonym":"shqip","dir":"ltr"},{"lang":"ss","autonym":"SiSwati","dir":"ltr"},{"lang":"su","autonym":"Sunda","dir":"ltr"},{"lang":"sw","autonym":"Kiswahili","dir":"ltr"},{"lang":"ta","autonym":"தமிழ்","dir":"ltr"},{"lang":"te","autonym":"తెలుగు","dir":"ltr"},{"lang":"tg","autonym":"кирилликӣ","dir":"ltr"},{"lang":"ti","autonym":"ትግርኛ","dir":"ltr"},{"lang":"tk","autonym":"Türkmençe","dir":"ltr"}
,{"lang":"tl","autonym":"Tagalog","dir":"ltr"},{"lang":"tn","autonym":"Setswana","dir":"ltr"},{"lang":"ts","autonym":"Xitsonga","dir":"ltr"},{"lang":"tt","autonym":"татарча/tatarça","dir":"ltr"},{"lang":"tw","autonym":"Twi","dir":"ltr"},{"lang":"ur","autonym":"اردو","dir":"rtl"},{"lang":"uz","autonym":"uz","dir":"ltr"},{"lang":"wo","autonym":"Wolof","dir":"ltr"},{"lang":"xh","autonym":"isiXhosa","dir":"ltr"},{"lang":"yi","autonym":"ייִדיש","dir":"rtl"},{"lang":"yo","autonym":"Yorùbá","dir":"ltr"},{"lang":"zu","autonym":"isiZulu","dir":"ltr"}],"wgWikibaseItemId":"Q5296","GEHomepageSuggestedEditsEnableTopics":true,"wgGETopicsMatchModeEnabled":false,"wgGEStructuredTaskRejectionReasonTextInputEnabled":false,"wgMinervaPermissions":{"watch":false,"talk":false},"wgMinervaFeatures":{"beta":false,"donate":true,"mobileOptionsLink":true,"categories":false,"pageIssues":true,"talkAtTop":true,"historyInPageActions":false,"overflowSubmenu":false,"tabsOnSpecials":true,
"personalMenu":false,"mainMenuExpanded":false,"simplifiedTalk":true},"wgMinervaDownloadNamespaces":[0]};RLSTATE={"ext.globalCssJs.user.styles":"ready","site.styles":"ready","user.styles":"ready","ext.globalCssJs.user":"ready","user":"ready","user.options":"loading","ext.tmh.player.styles":"ready","skins.minerva.base.styles":"ready","skins.minerva.content.styles.images":"ready","mediawiki.hlist":"ready","mediawiki.ui.icon":"ready","mediawiki.ui.button":"ready","skins.minerva.icons.wikimedia":"ready","skins.minerva.mainMenu.icons":"ready","skins.minerva.mainMenu.styles":"ready","skins.minerva.mainPage.styles":"ready","skins.minerva.amc.styles":"ready","mobile.init.styles":"ready","ext.wikimediaBadges":"ready"};RLPAGEMODULES=["ext.tmh.player","site","mediawiki.page.ready","skins.minerva.scripts","mobile.init","ext.eventLogging","ext.wikimediaEvents","ext.navigationTiming","ext.cx.eventlogging.campaigns","ext.cx.entrypoints.languagesearcher.init","mw.externalguidance.init",
"ext.centralNotice.geoIP","ext.centralNotice.startUp","ext.gadget.EditNoticesOnMobile","ext.gadget.switcher","ext.centralauth.centralautologin","ext.popups","ext.echo.centralauth","ext.cx.entrypoints.mffrequentlanguages","ext.growthExperiments.SuggestedEditSession"];</script>
<script>(RLQ=window.RLQ||[]).push(function(){mw.loader.implement("user.options@12s5i",function($,jQuery,require,module){mw.user.tokens.set({"patrolToken":"+\\","watchToken":"+\\","csrfToken":"+\\"});});});</script>
<link rel="stylesheet" href="/w/load.php?lang=en&amp;modules=ext.tmh.player.styles%7Cext.wikimediaBadges%7Cmediawiki.hlist%7Cmediawiki.ui.button%2Cicon%7Cmobile.init.styles%7Cskins.minerva.amc.styles%7Cskins.minerva.base.styles%7Cskins.minerva.content.styles.images%7Cskins.minerva.icons.wikimedia%7Cskins.minerva.mainMenu.icons%2Cstyles%7Cskins.minerva.mainPage.styles&amp;only=styles&amp;skin=minerva"/>
<script async="" src="/w/load.php?lang=en&amp;modules=startup&amp;only=scripts&amp;raw=1&amp;skin=minerva&amp;target=mobile"></script>
<meta name="generator" content="MediaWiki 1.40.0-wmf.14"/>
<meta name="referrer" content="origin"/>
<meta name="referrer" content="origin-when-crossorigin"/>
<meta name="referrer" content="origin-when-cross-origin"/>
<meta name="robots" content="max-image-preview:standard"/>
<meta name="format-detection" content="telephone=no"/>
<meta name="theme-color" content="#eaecf0"/>
<meta property="og:image" content="https://upload.wikimedia.org/wikipedia/commons/9/9c/AiKhanoumPlateSharp.jpg"/>
<meta property="og:image:width" content="1200"/>
<meta property="og:image:height" content="1188"/>
<meta property="og:image" content="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/AiKhanoumPlateSharp.jpg/800px-AiKhanoumPlateSharp.jpg"/>
<meta property="og:image:width" content="800"/>
<meta property="og:image:height" content="792"/>
<meta property="og:image" content="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/AiKhanoumPlateSharp.jpg/640px-AiKhanoumPlateSharp.jpg"/>
<meta property="og:image:width" content="640"/>
<meta property="og:image:height" content="633"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=0.25, maximum-scale=5.0"/>
<meta property="og:title" content="Wikipedia, the free encyclopedia"/>
<meta property="og:type" content="website"/>
<link rel="preconnect" href="//upload.wikimedia.org"/>
<link rel="manifest" href="/w/api.php?action=webapp-manifest"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia picture of the day feed" href="/w/api.php?action=featuredfeed&amp;feed=potd&amp;feedformat=atom"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia featured articles feed" href="/w/api.php?action=featuredfeed&amp;feed=featured&amp;feedformat=atom"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia &quot;On this day...&quot; feed" href="/w/api.php?action=featuredfeed&amp;feed=onthisday&amp;feedformat=atom"/>
<link rel="apple-touch-icon" href="/static/apple-touch/wikipedia.png"/>
<link rel="icon" href="/static/favicon/wikipedia.ico"/>
<link rel="search" type="application/opensearchdescription+xml" href="/w/opensearch_desc.php" title="Wikipedia (en)"/>
<link rel="EditURI" type="application/rsd+xml" href="//en.wikipedia.org/w/api.php?action=rsd"/>
<link rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/"/>
<link rel="canonical" href="https://en.wikipedia.org/wiki/Main_Page"/>
<link rel="dns-prefetch" href="//meta.wikimedia.org" />
<link rel="dns-prefetch" href="//login.wikimedia.org"/>
</head>
<body class="mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-subject page-Main_Page rootpage-Main_Page stable issues-group-B skin-minerva action-view skin--responsive mw-mf-amc-disabled mw-mf"><div id="mw-mf-viewport">
	<div id="mw-mf-page-center">
		<a class="mw-mf-page-center__mask" href="#"></a>
		
		<header class="header-container header-chrome">
			<div class="minerva-header">
				<nav class="navigation-drawer toggle-list view-border-box">
					<input type="checkbox" id="main-menu-input" class="toggle-list__checkbox" role="button" aria-haspopup="true" aria-expanded="false" aria-labelledby="mw-mf-main-menu-button">
					<label for="main-menu-input" id="mw-mf-main-menu-button" aria-hidden="true"
						class=" mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-menu-base20 mw-ui-icon-flush-left toggle-list__toggle"
						title="Open main menu" data-event-name="ui.mainmenu">Open main menu</label>
					<div id="mw-mf-page-left" class="menu toggle-list__list view-border-box">
	<ul id="p-navigation">
			<li class="">
			    <a href="/wiki/Main_Page" class="menu__item--home"
				   data-mw="interface" data-event-name="">
			      <span class="mw-ui-icon-minerva-home mw-ui-icon"></span><span>Home</span>
			     </a>
			</li>
			<li class="">
			    <a href="/wiki/Special:Random" class="menu__item--random"
				   data-mw="interface" data-event-name="">
			      <span class="mw-ui-icon-minerva-die mw-ui-icon"></span><span>Random</span>
			     </a>
			</li>
			<li class="jsonly">
			    <a href="/wiki/Special:Nearby" class="menu__item--nearby"
				   data-mw="interface" data-event-name="menu.nearby">
			      <span class="mw-ui-icon-minerva-mapPin mw-ui-icon"></span><span>Nearby</span>
			     </a>
			</li>
	</ul>
	<ul id="p-personal">
			<li class="">
			    <a href="/w/index.php?title=Special:UserLogin&amp;returnto=Main+Page" class="menu__item--login"
				   data-mw="interface" data-event-name="">
			      <span class="mw-ui-icon-minerva-logIn mw-ui-icon"></span><span>Log in</span>
			     </a>
			</li>
	</ul>
	<ul id="pt-preferences">
			<li class="jsonly">
			    <a href="/w/index.php?title=Special:MobileOptions&amp;returnto=Main+Page" class="menu__item--settings"
				   data-mw="interface" data-event-name="menu.settings">
			      <span class="mw-ui-icon-minerva-settings mw-ui-icon"></span><span>Settings</span>
			     </a>
			</li>
	</ul>
	<ul id="p-donation">
			<li class="">
			    <a href="https://donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wikipedia.org&amp;uselang=en&amp;utm_key=minerva" class="menu__item--donate"
				   data-mw="interface" data-event-name="menu.donate">
			      <span class="mw-ui-icon-minerva-heart mw-ui-icon"></span><span>Donate</span>
			     </a>
			</li>
	</ul>
	<ul class="hlist">
			<li class="">
			    <a href="/wiki/Wikipedia:About" class="menu__item--about"
				   data-mw="interface" data-event-name="">
			      <span class="mw-ui-icon-minerva-about mw-ui-icon"></span><span>About Wikipedia</span>
			     </a>
			</li>
			<li class="">
			    <a href="/wiki/Wikipedia:General_disclaimer" class="menu__item--disclaimers"
				   data-mw="interface" data-event-name="">
			      <span class="mw-ui-icon-minerva-disclaimers mw-ui-icon"></span><span>Disclaimers</span>
			     </a>
			</li>
	</ul>
</div>

					<label class="main-menu-mask" for="main-menu-input"></label>
				</nav>
				<div class="branding-box">
					<a href="/wiki/Main_Page">
						<span><img src="/static/images/mobile/copyright/wikipedia-wordmark-en.svg" alt="Wikipedia" width="120" height="18"
	style="width: 7.5em; height: 1.125em;"/>

</span>
						
					</a>
				</div>
					<form action="/w/index.php" method="get" class="minerva-search-form">
				<div class="search-box">
					<input type="hidden" name="title" value="Special:Search"/>
					<input class="search mw-ui-background-icon-search skin-minerva-search-trigger" type="search" name="search" id="searchInput"
						 type="search" name="search" placeholder="Search Wikipedia" aria-label="Search Wikipedia" autocapitalize="sentences" title="Search Wikipedia [f]" accesskey="f"">
				</div>
				<button id="searchIcon" class="mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-search-base20 skin-minerva-search-trigger mw-ui-button mw-ui-quiet">Search</button>
			</form>
		<nav class="minerva-user-navigation" aria-label="User navigation">
					
				</nav>
			</div>
		</header>
		<main id="content" class="mw-body">
			<div class="banner-container">
			<div id="siteNotice"></div>
			</div>
			
			<div id="bodyContent" class="content">
				<div id="mw-content-text" class="mw-body-content mw-content-ltr" lang="en" dir="ltr"><script>function mfTempOpenSection(id){var block=document.getElementById("mf-section-"+id);block.className+=" open-block";block.previousSibling.className+=" open-block";}</script><!-- parser cache is expired, sending anyway due to pool contention-->
<div class="mw-parser-output"><section class="mf-section-0" id="mf-section-0"><style data-mw-deduplicate="TemplateStyles:r1125832332">.mw-parser-output .mp-box{border:1px solid #aaa;padding:0 0.5em 0.5em;margin-top:4px}.mw-parser-output .mp-h2,body.skin-timeless .mw-parser-output .mp-h2{border:1px solid #aaa;margin:0.5em 0;padding:0.2em 0.4em;font-size:120%;font-weight:bold;font-family:inherit}.mw-parser-output .mp-later{font-size:85%;font-weight:normal}.mw-parser-output #mp-topbanner{background:#f9f9f9;border-color:#ddd}.mw-parser-output #mp-welcomecount{text-align:center;margin:0.4em}.mw-parser-output #mp-welcome{font-size:162%;padding:0.1em}.mw-parser-output #mp-welcome h1{font-size:inherit;font-family:inherit;display:inline;border:none}.mw-parser-output #mp-free{font-size:95%}.mw-parser-output #articlecount{font-size:85%}.mw-parser-output .mp-contains-float::after{content:"";display:block;clear:both}.mw-parser-output #mp-banner{background:#fffaf5;border-color:#f2e0ce}.mw-parser-output #mp-left{background:#f5fffa;border-color:#cef2e0}.mw-parser-output #mp-left .mp-h2{background:#cef2e0;border-color:#a3bfb1}.mw-parser-output #mp-right{background:#f5faff;border-color:#cedff2}.mw-parser-output #mp-right .mp-h2{background:#cedff2;border-color:#a3b0bf}.mw-parser-output #mp-middle{background:#fff5fa;border-color:#f2cedd}.mw-parser-output #mp-middle .mp-h2{background:#f2cedd;border-color:#bfa3af}.mw-parser-output #mp-lower{background:#faf5ff;border-color:#ddcef2}.mw-parser-output #mp-lower .mp-h2{background:#ddcef2;border-color:#afa3bf}.mw-parser-output #mp-bottom{border-color:#e2e2e2}.mw-parser-output #mp-bottom .mp-h2{background:#eee;border-color:#ddd}@media(max-width:875px){.mw-parser-output #mp-tfp table,.mw-parser-output #mp-tfp tr,.mw-parser-output #mp-tfp td,.mw-parser-output #mp-tfp tbody{display:block!important;width:100%!important;box-sizing:border-box}.mw-parser-output #mp-tfp tr:first-child td:first-child a{text-align:center;display:table;margin:0 auto}}@media(min-width:875px){.mw-parser-output #mp-upper{display:flex}.mw-parser-output #mp-left{flex:1 1 55%;margin-right:2px}.mw-parser-output #mp-right{flex:1 1 45%;margin-left:2px}}.mw-parser-output div.hlist.inline ul,.mw-parser-output div.hlist.inline li,.mw-parser-output div.hlist.inline{display:inline}</style><div id="mp-topbanner" class="mp-box">
<div id="mp-welcomecount">
<div id="mp-welcome"><h1><span class="mw-headline" id="Welcome_to_Wikipedia">Welcome to <a href="/wiki/Wikipedia" title="Wikipedia">Wikipedia</a></span></h1>,</div>
<div id="mp-free">the <a href="/wiki/Free_content" title="Free content">free</a> <a href="/wiki/Encyclopedia" title="Encyclopedia">encyclopedia</a> that <a href="/wiki/Help:Introduction_to_Wikipedia" title="Help:Introduction to Wikipedia">anyone can edit</a>.</div>
<div id="articlecount"><a href="/wiki/Special:Statistics" title="Special:Statistics">6,596,432</a> articles in <a href="/wiki/English_language" title="English language">English</a></div>
</div>
</div>
<div id="mp-upper">
<div id="mp-left" class="MainPageBG mp-box">
<h2 id="mp-tfa-h2" class="mp-h2"><span id="From_today.27s_featured_article"></span><span class="mw-headline" id="From_today's_featured_article">From today's featured article</span></h2>
<div id="mp-tfa" class="mp-contains-float"><div id="mp-tfa-img" style="float: left; margin: 0.5em 0.9em 0.4em 0em;">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 141px;">
<a href="/wiki/File:AiKhanoumPlateSharp.jpg" class="image" title="Disk found at Ai-Khanoum depicting the Greek deity Cybele"><img alt="Disk found at Ai-Khanoum depicting the Greek deity Cybele" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/9c/AiKhanoumPlateSharp.jpg/141px-AiKhanoumPlateSharp.jpg" decoding="async" width="141" height="140" data-file-width="1064" data-file-height="1053"></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;"><a href="/wiki/Ai-Khanoum_plaque" title="Ai-Khanoum plaque">Disk found at Ai-Khanoum</a> depicting the Greek deity <a href="/wiki/Cybele" title="Cybele">Cybele</a></div></div>
</div>
<p><b><a href="/wiki/Ai-Khanoum" title="Ai-Khanoum">Ai-Khanoum</a></b> is the archaeological site of a <a href="/wiki/Hellenistic_period" title="Hellenistic period">Hellenistic</a> city in <a href="/wiki/Takhar_Province" title="Takhar Province">Takhar Province</a>, Afghanistan. It was probably established in the early 3rd century BC by a monarch of the <a href="/wiki/Seleucid_Empire" title="Seleucid Empire">Seleucid Empire</a> at the confluence of the <a href="/wiki/Amu_Darya" title="Amu Darya">Oxus</a> and <a href="/wiki/Kokcha_River" title="Kokcha River">Kokcha</a> rivers, controlling access to valuable mines and strategic <a href="/wiki/Choke_point" title="Choke point">choke points</a>. Ai-Khanoum, which became a major centre of the <a href="/wiki/Greco-Bactrian_Kingdom" title="Greco-Bactrian Kingdom">Greco-Bactrian Kingdom</a> after it seceded under the <a href="/wiki/Diodotid_dynasty" title="Diodotid dynasty">Diodotid dynasty</a>, was redesigned by King <a href="/wiki/Eucratides_I" title="Eucratides I">Eucratides I</a> to be an imperial capital, with a huge palace, religious structures, and massive defences. Nevertheless, it was sacked at the end of his reign (<abbr title="circa">c.</abbr><span style="white-space:nowrap;"> 145 BC</span>) by the nomadic <a href="/wiki/Saka" title="Saka">Saka</a> and <a href="/wiki/Yuezhi" title="Yuezhi">Yuezhi</a> peoples, and the city was soon abandoned. Rediscovered two millennia later by the <a href="/wiki/Mohammed_Zahir_Shah" title="Mohammed Zahir Shah">King of Afghanistan</a> in 1961, Ai-Khanoum was excavated by <a href="/wiki/French_Archaeological_Delegation_in_Afghanistan" title="French Archaeological Delegation in Afghanistan">a team of French archaeologists</a> until the <a href="/wiki/Saur_Revolution" title="Saur Revolution">Saur Revolution</a> in 1978. During the <a href="/wiki/Afghanistan_conflict_(1978%E2%80%93present)" title="Afghanistan conflict (1978–present)">subsequent conflicts in Afghanistan</a>, the site was extensively looted. (<b><a href="/wiki/Ai-Khanoum" title="Ai-Khanoum">Full article...</a></b>)
</p>
<div class="tfa-recent" style="text-align: right;">
Recently featured: <style data-mw-deduplicate="TemplateStyles:r1129693374">.mw-parser-output .hlist dl,.mw-parser-output .hlist ol,.mw-parser-output .hlist ul{margin:0;padding:0}.mw-parser-output .hlist dd,.mw-parser-output .hlist dt,.mw-parser-output .hlist li{margin:0;display:inline}.mw-parser-output .hlist.inline,.mw-parser-output .hlist.inline dl,.mw-parser-output .hlist.inline ol,.mw-parser-output .hlist.inline ul,.mw-parser-output .hlist dl dl,.mw-parser-output .hlist dl ol,.mw-parser-output .hlist dl ul,.mw-parser-output .hlist ol dl,.mw-parser-output .hlist ol ol,.mw-parser-output .hlist ol ul,.mw-parser-output .hlist ul dl,.mw-parser-output .hlist ul ol,.mw-parser-output .hlist ul ul{display:inline}.mw-parser-output .hlist .mw-empty-li{display:none}.mw-parser-output .hlist dt::after{content:": "}.mw-parser-output .hlist dd::after,.mw-parser-output .hlist li::after{content:" · ";font-weight:bold}.mw-parser-output .hlist dd:last-child::after,.mw-parser-output .hlist dt:last-child::after,.mw-parser-output .hlist li:last-child::after{content:none}.mw-parser-output .hlist dd dd:first-child::before,.mw-parser-output .hlist dd dt:first-child::before,.mw-parser-output .hlist dd li:first-child::before,.mw-parser-output .hlist dt dd:first-child::before,.mw-parser-output .hlist dt dt:first-child::before,.mw-parser-output .hlist dt li:first-child::before,.mw-parser-output .hlist li dd:first-child::before,.mw-parser-output .hlist li dt:first-child::before,.mw-parser-output .hlist li li:first-child::before{content:" (";font-weight:normal}.mw-parser-output .hlist dd dd:last-child::after,.mw-parser-output .hlist dd dt:last-child::after,.mw-parser-output .hlist dd li:last-child::after,.mw-parser-output .hlist dt dd:last-child::after,.mw-parser-output .hlist dt dt:last-child::after,.mw-parser-output .hlist dt li:last-child::after,.mw-parser-output .hlist li dd:last-child::after,.mw-parser-output .hlist li dt:last-child::after,.mw-parser-output .hlist li li:last-child::after{content:")";font-weight:normal}.mw-parser-output .hlist ol{counter-reset:listitem}.mw-parser-output .hlist ol>li{counter-increment:listitem}.mw-parser-output .hlist ol>li::before{content:" "counter(listitem)"\a0 "}.mw-parser-output .hlist dd ol>li:first-child::before,.mw-parser-output .hlist dt ol>li:first-child::before,.mw-parser-output .hlist li ol>li:first-child::before{content:" ("counter(listitem)"\a0 "}</style><div class="hlist inline">
<ul><li><a href="/wiki/History_of_timekeeping_devices" title="History of timekeeping devices">History of timekeeping devices</a></li>
<li><a href="/wiki/John_Hay" title="John Hay">John Hay</a></li>
<li><a href="/wiki/U.S._Route_8" title="U.S. Route 8">U.S. Route 8</a></li></ul></div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist tfa-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Today%27s_featured_article/January_2023" title="Wikipedia:Today's featured article/January 2023">Archive</a></b></li>
<li><b><a href="https://lists.wikimedia.org/postorius/lists/daily-article-l.lists.wikimedia.org/" class="extiw" title="mail:daily-article-l">By email</a></b></li>
<li><b><a href="/wiki/Wikipedia:Featured_articles" title="Wikipedia:Featured articles">More featured articles</a></b></li>
<li><b><a href="/wiki/Wikipedia:About_Today%27s_featured_article" title="Wikipedia:About Today's featured article">About</a></b></li></ul></div></div>
<h2 id="mp-dyk-h2" class="mp-h2"><span class="mw-headline" id="Did_you_know_...">Did you know ...</span></h2>
<div id="mp-dyk" class="mp-contains-float">
<div class="dyk-img" style="float: right; margin-left: 0.5em;">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 171px;">
<a href="/wiki/File:SP089675_Myosotis_pansa_subsp._praeceps_Meudt_et_al._WELT_Te_Papa_1174367_228733.jpg" class="image" title="Myosotis pansa subsp. praeceps"><img alt="Myosotis pansa subsp. praeceps" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/00/SP089675_Myosotis_pansa_subsp._praeceps_Meudt_et_al._WELT_Te_Papa_1174367_228733.jpg/171px-SP089675_Myosotis_pansa_subsp._praeceps_Meudt_et_al._WELT_Te_Papa_1174367_228733.jpg" decoding="async" width="171" height="114" data-file-width="3456" data-file-height="2304"></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;"><i>Myosotis pansa</i> subsp. <i>praeceps</i></div></div>
</div>
<ul><li>... that one threatened <b><a href="/wiki/Myosotis_pansa_subsp._praeceps" title="Myosotis pansa subsp. praeceps">species of plant</a></b> <i>(pictured)</i> endemic to the <a href="/wiki/North_Island" title="North Island">North Island</a> of New Zealand is colloquially known as a <a href="/wiki/Myosotis" title="Myosotis">forget-me-not</a>?</li>
<li>... that the parliamentary <a href="/wiki/Sign_language" title="Sign language">sign-language</a> interpreter could not make out what South African MP <b><a href="/wiki/Joan_Fubbs" title="Joan Fubbs">Joan Fubbs</a></b> tried to say in her tribute to President <a href="/wiki/Cyril_Ramaphosa" title="Cyril Ramaphosa">Cyril Ramaphosa</a>?</li>
<li>... that <b><a href="/wiki/Perry_County,_Tennessee" title="Perry County, Tennessee">Perry County</a></b> is the least densely populated county in <a href="/wiki/Tennessee" title="Tennessee">Tennessee</a>?</li>
<li>... that <b><a href="/wiki/Abdul_Hamid_al-Zahrawi" title="Abdul Hamid al-Zahrawi">Abdul Hamid al-Zahrawi</a></b>, a former member of the <a href="/wiki/General_Assembly_of_the_Ottoman_Empire" title="General Assembly of the Ottoman Empire">General Assembly of the Ottoman Empire</a>, was executed in 1916 for his support for Arab nationalism?</li>
<li>... that a section of <b><a href="/wiki/Mississippi_Highway_489" title="Mississippi Highway 489">Mississippi Highway 489</a></b> was designated as the Jason Boyd Memorial Highway to commemorate the <a href="/wiki/Mississippi_Department_of_Transportation" title="Mississippi Department of Transportation">MDOT</a> superintendent who was killed while removing debris from the road?</li>
<li>... that in mediaeval England <b><a href="/wiki/Verge_(royal_court)" title="Verge (royal court)">an area of special legal jurisdiction</a></b> extended around the royal court and moved with it?</li>
<li>... that <b><a href="/wiki/Paul_Dini" title="Paul Dini">Paul Dini</a></b> was a writer for both the animated television series <i><a href="/wiki/Batman:_The_Animated_Series" title="Batman: The Animated Series">Batman: The Animated Series</a></i> and the video game series <i><a href="/wiki/Batman:_Arkham" title="Batman: Arkham">Batman: Arkham</a></i>?</li>
<li>... that <i><b><a href="/wiki/USS_Romeo" title="USS Romeo">Romeo</a></b></i> and <i><a href="/wiki/USS_Juliet" title="USS Juliet">Juliet</a></i> both served in the <a href="/wiki/Union_Navy" title="Union Navy">Union Navy</a>?</li></ul><link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist dyk-footer noprint" style="margin-top: 0.5em; text-align: right;">
<ul><li><b><a href="/wiki/Wikipedia:Recent_additions" title="Wikipedia:Recent additions">Archive</a></b></li>
<li><b><a href="/wiki/Help:Your_first_article" title="Help:Your first article">Start a new article</a></b></li>
<li><b><a href="/wiki/Template_talk:Did_you_know" title="Template talk:Did you know">Nominate an article</a></b></li></ul></div>
</div>
</div>
<div id="mp-right" class="MainPageBG mp-box">
<h2 id="mp-itn-h2" class="mp-h2"><span class="mw-headline" id="In_the_news">In the news</span></h2>
<div id="mp-itn" class="mp-contains-float"><style data-mw-deduplicate="TemplateStyles:r1053378754">.mw-parser-output .itn-img{float:right;margin-left:0.5em;margin-top:0.2em}</style><div role="figure" class="itn-img">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 124px;">
<a href="/wiki/File:Papst_Benedikt_XVI_in_Berlin_2011.jpg" class="image" title="Benedict XVI in 2011"><img alt="Benedict XVI in 2011" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/80/Papst_Benedikt_XVI_in_Berlin_2011.jpg/124px-Papst_Benedikt_XVI_in_Berlin_2011.jpg" decoding="async" width="124" height="158" data-file-width="749" data-file-height="953"></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;">Benedict XVI</div></div>
</div>
<ul><li>Croatia <b><a href="/wiki/Croatia_and_the_euro" title="Croatia and the euro">adopts the euro</a></b> and joins the <a href="/wiki/Schengen_Area" title="Schengen Area">Schengen Area</a>.</li>
<li><a href="/wiki/Pope" title="Pope">Pope</a> Emeritus <b><a href="/wiki/Pope_Benedict_XVI" title="Pope Benedict XVI">Benedict XVI</a></b> <i>(pictured)</i> <a href="/wiki/Death_and_funeral_of_Pope_Benedict_XVI" title="Death and funeral of Pope Benedict XVI">dies</a> at the age of 95.</li>
<li>Brazilian footballer <b><a href="/wiki/Pel%C3%A9" title="Pelé">Pelé</a></b> dies at the age of 82.</li>
<li><b><a href="/wiki/December_2022_North_American_winter_storm" title="December 2022 North American winter storm">A winter storm</a></b> causes record-breaking low temperatures and leaves more than 90 people dead across North America.</li></ul><div class="itn-footer" style="margin-top: 0.5em;">
<div><b><a href="/wiki/Portal:Current_events" title="Portal:Current events">Ongoing</a></b>: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist inline">
<ul><li><a href="/wiki/Mahsa_Amini_protests" title="Mahsa Amini protests">Mahsa Amini protests</a></li>
<li><a href="/wiki/2022_Peruvian_political_protests" title="2022 Peruvian political protests">Peruvian protests</a></li>
<li><a href="/wiki/2022_Russian_invasion_of_Ukraine" title="2022 Russian invasion of Ukraine">Russian invasion of Ukraine</a></li></ul></div></div>
<div><b><a href="/wiki/Deaths_in_2023" title="Deaths in 2023">Recent deaths</a></b>: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist inline">
<ul><li><span class="nowrap"><a href="/wiki/R._K._Krishna_Kumar" title="R. K. Krishna Kumar">R. K. Krishna Kumar</a></span></li>
<li><a href="/wiki/Anita_Pointer" title="Anita Pointer">Anita Pointer</a></li>
<li><a href="/wiki/Abdul_Hamid_(voice_actor)" title="Abdul Hamid (voice actor)">Abdul Hamid</a></li>
<li><a href="/wiki/Jeremiah_Green" title="Jeremiah Green">Jeremiah Green</a></li>
<li><a href="/wiki/Jian_Xianfo" title="Jian Xianfo">Jian Xianfo</a></li>
<li><a href="/wiki/Barbara_Walters" title="Barbara Walters">Barbara Walters</a></li></ul></div></div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist itn-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:In_the_news/Candidates" title="Wikipedia:In the news/Candidates">Nominate an article</a></b></li></ul></div></div>
<h2 id="mp-otd-h2" class="mp-h2"><span class="mw-headline" id="On_this_day">On this day</span></h2>
<div id="mp-otd" class="mp-contains-float">
<p><b><a href="/wiki/January_2" title="January 2">January 2</a></b>: <a href="/wiki/Calendar_of_saints" title="Calendar of saints">Feast day</a> of <b><a href="/wiki/Gregory_of_Nazianzus" title="Gregory of Nazianzus">Saint Gregory of Nazianzus</a></b> and <b><a href="/wiki/Basil_of_Caesarea" title="Basil of Caesarea">Saint Basil of Caesarea</a></b> (<a href="/wiki/Roman_Rite" title="Roman Rite">Roman Rite Catholicism</a>, <a href="/wiki/Anglican_Communion" title="Anglican Communion">Anglicanism</a>)
</p>
<div style="float:right;margin-left:0.5em;" id="mp-otd-img">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 124px;">
<a href="/wiki/File:Urbain_Le_Verrier.jpg" class="image" title="Urbain Le Verrier"><img alt="Urbain Le Verrier" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/89/Urbain_Le_Verrier.jpg/124px-Urbain_Le_Verrier.jpg" decoding="async" width="124" height="158" data-file-width="669" data-file-height="851"></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;">Urbain Le Verrier</div></div>
</div>
<ul><li><a href="/wiki/533" title="533">533</a> – Mercurius, a Roman priest, was elected <b><a href="/wiki/Pope_John_II" title="Pope John II">Pope John II</a></b>; he was apparently the first pope to <a href="/wiki/Papal_name" title="Papal name">adopt a new name upon elevation to the papacy</a>.</li>
<li><a href="/wiki/1680" title="1680">1680</a> – <b><a href="/wiki/Trunajaya_rebellion" title="Trunajaya rebellion">Trunajaya rebellion</a></b>: <a href="/wiki/Amangkurat_II_of_Mataram" title="Amangkurat II of Mataram">Amangkurat II of Mataram</a> of <a href="/wiki/Java" title="Java">Java</a> and his courtiers stabbed <a href="/wiki/Trunajaya" title="Trunajaya">Trunajaya</a> to death a week after the rebel leader surrendered to <a href="/wiki/Dutch_East_India_Company" title="Dutch East India Company">VOC</a> forces.</li>
<li><a href="/wiki/1860" title="1860">1860</a> – French mathematician <a href="/wiki/Urbain_Le_Verrier" title="Urbain Le Verrier">Urbain Le Verrier</a> <i>(pictured)</i> announced the putative discovery of the planet <b><a href="/wiki/Vulcan_(hypothetical_planet)" title="Vulcan (hypothetical planet)">Vulcan</a></b> at a meeting at the <a href="/wiki/French_Academy_of_Sciences" title="French Academy of Sciences">French Academy of Sciences</a> in Paris.</li>
<li><a href="/wiki/1944" title="1944">1944</a> – <a href="/wiki/World_War_II" title="World War II">World War II</a>: United States and Australian forces <b><a href="/wiki/Landing_at_Saidor" title="Landing at Saidor">successfully landed</a></b> in Papua New Guinea in an attempt to cut off a Japanese retreat.</li>
<li><a href="/wiki/1963" title="1963">1963</a> – <a href="/wiki/Vietnam_War" title="Vietnam War">Vietnam War</a>: The <a href="/wiki/Viet_Cong" title="Viet Cong">Viet Cong</a> won its first major victory at the <b><a href="/wiki/Battle_of_Ap_Bac" title="Battle of Ap Bac">Battle of Ap Bac</a></b>.</li></ul><link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist" style="margin-top: 0.5em;"><ul><li><b><a href="/wiki/Lodomer" title="Lodomer">Lodomer</a></b>  (<abbr title="died">d.</abbr> 1298)</li><li><b><a href="/wiki/Tex_Rickard" title="Tex Rickard">Tex Rickard</a></b>  (<abbr title="born">b.</abbr> 1870)</li><li><b><a href="/wiki/Dnyaneshwar_Agashe" title="Dnyaneshwar Agashe">Dnyaneshwar Agashe</a></b>   (<abbr title="died">d.</abbr> 2009)</li></ul></div>
<div style="margin-top:0.5em;">
More anniversaries: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist inline nowraplinks">
<ul><li><a href="/wiki/January_1" title="January 1">January 1</a></li>
<li><b><a href="/wiki/January_2" title="January 2">January 2</a></b></li>
<li><a href="/wiki/January_3" title="January 3">January 3</a></li></ul></div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist otd-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Selected_anniversaries/January" title="Wikipedia:Selected anniversaries/January">Archive</a></b></li>
<li><b><a href="https://lists.wikimedia.org/postorius/lists/daily-article-l.lists.wikimedia.org/" class="extiw" title="mail:daily-article-l">By email</a></b></li>
<li><b><a href="/wiki/List_of_days_of_the_year" title="List of days of the year">List of days of the year</a></b></li></ul></div></div>
</div>
</div>
<div id="mp-middle" class="MainPageBG mp-box">
<h2 id="mp-tfl-h2" class="mp-h2"><span id="From_today.27s_featured_list"></span><span class="mw-headline" id="From_today's_featured_list">From today's featured list</span></h2>
<div id="mp-tfl" class="mp-contains-float"><div id="mp-tfl-img" style="float:right;margin:0.5em 0 0.4em 0.9em;"><div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 139px;">
<a href="/wiki/File:Andriy_Shevchenko-ua2011.jpeg" class="image" title="Andriy Shevchenko"><img alt="Andriy Shevchenko" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/24/Andriy_Shevchenko-ua2011.jpeg/139px-Andriy_Shevchenko-ua2011.jpeg" decoding="async" width="139" height="141" data-file-width="457" data-file-height="465"></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;">Andriy Shevchenko</div></div>
</div>
<p>Ukrainian former professional footballer <b><a href="/wiki/List_of_international_goals_scored_by_Andriy_Shevchenko" title="List of international goals scored by Andriy Shevchenko">Andriy Shevchenko scored 48 goals</a></b> in 111 <a href="/wiki/Cap_(sport)" title="Cap (sport)">appearances</a> for the <a href="/wiki/Ukraine_national_football_team" title="Ukraine national football team">Ukraine national football team</a>. He is the team's all-time top goalscorer, and the third most-capped <a href="/wiki/List_of_Ukraine_international_footballers" title="List of Ukraine international footballers">Ukrainian international</a>. He made his debut for his country in a 4–0 loss to <a href="/wiki/Croatia_national_football_team" title="Croatia national football team">Croatia</a> in a <a href="/wiki/UEFA_Euro_1996" title="UEFA Euro 1996">UEFA Euro 1996</a> <a href="/wiki/UEFA_Euro_1996_qualifying_Group_4" title="UEFA Euro 1996 qualifying Group 4">qualifying match</a> in March 1995. He did not score his first goal until May 1996, however, when he scored in a <a href="/wiki/Exhibition_game" title="Exhibition game">friendly</a> against <a href="/wiki/Turkey_national_football_team" title="Turkey national football team">Turkey</a>. During the <a href="/wiki/2002_FIFA_World_Cup_qualification_(UEFA)" title="2002 FIFA World Cup qualification (UEFA)">UEFA section of the 2002 FIFA World Cup qualifiers</a>, Shevchenko scored nine goals in the <a href="/wiki/2002_FIFA_World_Cup_qualification_%E2%80%93_UEFA_Group_5" title="2002 FIFA World Cup qualification – UEFA Group 5">qualifying group</a> and captained the side to a second-place finish behind <a href="/wiki/Poland_national_football_team" title="Poland national football team">Poland</a>. In the group stage of the <a href="/wiki/2006_FIFA_World_Cup" title="2006 FIFA World Cup">2006 FIFA World Cup</a>, Ukraine's first as an independent nation, he scored one goal against <a href="/wiki/Saudi_Arabia_national_football_team" title="Saudi Arabia national football team">Saudi Arabia</a> in a 4–0 victory, and another goal against <a href="/wiki/Tunisia_national_football_team" title="Tunisia national football team">Tunisia</a> in a 1–0 victory. He scored his final international goal in the 55th minute of a <a href="/wiki/UEFA_Euro_2012" title="UEFA Euro 2012">UEFA Euro 2012</a> <a href="/wiki/UEFA_Euro_2012_Group_D" title="UEFA Euro 2012 Group D">group stage</a> match against Sweden, which ended as a 2–1 victory for Ukraine. (<b><a href="/wiki/List_of_international_goals_scored_by_Andriy_Shevchenko" title="List of international goals scored by Andriy Shevchenko">Full list...</a></b>)
</p>
<div class="tfl-recent" style="text-align: right;">
Recently featured: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist inline">
<ul><li><a href="/wiki/Bruce_Willis_filmography" title="Bruce Willis filmography">Bruce Willis filmography</a></li>
<li><a href="/wiki/List_of_Roman_Catholic_archbishops_of_Montreal" title="List of Roman Catholic archbishops of Montreal">Roman Catholic archbishops of Montreal</a></li>
<li><a href="/wiki/List_of_municipalities_in_Nunavut" title="List of municipalities in Nunavut">Municipalities in Nunavut</a></li></ul></div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist tfl-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Today%27s_featured_list/January_2023" title="Wikipedia:Today's featured list/January 2023">Archive</a></b></li>
<li><b><a href="/wiki/Wikipedia:Featured_lists" title="Wikipedia:Featured lists">More featured lists</a></b></li></ul></div></div>
</div>
<div id="mp-lower" class="MainPageBG mp-box">
<h2 id="mp-tfp-h2" class="mp-h2"><span id="Today.27s_featured_picture"></span><span class="mw-headline" id="Today's_featured_picture">Today's featured picture</span></h2>
<div id="mp-tfp">
<table role="presentation" style="margin:0 3px 3px; width:100%; box-sizing:border-box; text-align:center; background-color:transparent; border-collapse:collapse; padding:0.9em"><tbody><tr><td><video id="mwe_player_0" poster="//upload.wikimedia.org/wikipedia/commons/thumb/e/e3/PWR_nuclear_power_plant_animation.webm/500px--PWR_nuclear_power_plant_animation.webm.jpg" controls="" preload="none" width="500" height="281" data-durationhint="64" data-mwtitle="PWR_nuclear_power_plant_animation.webm" data-mwprovider="wikimediacommons"><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.480p.vp9.webm" type='video/webm; codecs="vp9, opus"' data-title="SD VP9 (480P)" data-shorttitle="VP9 480P" data-transcodekey="480p.vp9.webm" data-width="854" data-height="480" data-bandwidth="492720" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.480p.webm" type='video/webm; codecs="vp8, vorbis"' data-title="SD WebM (480P)" data-shorttitle="WebM 480P" data-transcodekey="480p.webm" data-width="854" data-height="480" data-bandwidth="735880" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/e/e3/PWR_nuclear_power_plant_animation.webm" type='video/webm; codecs="vp9, opus"' data-title="Original WebM file, 960 × 540 (3.87 Mbps)" data-shorttitle="WebM source" data-width="960" data-height="540" data-bandwidth="3874935" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.120p.vp9.webm" type='video/webm; codecs="vp9, opus"' data-title="Lowest bandwidth VP9 (120P)" data-shorttitle="VP9 120P" data-transcodekey="120p.vp9.webm" data-width="214" data-height="120" data-bandwidth="126272" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.160p.webm" type='video/webm; codecs="vp8, vorbis"' data-title="Low bandwidth WebM (160P)" data-shorttitle="WebM 160P" data-transcodekey="160p.webm" data-width="284" data-height="160" data-bandwidth="177520" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.180p.vp9.webm" type='video/webm; codecs="vp9, opus"' data-title="Low bandwidth VP9 (180P)" data-shorttitle="VP9 180P" data-transcodekey="180p.vp9.webm" data-width="320" data-height="180" data-bandwidth="161872" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.240p.vp9.webm" type='video/webm; codecs="vp9, opus"' data-title="Small VP9 (240P)" data-shorttitle="VP9 240P" data-transcodekey="240p.vp9.webm" data-width="426" data-height="240" data-bandwidth="199352" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.240p.webm" type='video/webm; codecs="vp8, vorbis"' data-title="Small WebM (240P)" data-shorttitle="WebM 240P" data-transcodekey="240p.webm" data-width="426" data-height="240" data-bandwidth="253616" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.360p.vp9.webm" type='video/webm; codecs="vp9, opus"' data-title="VP9 (360P)" data-shorttitle="VP9 360P" data-transcodekey="360p.vp9.webm" data-width="640" data-height="360" data-bandwidth="289896" data-framerate="30"></source><source src="//upload.wikimedia.org/wikipedia/commons/transcoded/e/e3/PWR_nuclear_power_plant_animation.webm/PWR_nuclear_power_plant_animation.webm.360p.webm" type='video/webm; codecs="vp8, vorbis"' data-title="WebM (360P)" data-shorttitle="WebM 360P" data-transcodekey="360p.webm" data-width="640" data-height="360" data-bandwidth="414688" data-framerate="30"></source><track src="https://commons.wikimedia.org/w/api.php?action=timedtext&amp;title=File%3APWR_nuclear_power_plant_animation.webm&amp;lang=cs&amp;trackformat=vtt&amp;origin=%2A" kind="subtitles" type="text/vtt" srclang="cs" label="čeština" data-dir="ltr"></track><track src="https://commons.wikimedia.org/w/api.php?action=timedtext&amp;title=File%3APWR_nuclear_power_plant_animation.webm&amp;lang=en&amp;trackformat=vtt&amp;origin=%2A" kind="subtitles" type="text/vtt" srclang="en" label="Englis" data-dir="ltr"></track><track src="https://commons.wikimedia.org/w/api.php?action=timedtext&amp;title=File%3APWR_nuclear_power_plant_animation.webm&amp;lang=eu&amp;trackformat=vtt&amp;origin=%2A" kind="subtitles" type="text/vtt" srclang="eu" label="euskara" data-dir="ltr"></track><track src="https://commons.wikimedia.org/w/api.php?action=timedtext&amp;title=File%3APWR_nuclear_power_plant_animation.webm&amp;lang=pt-br&amp;trackformat=vtt&amp;origin=%2A" kind="subtitles" type="text/vtt" srclang="pt-BR" label="português do Brasil (pt-br)" data-dir="ltr"></track></video></td></tr><tr><td style="padding:0 0.9em; text-align:left;">
<p>A <b><a href="/wiki/Pressurized_water_reactor" title="Pressurized water reactor">pressurized water reactor</a></b> is a type of <a href="/wiki/Nuclear_reactor" title="Nuclear reactor">nuclear reactor</a> used to generate <a href="/wiki/Nuclear_power" title="Nuclear power">nuclear power</a>. It works by placing <a href="/wiki/Nuclear_fuel" title="Nuclear fuel">nuclear fuel</a> in a <a href="/wiki/Reactor_pressure_vessel" title="Reactor pressure vessel">reactor pressure vessel</a>, which is then engaged in a controlled <a href="/wiki/Nuclear_chain_reaction" title="Nuclear chain reaction">fission chain reaction</a>, producing heat. This heats water in the primary coolant loop by thermal conduction through the fuel cladding. The hot primary coolant is pumped into a <a href="/wiki/Heat_exchanger" title="Heat exchanger">heat exchanger</a> called the <a href="/wiki/Steam_generator_(nuclear_power)" title="Steam generator (nuclear power)">steam generator</a>, where it flows through several thousand small tubes. Heat is transferred through the walls of these tubes to the secondary coolant which evaporates to pressurized steam. This transfer of heat is accomplished without mixing the two fluids. This digital animation was produced by the <a href="/wiki/Tennessee_Valley_Authority" title="Tennessee Valley Authority">Tennessee Valley Authority</a>, a federally owned <a href="/wiki/Electric_utility" title="Electric utility">electric utility</a> corporation in the United States, and narrates the operation of a pressurized water reactor.
</p>
<p style="text-align:center;"><small>Animation credit: <a href="/wiki/Tennessee_Valley_Authority" title="Tennessee Valley Authority">Tennessee Valley Authority</a></small></p>
<div class="potd-recent" style="text-align:right;">
Recently featured: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist inline">
<ul><li><a href="/wiki/Template:POTD/2023-01-01" title="Template:POTD/2023-01-01">Schloss Favorite, Ludwigsburg</a></li>
<li><a href="/wiki/Template:POTD/2022-12-31" title="Template:POTD/2022-12-31">Survey of Palestine</a></li>
<li><a href="/wiki/Template:POTD/2022-12-30" title="Template:POTD/2022-12-30">Green–Meldrim House</a></li></ul></div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist potd-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Picture_of_the_day/Archive" title="Wikipedia:Picture of the day/Archive">Archive</a></b></li>
<li><b><a href="/wiki/Wikipedia:Featured_pictures" title="Wikipedia:Featured pictures">More featured pictures</a></b></li></ul></div>
</td></tr></tbody></table></div>
</div>
<div id="mp-bottom" class="mp-box">
<h2 id="mp-other" class="mp-h2"><span class="mw-headline" id="Other_areas_of_Wikipedia">Other areas of Wikipedia</span></h2>
<div id="mp-other-content">
<ul><li><b><a href="/wiki/Wikipedia:Community_portal" title="Wikipedia:Community portal">Community portal</a></b> – The central hub for editors, with resources, links, tasks, and announcements.</li>
<li><b><a href="/wiki/Wikipedia:Village_pump" title="Wikipedia:Village pump">Village pump</a></b> – Forum for discussions about Wikipedia itself, including policies and technical issues.</li>
<li><b><a href="/wiki/Wikipedia:News" title="Wikipedia:News">Site news</a></b> – Sources of news about Wikipedia and the broader Wikimedia movement.</li>
<li><b><a href="/wiki/Wikipedia:Teahouse" title="Wikipedia:Teahouse">Teahouse</a></b> – Ask basic questions about using or editing Wikipedia.</li>
<li><b><a href="/wiki/Wikipedia:Help_desk" title="Wikipedia:Help desk">Help desk</a></b> – Ask questions about using or editing Wikipedia.</li>
<li><b><a href="/wiki/Wikipedia:Reference_desk" title="Wikipedia:Reference desk">Reference desk</a></b> – Ask research questions about encyclopedic topics.</li>
<li><b><a href="/wiki/Wikipedia:Contents/Portals" title="Wikipedia:Contents/Portals">Content portals</a></b> – A unique way to navigate the encyclopedia.</li></ul></div>
<h2 id="mp-sister" class="mp-h2"><span id="Wikipedia.27s_sister_projects"></span><span class="mw-headline" id="Wikipedia's_sister_projects">Wikipedia's sister projects</span></h2>
<div id="mp-sister-content"><style data-mw-deduplicate="TemplateStyles:r1007624485">.mw-parser-output #sister-projects-list{display:flex;flex-wrap:wrap}.mw-parser-output #sister-projects-list li{display:inline-block}.mw-parser-output #sister-projects-list li span{font-weight:bold}.mw-parser-output #sister-projects-list li>div{display:inline-block;vertical-align:middle;padding:6px 4px}.mw-parser-output #sister-projects-list li>div:first-child{text-align:center}@media(min-width:360px){.mw-parser-output #sister-projects-list li{width:33%;min-width:20em;white-space:nowrap;flex:1 0 25%}.mw-parser-output #sister-projects-list li>div:first-child{min-width:50px}}</style><p>Wikipedia is written by volunteer editors and hosted by the <a href="/wiki/Wikimedia_Foundation" title="Wikimedia Foundation">Wikimedia Foundation</a>, a non-profit organization that also hosts a range of other volunteer <a href="https://wikimediafoundation.org/our-work/wikimedia-projects/" class="extiw" title="foundationsite:our-work/wikimedia-projects/">projects</a>:
</p>
<style data-mw-deduplicate="TemplateStyles:r1126788409">.mw-parser-output .plainlist ol,.mw-parser-output .plainlist ul{line-height:inherit;list-style:none;margin:0;padding:0}.mw-parser-output .plainlist ol li,.mw-parser-output .plainlist ul li{margin-bottom:0}</style><div class="plainlist">
<ul id="sister-projects-list"><li>
  <div><a href="https://commons.wikimedia.org/wiki/" title="Commons"><img alt="Commons logo" src="//upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/31px-Commons-logo.svg.png" decoding="async" width="31" height="42" srcset="//upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/47px-Commons-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/62px-Commons-logo.svg.png 2x" data-file-width="1024" data-file-height="1376"></a></div>
  <div><span><a href="https://commons.wikimedia.org/wiki/" class="extiw" title="c:">Commons</a></span><br>Free media repository</div>
</li>
<li>
  <div><a href="https://www.mediawiki.org/wiki/" title="MediaWiki"><img alt="MediaWiki logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/MediaWiki-2020-icon.svg/35px-MediaWiki-2020-icon.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/MediaWiki-2020-icon.svg/53px-MediaWiki-2020-icon.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a6/MediaWiki-2020-icon.svg/70px-MediaWiki-2020-icon.svg.png 2x" data-file-width="100" data-file-height="100"></a></div>
  <div><span><a href="https://www.mediawiki.org/wiki/" class="extiw" title="mw:">MediaWiki</a></span><br>Wiki software development</div>
</li>
<li>
  <div><a href="https://meta.wikimedia.org/wiki/" title="Meta-Wiki"><img alt="Meta-Wiki logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/35px-Wikimedia_Community_Logo.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/53px-Wikimedia_Community_Logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/70px-Wikimedia_Community_Logo.svg.png 2x" data-file-width="900" data-file-height="900"></a></div>
  <div><span><a href="https://meta.wikimedia.org/wiki/" class="extiw" title="m:">Meta-Wiki</a></span><br>Wikimedia project coordination</div>
</li>
<li>
  <div><a href="https://en.wikibooks.org/wiki/" title="Wikibooks"><img alt="Wikibooks logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/35px-Wikibooks-logo.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/53px-Wikibooks-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/70px-Wikibooks-logo.svg.png 2x" data-file-width="300" data-file-height="300"></a></div>
  <div><span><a href="https://en.wikibooks.org/wiki/" class="extiw" title="b:">Wikibooks</a></span><br>Free textbooks and manuals</div>
</li>
<li>
  <div><a href="https://www.wikidata.org/wiki/" title="Wikidata"><img alt="Wikidata logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/47px-Wikidata-logo.svg.png" decoding="async" width="47" height="26" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/71px-Wikidata-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/94px-Wikidata-logo.svg.png 2x" data-file-width="1050" data-file-height="590"></a></div>
  <div><span><a href="https://www.wikidata.org/wiki/" class="extiw" title="d:">Wikidata</a></span><br>Free knowledge base</div>
</li>
<li>
  <div><a href="https://en.wikinews.org/wiki/" title="Wikinews"><img alt="Wikinews logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/51px-Wikinews-logo.svg.png" decoding="async" width="51" height="28" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/77px-Wikinews-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/102px-Wikinews-logo.svg.png 2x" data-file-width="759" data-file-height="415"></a></div>
  <div><span><a href="https://en.wikinews.org/wiki/" class="extiw" title="n:">Wikinews</a></span><br>Free-content news</div>
</li>
<li>
  <div><a href="https://en.wikiquote.org/wiki/" title="Wikiquote"><img alt="Wikiquote logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/35px-Wikiquote-logo.svg.png" decoding="async" width="35" height="41" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/53px-Wikiquote-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/70px-Wikiquote-logo.svg.png 2x" data-file-width="300" data-file-height="355"></a></div>
  <div><span><a href="https://en.wikiquote.org/wiki/" class="extiw" title="q:">Wikiquote</a></span><br>Collection of quotations</div>
</li>
<li>
  <div><a href="https://en.wikisource.org/wiki/" title="Wikisource"><img alt="Wikisource logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/35px-Wikisource-logo.svg.png" decoding="async" width="35" height="37" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/53px-Wikisource-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/70px-Wikisource-logo.svg.png 2x" data-file-width="410" data-file-height="430"></a></div>
  <div><span><a href="https://en.wikisource.org/wiki/" class="extiw" title="s:">Wikisource</a></span><br>Free-content library</div>
</li>
<li>
  <div><a href="https://species.wikimedia.org/wiki/" title="Wikispecies"><img alt="Wikispecies logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/35px-Wikispecies-logo.svg.png" decoding="async" width="35" height="41" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/53px-Wikispecies-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/70px-Wikispecies-logo.svg.png 2x" data-file-width="941" data-file-height="1103"></a></div>
  <div><span><a href="https://species.wikimedia.org/wiki/" class="extiw" title="species:">Wikispecies</a></span><br>Directory of species</div>
</li>
<li>
  <div><a href="https://en.wikiversity.org/wiki/" title="Wikiversity"><img alt="Wikiversity logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Wikiversity_logo_2017.svg/41px-Wikiversity_logo_2017.svg.png" decoding="async" width="41" height="34" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Wikiversity_logo_2017.svg/62px-Wikiversity_logo_2017.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Wikiversity_logo_2017.svg/82px-Wikiversity_logo_2017.svg.png 2x" data-file-width="626" data-file-height="512"></a></div>
  <div><span><a href="https://en.wikiversity.org/wiki/" class="extiw" title="v:">Wikiversity</a></span><br>Free learning tools</div>
</li>
<li>
  <div><a href="https://en.wikivoyage.org/wiki/" title="Wikivoyage"><img alt="Wikivoyage logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/35px-Wikivoyage-Logo-v3-icon.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/53px-Wikivoyage-Logo-v3-icon.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/70px-Wikivoyage-Logo-v3-icon.svg.png 2x" data-file-width="193" data-file-height="193"></a></div>
  <div><span><a href="https://en.wikivoyage.org/wiki/" class="extiw" title="voy:">Wikivoyage</a></span><br>Free travel guide</div>
</li>
<li>
  <div><a href="https://en.wiktionary.org/wiki/" title="Wiktionary"><img alt="Wiktionary logo" src="//upload.wikimedia.org/wikipedia/en/thumb/0/06/Wiktionary-logo-v2.svg/35px-Wiktionary-logo-v2.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/en/thumb/0/06/Wiktionary-logo-v2.svg/53px-Wiktionary-logo-v2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/0/06/Wiktionary-logo-v2.svg/70px-Wiktionary-logo-v2.svg.png 2x" data-file-width="391" data-file-height="391"></a></div>
  <div><span><a href="https://en.wiktionary.org/wiki/" class="extiw" title="wikt:">Wiktionary</a></span><br>Dictionary and thesaurus</div>
</li>
</ul></div></div>
<h2 id="mp-lang" class="mp-h2"><span class="mw-headline" id="Wikipedia_languages">Wikipedia languages</span></h2>
<div><style data-mw-deduplicate="TemplateStyles:r997272951">.mw-parser-output .wikipedia-languages-complete{font-weight:bold}.mw-parser-output .wikipedia-languages ul{margin-left:0}.mw-parser-output .wikipedia-languages ul a{white-space:nowrap}.mw-parser-output .wikipedia-languages>ul{list-style:none;text-align:center;clear:both}.mw-parser-output .wikipedia-languages-count-container{width:90%;display:flex;justify-content:center;padding-top:1em;margin:0 auto}.mw-parser-output .wikipedia-languages-prettybars{width:100%;height:1px;margin:0.5em 0;background-color:#c8ccd1;flex-shrink:1;align-self:center}.mw-parser-output .wikipedia-languages-count{padding:0 1em;white-space:nowrap}</style><div class="wikipedia-languages nourlexpansion">
<p>This Wikipedia is written in <a href="/wiki/English_language" title="English language">English</a>. Many <a href="https://meta.wikimedia.org/wiki/List_of_Wikipedias" class="extiw" title="meta:List of Wikipedias">other Wikipedias are available</a>; some of the largest are listed below.
</p>
<ul class="plainlinks"><li>
  <div class="wikipedia-languages-count-container">
    <div class="wikipedia-languages-prettybars"></div>
    <div role="heading" class="wikipedia-languages-count">1,000,000+ articles</div>
    <div class="wikipedia-languages-prettybars"></div>
  </div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist wikipedia-languages-langs inline">
<ul><li><a class="external text" href="https://ar.wikipedia.org/wiki/"><span class="autonym" title="Arabic (ar:)" lang="ar">العربية</span></a></li>
<li><a class="external text" href="https://de.wikipedia.org/wiki/"><span class="autonym" title="German (de:)" lang="de">Deutsch</span></a></li>
<li><a class="external text" href="https://es.wikipedia.org/wiki/"><span class="autonym" title="Spanish (es:)" lang="es">Español</span></a></li>
<li><a class="external text" href="https://fr.wikipedia.org/wiki/"><span class="autonym" title="French (fr:)" lang="fr">Français</span></a></li>
<li><a class="external text" href="https://it.wikipedia.org/wiki/"><span class="autonym" title="Italian (it:)" lang="it">Italiano</span></a></li>
<li><a class="external text" href="https://nl.wikipedia.org/wiki/"><span class="autonym" title="Dutch (nl:)" lang="nl">Nederlands</span></a></li>
<li><a class="external text" href="https://ja.wikipedia.org/wiki/"><span class="autonym" title="Japanese (ja:)" lang="ja">日本語</span></a></li>
<li><a class="external text" href="https://pl.wikipedia.org/wiki/"><span class="autonym" title="Polish (pl:)" lang="pl">Polski</span></a></li>
<li><a class="external text" href="https://pt.wikipedia.org/wiki/"><span class="autonym" title="Portuguese (pt:)" lang="pt">Português</span></a></li>
<li><a class="external text" href="https://ru.wikipedia.org/wiki/"><span class="autonym" title="Russian (ru:)" lang="ru">Русский</span></a></li>
<li><a class="external text" href="https://sv.wikipedia.org/wiki/"><span class="autonym" title="Swedish (sv:)" lang="sv">Svenska</span></a></li>
<li><a class="external text" href="https://uk.wikipedia.org/wiki/"><span class="autonym" title="Ukrainian (uk:)" lang="uk">Українська</span></a></li>
<li><a class="external text" href="https://vi.wikipedia.org/wiki/"><span class="autonym" title="Vietnamese (vi:)" lang="vi">Tiếng Việt</span></a></li>
<li><a class="external text" href="https://zh.wikipedia.org/wiki/"><span class="autonym" title="Chinese (zh:)" lang="zh">中文</span></a></li></ul></div>
</li>
<li>
  <div class="wikipedia-languages-count-container">
    <div class="wikipedia-languages-prettybars"></div>
    <div role="heading" class="wikipedia-languages-count">250,000+ articles</div>
    <div class="wikipedia-languages-prettybars"></div>
  </div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist wikipedia-languages-langs inline">
<ul><li><a class="external text" href="https://id.wikipedia.org/wiki/"><span class="autonym" title="Indonesian (id:)" lang="id">Bahasa Indonesia</span></a></li>
<li><a class="external text" href="https://ms.wikipedia.org/wiki/"><span class="autonym" title="Malay (ms:)" lang="ms">Bahasa Melayu</span></a></li>
<li><a class="external text" href="https://zh-min-nan.wikipedia.org/wiki/"><span class="autonym" title="Min Nan Chinese (nan:)" lang="nan">Bân-lâm-gú</span></a></li>
<li><a class="external text" href="https://bg.wikipedia.org/wiki/"><span class="autonym" title="Bulgarian (bg:)" lang="bg">Български</span></a></li>
<li><a class="external text" href="https://ca.wikipedia.org/wiki/"><span class="autonym" title="Catalan (ca:)" lang="ca">Català</span></a></li>
<li><a class="external text" href="https://cs.wikipedia.org/wiki/"><span class="autonym" title="Czech (cs:)" lang="cs">Čeština</span></a></li>
<li><a class="external text" href="https://da.wikipedia.org/wiki/"><span class="autonym" title="Danish (da:)" lang="da">Dansk</span></a></li>
<li><a class="external text" href="https://eo.wikipedia.org/wiki/"><span class="autonym" title="Esperanto (eo:)" lang="eo">Esperanto</span></a></li>
<li><a class="external text" href="https://eu.wikipedia.org/wiki/"><span class="autonym" title="Basque (eu:)" lang="eu">Euskara</span></a></li>
<li><a class="external text" href="https://fa.wikipedia.org/wiki/"><span class="autonym" title="Persian (fa:)" lang="fa">فارسی</span></a>‎</li>
<li><a class="external text" href="https://he.wikipedia.org/wiki/"><span class="autonym" title="Hebrew (he:)" lang="he">עברית</span></a></li>
<li><a class="external text" href="https://ko.wikipedia.org/wiki/"><span class="autonym" title="Korean (ko:)" lang="ko">한국어</span></a></li>
<li><a class="external text" href="https://hu.wikipedia.org/wiki/"><span class="autonym" title="Hungarian (hu:)" lang="hu">Magyar</span></a></li>
<li><a class="external text" href="https://no.wikipedia.org/wiki/"><span class="autonym" title="Norwegian (no:)" lang="no">Norsk Bokmål</span></a></li>
<li><a class="external text" href="https://ro.wikipedia.org/wiki/"><span class="autonym" title="Romanian (ro:)" lang="ro">Română</span></a></li>
<li><a class="external text" href="https://sr.wikipedia.org/wiki/"><span class="autonym" title="Serbian (sr:)" lang="sr">Srpski</span></a></li>
<li><a class="external text" href="https://sh.wikipedia.org/wiki/"><span class="autonym" title="Serbo-Croatian (sh:)" lang="sh">Srpskohrvatski</span></a></li>
<li><a class="external text" href="https://fi.wikipedia.org/wiki/"><span class="autonym" title="Finnish (fi:)" lang="fi">Suomi</span></a></li>
<li><a class="external text" href="https://tr.wikipedia.org/wiki/"><span class="autonym" title="Turkish (tr:)" lang="tr">Türkçe</span></a></li></ul></div>
</li>
<li>
  <div class="wikipedia-languages-count-container">
    <div class="wikipedia-languages-prettybars"></div>
    <div role="heading" class="wikipedia-languages-count">50,000+ articles</div>
    <div class="wikipedia-languages-prettybars"></div>
  </div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"><div class="hlist wikipedia-languages-langs inline">
<ul><li><a class="external text" href="https://ast.wikipedia.org/wiki/"><span class="autonym" title="Asturian (ast:)" lang="ast">Asturianu</span></a></li>
<li><a class="external text" href="https://bn.wikipedia.org/wiki/"><span class="autonym" title="Bangla (bn:)" lang="bn">বাংলা</span></a></li>
<li><a class="external text" href="https://bs.wikipedia.org/wiki/"><span class="autonym" title="Bosnian (bs:)" lang="bs">Bosanski</span></a></li>
<li><a class="external text" href="https://et.wikipedia.org/wiki/"><span class="autonym" title="Estonian (et:)" lang="et">Eesti</span></a></li>
<li><a class="external text" href="https://el.wikipedia.org/wiki/"><span class="autonym" title="Greek (el:)" lang="el">Ελληνικά</span></a></li>
<li><a class="external text" href="https://simple.wikipedia.org/wiki/"><span class="autonym" title="Simple English (simple:)" lang="simple">Simple English</span></a></li>
<li><a class="external text" href="https://ga.wikipedia.org/wiki/"><span class="autonym" title="Irish (ga:)" lang="ga">Gaeilge</span></a></li>
<li><a class="external text" href="https://gl.wikipedia.org/wiki/"><span class="autonym" title="Galician (gl:)" lang="gl">Galego</span></a></li>
<li><a class="external text" href="https://hr.wikipedia.org/wiki/"><span class="autonym" title="Croatian (hr:)" lang="hr">Hrvatski</span></a></li>
<li><a class="external text" href="https://lv.wikipedia.org/wiki/"><span class="autonym" title="Latvian (lv:)" lang="lv">Latviešu</span></a></li>
<li><a class="external text" href="https://lt.wikipedia.org/wiki/"><span class="autonym" title="Lithuanian (lt:)" lang="lt">Lietuvių</span></a></li>
<li><a class="external text" href="https://ml.wikipedia.org/wiki/"><span class="autonym" title="Malayalam (ml:)" lang="ml">മലയാളം</span></a></li>
<li><a class="external text" href="https://mk.wikipedia.org/wiki/"><span class="autonym" title="Macedonian (mk:)" lang="mk">Македонски</span></a></li>
<li><a class="external text" href="https://nn.wikipedia.org/wiki/"><span class="autonym" title="Norwegian Nynorsk (nn:)" lang="nn">Norsk nynorsk</span></a></li>
<li><a class="external text" href="https://sq.wikipedia.org/wiki/"><span class="autonym" title="Albanian (sq:)" lang="sq">Shqip</span></a></li>
<li><a class="external text" href="https://sk.wikipedia.org/wiki/"><span class="autonym" title="Slovak (sk:)" lang="sk">Slovenčina</span></a></li>
<li><a class="external text" href="https://sl.wikipedia.org/wiki/"><span class="autonym" title="Slovenian (sl:)" lang="sl">Slovenščina</span></a></li>
<li><a class="external text" href="https://th.wikipedia.org/wiki/"><span class="autonym" title="Thai (th:)" lang="th">ไทย</span></a></li></ul></div>
</li>
</ul></div></div>
</div>
<!-- 
NewPP limit report
Parsed by mw1349
Cached time: 20230102193125
Cache expiry: 3600
Reduced expiry: true
Complications: []
CPU time usage: 0.330 seconds
Real time usage: 0.420 seconds
Preprocessor visited node count: 4302/1000000
Post‐expand include size: 131289/2097152 bytes
Template argument size: 13089/2097152 bytes
Highest expansion depth: 18/100
Expensive parser function count: 15/500
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 43295/5000000 bytes
Lua time usage: 0.062/10.000 seconds
Lua memory usage: 1915992/52428800 bytes
Number of Wikibase entities loaded: 0/400
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%  303.867      1 -total
 28.31%   86.019      1 Wikipedia:Main_Page/Tomorrow
 27.18%   82.596      1 Wikipedia:Today's_featured_article/January_2,_2023
 26.89%   81.705      9 Template:Main_page_image
 18.62%   56.583      9 Template:Str_number/trim
 16.29%   49.495     28 Template:Flatlist
 14.93%   45.353      2 Template:TFArecentlist
 12.56%   38.164      2 Template:Main_page_image/TFA
 12.47%   37.894      2 Template:Wikipedia_languages
 12.05%   36.605      1 Template:Did_you_know/Queue/7
-->

<!-- Saved in parser cache with key enwiki:pcache:idhash:15580374-0!canonical!responsiveimages=0 and timestamp 20230102193124 and revision id 1114291180.
 -->
</section></div>
<!-- MobileFormatter took 0.009 seconds --><noscript><img src="//en.wikipedia.org/wiki/Special:CentralAutoLogin/start?type=1x1&amp;mobile=1" alt="" title="" width="1" height="1" style="border: none; position: absolute;" /></noscript>
<div class="printfooter" data-nosnippet="">Retrieved from "<a dir="ltr" href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;oldid=1114291180">https://en.wikipedia.org/w/index.php?title=Main_Page&amp;oldid=1114291180</a>"</div></div>
				
			</div>
			<div class="post-content" id="page-secondary-actions">
				<a  href="/wiki/Special:MobileLanguages/Main_Page" data-title="" class="language-selector mw-ui-button button">
					Language
				</a>
			</div>
		</main>
		<footer class="mw-footer minerva-footer" role="contentinfo">
		  <a class="last-modified-bar" href="/wiki/Special:History/Main_Page">
  	<div class="post-content last-modified-bar__content">
  		<span class="last-modified-bar__icon mw-ui-icon mw-ui-icon-mw-ui-icon-small mw-ui-icon-wikimedia-history-base20 "></span>
  		<span class="last-modified-bar__text modified-enhancement"
  				data-user-name=""
  				data-user-gender=""
  				data-timestamp="">
  				<span>View edit history of this page.</span>
  		</span>
  		<span class="mw-ui-icon mw-ui-icon-small mw-ui-icon-mf-expand-gray mf-mw-ui-icon-rotate-anti-clockwise indicator"></span>
  	</div>
  </a>
	<div class="post-content footer-content">
			
			<div class="minerva-footer-logo"><img src="/static/images/mobile/copyright/wikipedia-wordmark-en.svg" alt="Wikipedia" width="120" height="18"
	style="width: 7.5em; height: 1.125em;"/>

</div>
			<ul id="footer-info" class="footer-info hlist hlist-separated">
	<li id="footer-info-lastmod"> This page was last edited on 5 October 2022, at 19:27<span class="anonymous-show">&#160;(UTC)</span>.</li>
	<li id="footer-info-copyright">Content is available under <a class="external" rel="nofollow" href="https://creativecommons.org/licenses/by-sa/3.0/">CC BY-SA 3.0</a> unless otherwise noted.</li>
</ul>

			<ul id="footer-places" class="footer-places hlist hlist-separated">
	<li id="footer-places-privacy"><a href="https://foundation.wikimedia.org/wiki/Privacy_policy">Privacy policy</a></li>
	<li id="footer-places-about"><a href="/wiki/Wikipedia:About">About Wikipedia</a></li>
	<li id="footer-places-disclaimers"><a href="/wiki/Wikipedia:General_disclaimer">Disclaimers</a></li>
	<li id="footer-places-contact"><a href="//en.wikipedia.org/wiki/Wikipedia:Contact_us">Contact Wikipedia</a></li>
	<li id="footer-places-terms-use"><a href="//m.wikimediafoundation.org/wiki/Terms_of_Use">Terms of Use</a></li>
	<li id="footer-places-desktop-toggle"><a id="mw-mf-display-toggle" href="//en.wikipedia.org/w/index.php?title=Main_Page&amp;mobileaction=toggle_view_desktop" data-event-name="switch_to_desktop">Desktop</a></li>
	<li id="footer-places-developers"><a href="https://developer.wikimedia.org">Developers</a></li>
	<li id="footer-places-statslink"><a href="https://stats.wikimedia.org/#/en.wikipedia.org">Statistics</a></li>
	<li id="footer-places-cookiestatement"><a href="https://foundation.wikimedia.org/wiki/Cookie_statement">Cookie statement</a></li>
</ul>

			</div>
		</footer>
			</div>
</div>
<div class="mw-notification-area" data-mw="interface"></div>
<!-- v:8.3.1 -->
<script>(RLQ=window.RLQ||[]).push(function(){mw.config.set({"wgPageParseReport":{"limitreport":{"cputime":"0.330","walltime":"0.420","ppvisitednodes":{"value":4302,"limit":1000000},"postexpandincludesize":{"value":131289,"limit":2097152},"templateargumentsize":{"value":13089,"limit":2097152},"expansiondepth":{"value":18,"limit":100},"expensivefunctioncount":{"value":15,"limit":500},"unstrip-depth":{"value":0,"limit":20},"unstrip-size":{"value":43295,"limit":5000000},"entityaccesscount":{"value":0,"limit":400},"timingprofile":["100.00%  303.867      1 -total"," 28.31%   86.019      1 Wikipedia:Main_Page/Tomorrow"," 27.18%   82.596      1 Wikipedia:Today's_featured_article/January_2,_2023"," 26.89%   81.705      9 Template:Main_page_image"," 18.62%   56.583      9 Template:Str_number/trim"," 16.29%   49.495     28 Template:Flatlist"," 14.93%   45.353      2 Template:TFArecentlist"," 12.56%   38.164      2 Template:Main_page_image/TFA"," 12.47%   37.894      2 Template:Wikipedia_languages"," 12.05%   36.605      1 Template:Did_you_know/Queue/7"]},"scribunto":{"limitreport-timeusage":{"value":"0.062","limit":"10.000"},"limitreport-memusage":{"value":1915992,"limit":52428800}},"cachereport":{"origin":"mw1349","timestamp":"20230102193125","ttl":3600,"transientcontent":true}}});});</script>
<script>(window.NORLQ=window.NORLQ||[]).push(function(){var ns,i,p,img;ns=document.getElementsByTagName('noscript');for(i=0;i<ns.length;i++){p=ns[i].nextSibling;if(p&&p.className&&p.className.indexOf('lazy-image-placeholder')>-1){img=document.createElement('img');img.setAttribute('src',p.getAttribute('data-src'));img.setAttribute('width',p.getAttribute('data-width'));img.setAttribute('height',p.getAttribute('data-height'));img.setAttribute('alt',p.getAttribute('data-alt'));p.parentNode.replaceChild(img,p);}}});</script><script type="application/ld+json">{"@context":"https:\/\/schema.org","@type":"Article","name":"Main Page","url":"https:\/\/en.wikipedia.org\/wiki\/Main_Page","sameAs":"http:\/\/www.wikidata.org\/entity\/Q5296","mainEntity":"http:\/\/www.wikidata.org\/entity\/Q5296","author":{"@type":"Organization","name":"Contributors to Wikimedia projects"},"publisher":{"@type":"Organization","name":"Wikimedia Foundation, Inc.","logo":{"@type":"ImageObject","url":"https:\/\/www.wikimedia.org\/static\/images\/wmf-hor-googpub.png"}},"datePublished":"2002-01-26T15:28:12Z","dateModified":"2022-10-05T19:27:50Z","image":"https:\/\/upload.wikimedia.org\/wikipedia\/commons\/9\/9c\/AiKhanoumPlateSharp.jpg","headline":"Wikimedia project page"}</script><script>(window.NORLQ=window.NORLQ||[]).push(function(){var ns,i,p,img;ns=document.getElementsByTagName('noscript');for(i=0;i<ns.length;i++){p=ns[i].nextSibling;if(p&&p.className&&p.className.indexOf('lazy-image-placeholder')>-1){img=document.createElement('img');img.setAttribute('src',p.getAttribute('data-src'));img.setAttribute('width',p.getAttribute('data-width'));img.setAttribute('height',p.getAttribute('data-height'));img.setAttribute('alt',p.getAttribute('data-alt'));p.parentNode.replaceChild(img,p);}}});</script><script type="application/ld+json">{"@context":"https:\/\/schema.org","@type":"Article","name":"Main Page","url":"https:\/\/en.wikipedia.org\/wiki\/Main_Page","sameAs":"http:\/\/www.wikidata.org\/entity\/Q5296","mainEntity":"http:\/\/www.wikidata.org\/entity\/Q5296","author":{"@type":"Organization","name":"Contributors to Wikimedia projects"},"publisher":{"@type":"Organization","name":"Wikimedia Foundation, Inc.","logo":{"@type":"ImageObject","url":"https:\/\/www.wikimedia.org\/static\/images\/wmf-hor-googpub.png"}},"datePublished":"2002-01-26T15:28:12Z","dateModified":"2022-10-05T19:27:50Z","image":"https:\/\/upload.wikimedia.org\/wikipedia\/commons\/9\/9c\/AiKhanoumPlateSharp.jpg","headline":"Wikimedia project page"}</script>
<script>(RLQ=window.RLQ||[]).push(function(){mw.config.set({"wgBackendResponseTime":139,"wgHostname":"mw1454"});});</script>
</body>
</html>
''';

const _htmlWithItalics = r'''
<!DOCTYPE html>
<html class="client-nojs vector-feature-language-in-header-enabled vector-feature-language-in-main-page-header-disabled vector-feature-language-alert-in-sidebar-enabled vector-feature-sticky-header-enabled vector-feature-page-tools-pinned-enabled vector-feature-toc-pinned-enabled vector-feature-main-menu-pinned-enabled vector-feature-limited-width-enabled vector-feature-limited-width-content-enabled vector-feature-zebra-design-disabled vector-sticky-header-enabled" lang="en" dir="ltr">
<head>
<meta charset="UTF-8"/>
<title>Wikipedia, the free encyclopedia</title>
<script>document.documentElement.className="client-js vector-feature-language-in-header-enabled vector-feature-language-in-main-page-header-disabled vector-feature-language-alert-in-sidebar-enabled vector-feature-sticky-header-enabled vector-feature-page-tools-pinned-enabled vector-feature-toc-pinned-enabled vector-feature-main-menu-pinned-enabled vector-feature-limited-width-enabled vector-feature-limited-width-content-enabled vector-feature-zebra-design-disabled vector-sticky-header-enabled";RLCONF={"wgBreakFrames":false,"wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],"wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgRequestId":"0dac8abc-827f-428b-9db3-9107ad60b201","wgCSPNonce":false,"wgCanonicalNamespace":"","wgCanonicalSpecialPageName":false,"wgNamespaceNumber":0,"wgPageName":"Main_Page","wgTitle":"Main Page","wgCurRevisionId":1114291180,"wgRevisionId":
1114291180,"wgArticleId":15580374,"wgIsArticle":true,"wgIsRedirect":false,"wgAction":"view","wgUserName":"Fphat","wgUserGroups":["*","user"],"wgCategories":[],"wgPageContentLanguage":"en","wgPageContentModel":"wikitext","wgRelevantPageName":"Main_Page","wgRelevantArticleId":15580374,"wgUserId":29943113,"wgUserIsTemp":false,"wgUserEditCount":2,"wgUserRegistration":1482384949000,"wgIsProbablyEditable":false,"wgRelevantPageIsProbablyEditable":false,"wgRestrictionEdit":["sysop"],"wgRestrictionMove":["sysop"],"wgIsMainPage":true,"wgFlaggedRevsParams":{"tags":{"status":{"levels":1}}},"wgVisualEditor":{"pageLanguageCode":"en","pageLanguageDir":"ltr","pageVariantFallbacks":"en"},"wgMFDisplayWikibaseDescriptions":{"search":true,"watchlist":true,"tagline":false,"nearby":true},"wgWMESchemaEditAttemptStepOversample":false,"wgWMEPageLength":3000,"wgNoticeProject":"wikipedia","wgNoticeUserData":{"registration":"20161222053549"},"wgGlobalGroups":[],"wgMediaViewerOnClick":true,
"wgMediaViewerEnabledByDefault":true,"wgPopupsFlags":10,"wgULSAcceptLanguageList":["en-us","en"],"wgULSBabelLanguages":[],"wgULSCurrentAutonym":"English","wgEditSubmitButtonLabelPublish":true,"wgULSPosition":"interlanguage","wgULSisCompactLinksEnabled":true,"wgULSisLanguageSelectorEmpty":false,"wgWikibaseItemId":"Q5296","GEHomepageSuggestedEditsEnableTopics":true,"wgGETopicsMatchModeEnabled":false,"wgGEStructuredTaskRejectionReasonTextInputEnabled":false,"wgGELevelingUpEnabledForUser":false,"wgEchoSeenTime":{"alert":"1970-01-01T00:00:01Z","notice":"1970-01-01T00:00:01Z"}};RLSTATE={"skins.vector.user.styles":"ready","ext.gadget.WatchlistBase":"ready","ext.gadget.WatchlistGreenIndicators":"ready","ext.gadget.SubtleUpdatemarker":"ready","ext.globalCssJs.user.styles":"ready","site.styles":"ready","user.styles":"ready","skins.vector.user":"ready","ext.globalCssJs.user":"ready","user":"loading","user.options":"loading","mediawiki.ui.button":"ready","skins.vector.styles":"ready",
"skins.vector.icons":"ready","mediawiki.ui.icon":"ready","ext.visualEditor.desktopArticleTarget.noscript":"ready","ext.wikimediaBadges":"ready","ext.echo.styles.badge":"ready","oojs-ui.styles.icons-alerts":"ready","ext.uls.interlanguage":"ready"};RLPAGEMODULES=["site","mediawiki.page.ready","skins.vector.js","mediawiki.page.watch.ajax","mmv.head","mmv.bootstrap.autostart","ext.visualEditor.desktopArticleTarget.init","ext.visualEditor.targetLoader","ext.eventLogging","ext.wikimediaEvents","ext.navigationTiming","ext.cx.eventlogging.campaigns","ext.centralNotice.geoIP","ext.centralNotice.startUp","ext.gadget.ReferenceTooltips","ext.gadget.formWizard","ext.gadget.geonotice","ext.gadget.watchlist-notice","ext.gadget.charinsert","ext.gadget.extra-toolbar-buttons","ext.gadget.switcher","ext.centralauth.centralautologin.clearcookie","ext.echo.init","ext.uls.interface","wikibase.client.vector-2022","ext.growthExperiments.SuggestedEditSession"];</script>
<script>(RLQ=window.RLQ||[]).push(function(){mw.loader.load("/w/load.php?lang=en\u0026modules=user\u0026skin=vector-2022\u0026user=Fphat\u0026version=1968q");mw.loader.implement("user.options@12s5i",function($,jQuery,require,module){mw.user.tokens.set({"patrolToken":"1bf6660fd011e0a540b139f7bc29d3a4644e154a+\\","watchToken":"0e0695aaf5ae49220a57b46e7dd93e78644e154a+\\","csrfToken":"3897c18b9ca6a58f72c40ed6e9c3fff0644e154a+\\"});mw.user.options.set({"compact-language-links":0,"echo-subscriptions-email-article-linked":"1","echo-subscriptions-email-edit-thank":"1","echo-subscriptions-email-mention":"1","echo-subscriptions-email-page-review":"1","echo-subscriptions-web-article-linked":"1","echo-subscriptions-web-reverted":0,"visualeditor-hidebetawelcome":"1","echo-subscriptions-email-edit-user-talk":1});});});</script>
<link rel="stylesheet" href="/w/load.php?lang=en&amp;modules=ext.echo.styles.badge%7Cext.uls.interlanguage%7Cext.visualEditor.desktopArticleTarget.noscript%7Cext.wikimediaBadges%7Cmediawiki.ui.button%2Cicon%7Coojs-ui.styles.icons-alerts%7Cskins.vector.icons%2Cstyles&amp;only=styles&amp;skin=vector-2022"/>
<script async="" src="/w/load.php?lang=en&amp;modules=startup&amp;only=scripts&amp;raw=1&amp;skin=vector-2022"></script>
<meta name="ResourceLoaderDynamicStyles" content=""/>
<link rel="stylesheet" href="/w/load.php?lang=en&amp;modules=ext.gadget.SubtleUpdatemarker%2CWatchlistBase%2CWatchlistGreenIndicators&amp;only=styles&amp;skin=vector-2022"/>
<link rel="stylesheet" href="/w/load.php?lang=en&amp;modules=site.styles&amp;only=styles&amp;skin=vector-2022"/>
<link rel="stylesheet" href="/w/load.php?lang=en&amp;modules=user.styles&amp;only=styles&amp;skin=vector-2022&amp;user=Fphat&amp;version=gb90l"/>
<meta name="generator" content="MediaWiki 1.41.0-wmf.6"/>
<meta name="referrer" content="origin"/>
<meta name="referrer" content="origin-when-crossorigin"/>
<meta name="referrer" content="origin-when-cross-origin"/>
<meta name="robots" content="max-image-preview:standard"/>
<meta name="format-detection" content="telephone=no"/>
<meta property="og:image" content="https://upload.wikimedia.org/wikipedia/commons/4/42/Weymouth_Harbour_and_Bay.jpg"/>
<meta property="og:image:width" content="1200"/>
<meta property="og:image:height" content="800"/>
<meta property="og:image" content="https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Weymouth_Harbour_and_Bay.jpg/800px-Weymouth_Harbour_and_Bay.jpg"/>
<meta property="og:image:width" content="800"/>
<meta property="og:image:height" content="534"/>
<meta property="og:image" content="https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Weymouth_Harbour_and_Bay.jpg/640px-Weymouth_Harbour_and_Bay.jpg"/>
<meta property="og:image:width" content="640"/>
<meta property="og:image:height" content="427"/>
<meta name="viewport" content="width=1000"/>
<meta property="og:title" content="Wikipedia, the free encyclopedia"/>
<meta property="og:type" content="website"/>
<link rel="preconnect" href="//upload.wikimedia.org"/>
<link rel="alternate" media="only screen and (max-width: 720px)" href="//en.m.wikipedia.org/wiki/Main_Page"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia picture of the day feed" href="/w/api.php?action=featuredfeed&amp;feed=potd&amp;feedformat=atom"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia featured articles feed" href="/w/api.php?action=featuredfeed&amp;feed=featured&amp;feedformat=atom"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia &quot;On this day...&quot; feed" href="/w/api.php?action=featuredfeed&amp;feed=onthisday&amp;feedformat=atom"/>
<link rel="apple-touch-icon" href="/static/apple-touch/wikipedia.png"/>
<link rel="icon" href="/static/favicon/wikipedia.ico"/>
<link rel="search" type="application/opensearchdescription+xml" href="/w/opensearch_desc.php" title="Wikipedia (en)"/>
<link rel="EditURI" type="application/rsd+xml" href="//en.wikipedia.org/w/api.php?action=rsd"/>
<link rel="canonical" href="https://en.wikipedia.org/wiki/Main_Page"/>
<link rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/"/>
<link rel="alternate" type="application/atom+xml" title="Wikipedia Atom feed" href="/w/index.php?title=Special:RecentChanges&amp;feed=atom"/>
<link rel="dns-prefetch" href="//meta.wikimedia.org" />
</head>
<body class="skin-vector skin-vector-search-vue mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-subject page-Main_Page rootpage-Main_Page skin-vector-2022 action-view"><a class="mw-jump-link" href="#bodyContent">Jump to content</a>
<div class="vector-header-container">
	<header class="vector-header mw-header">
		<div class="vector-header-start">
			<nav class="vector-main-menu-landmark" aria-label="Site" role="navigation">
				
<div id="vector-main-menu-dropdown" class="vector-menu vector-dropdown vector-menu-dropdown vector-main-menu-dropdown mw-ui-icon-flush-left mw-ui-icon-flush-right"  >
	<input type="checkbox"
		id="vector-main-menu-dropdown-checkbox"
		role="button"
		aria-haspopup="true"
		data-event-name="ui.dropdown-vector-main-menu-dropdown"
		class="vector-menu-checkbox "
		
		aria-label="Main menu"
		
	/>
	<label
		id="vector-main-menu-dropdown-label"
		for="vector-main-menu-dropdown-checkbox"
		class="vector-menu-heading mw-ui-button mw-ui-quiet mw-ui-icon-element "
		aria-hidden="true"
		
	>
		<span class="mw-ui-icon mw-ui-icon-menu mw-ui-icon-wikimedia-menu"></span>

		<span class="vector-menu-heading-label">Main menu</span>
	</label>
	<div class="vector-menu-content vector-dropdown-content">


				<div id="vector-main-menu-unpinned-container" class="vector-unpinned-container">
		
				</div>

	</div>
</div>
		</nav>
			
<a href="/wiki/Main_Page" class="mw-logo">
	<img class="mw-logo-icon" src="/static/images/icons/wikipedia.png" alt=""
		aria-hidden="true" height="50" width="50">
	<span class="mw-logo-container">
		<img class="mw-logo-wordmark" alt="Wikipedia"
			src="/static/images/mobile/copyright/wikipedia-wordmark-en.svg" style="width: 7.5em; height: 1.125em;">
		<img class="mw-logo-tagline"
			alt="The Free Encyclopedia"
			src="/static/images/mobile/copyright/wikipedia-tagline-en.svg" width="117" height="13" style="width: 7.3125em; height: 0.8125em;">
	</span>
</a>

		</div>
		<div class="vector-header-end">
			
<div id="p-search" role="search" class="vector-search-box-vue  vector-search-box-collapses  vector-search-box-show-thumbnail vector-search-box-auto-expand-width vector-search-box">
	<a href="/wiki/Special:Search"
	
		
		
		
		title="Search Wikipedia [f]"
		accesskey="f"
		class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-search search-toggle">
		<span>Search</span>
	</a>
	
	<div>
		<form action="/w/index.php" id="searchform"
			class="vector-search-box-form">
			<div id="simpleSearch"
				class="vector-search-box-inner"
				 data-search-loc="header-moved">
				<input class="vector-search-box-input"
					 type="search" name="search" placeholder="Search Wikipedia" aria-label="Search Wikipedia" autocapitalize="sentences" title="Search Wikipedia [f]" accesskey="f" id="searchInput"
				>
				<input type="hidden" name="title" value="Special:Search">
				<input id="mw-searchButton"
					 class="searchButton mw-fallbackSearchButton" type="submit" name="fulltext" title="Search Wikipedia for this text" value="Search">
				<input id="searchButton"
					 class="searchButton" type="submit" name="go" title="Go to a page with this exact name if it exists" value="Go">
			</div>
		</form>
	</div>
</div>

			<nav class="vector-user-links vector-user-links-wide" aria-label="Personal tools" role="navigation" >
	
<div id="p-vector-user-menu-overflow" class="vector-menu mw-portlet mw-portlet-vector-user-menu-overflow"  >
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="pt-userpage-2" class="user-links-collapsible-item mw-list-item"><a href="/wiki/User:Fphat" class="new" title="Your user page (page does not exist) [.]" accesskey="."><span>Fphat</span></a></li><li id="pt-notifications-alert" class="mw-list-item"><a href="/wiki/Special:Notifications" class="mw-echo-notification-badge-nojs mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-bell mw-ui-icon-wikimedia-bell" data-event-name="ui.notifications" data-counter-num="0" data-counter-text="0" title="Your alerts"><span>Alerts (0)</span></a></li><li id="pt-notifications-notice" class="mw-list-item"><a href="/wiki/Special:Notifications" class="mw-echo-notification-badge-nojs mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-tray mw-ui-icon-wikimedia-tray" data-counter-num="0" data-counter-text="0" title="Your notices"><span>Notices (0)</span></a></li><li id="pt-watchlist-2" class="user-links-collapsible-item mw-list-item"><a href="/wiki/Special:Watchlist" class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-watchlist mw-ui-icon-wikimedia-watchlist" title="The list of pages you are monitoring for changes [L]" accesskey="L"><span>Watchlist</span></a></li></ul>
		
	</div>
</div>

	
<div id="vector-user-links-dropdown" class="vector-menu vector-dropdown vector-menu-dropdown vector-user-menu mw-ui-icon-flush-right vector-user-menu-logged-in"  >
	<input type="checkbox"
		id="vector-user-links-dropdown-checkbox"
		role="button"
		aria-haspopup="true"
		data-event-name="ui.dropdown-vector-user-links-dropdown"
		class="vector-menu-checkbox "
		
		aria-label="Personal tools"
		
	/>
	<label
		id="vector-user-links-dropdown-label"
		for="vector-user-links-dropdown-checkbox"
		class="vector-menu-heading mw-ui-button mw-ui-quiet mw-ui-icon-element "
		aria-hidden="true"
		
	>
		<span class="mw-ui-icon mw-ui-icon-userAvatar mw-ui-icon-wikimedia-userAvatar"></span>

		<span class="vector-menu-heading-label">Personal tools</span>
	</label>
	<div class="vector-menu-content vector-dropdown-content">


		
<div id="p-personal" class="vector-menu mw-portlet mw-portlet-personal"  title="User menu" >
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="pt-userpage" class="user-links-collapsible-item mw-list-item"><a class="new" href="/wiki/User:Fphat" title="Your user page (page does not exist) [.]" accesskey="."><span class="mw-ui-icon mw-ui-icon-userAvatar mw-ui-icon-wikimedia-userAvatar"></span> <span>Fphat</span></a></li><li id="pt-mytalk" class="new mw-list-item"><a href="/wiki/User_talk:Fphat" title="Your talk page (page does not exist) [n]" accesskey="n"><span class="mw-ui-icon mw-ui-icon-userTalk mw-ui-icon-wikimedia-userTalk"></span> <span>Talk</span></a></li><li id="pt-sandbox" class="new mw-list-item"><a href="/w/index.php?title=User:Fphat/sandbox&amp;action=edit&amp;redlink=1&amp;preload=Template%3AUser+sandbox%2Fpreload" title="Your sandbox (page does not exist)"><span class="mw-ui-icon mw-ui-icon-sandbox mw-ui-icon-wikimedia-sandbox"></span> <span>Sandbox</span></a></li><li id="pt-preferences" class="mw-list-item"><a href="/wiki/Special:Preferences" title="Your preferences"><span class="mw-ui-icon mw-ui-icon-settings mw-ui-icon-wikimedia-settings"></span> <span>Preferences</span></a></li><li id="pt-betafeatures" class="mw-list-item"><a href="/wiki/Special:Preferences#mw-prefsection-betafeatures" title="Beta features"><span class="mw-ui-icon mw-ui-icon-labFlask mw-ui-icon-wikimedia-labFlask"></span> <span>Beta</span></a></li><li id="pt-watchlist" class="user-links-collapsible-item mw-list-item"><a href="/wiki/Special:Watchlist" title="The list of pages you are monitoring for changes [L]" accesskey="L"><span class="mw-ui-icon mw-ui-icon-watchlist mw-ui-icon-wikimedia-watchlist"></span> <span>Watchlist</span></a></li><li id="pt-mycontris" class="mw-list-item"><a href="/wiki/Special:Contributions/Fphat" title="A list of your contributions [y]" accesskey="y"><span class="mw-ui-icon mw-ui-icon-userContributions mw-ui-icon-wikimedia-userContributions"></span> <span>Contributions</span></a></li></ul>
		
	</div>
</div>

<div id="p-user-menu-logout" class="vector-menu mw-portlet mw-portlet-user-menu-logout"  >
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="pt-logout" class="mw-list-item"><a data-mw="interface" href="/w/index.php?title=Special:UserLogout&amp;returnto=Main+Page" title="Log out"><span class="mw-ui-icon mw-ui-icon-logOut mw-ui-icon-wikimedia-logOut"></span> <span>Log out</span></a></li></ul>
		
	</div>
</div>

	
	</div>
</div>
</nav>

		</div>
	</header>
</div>
<div class="mw-page-container">
	<div class="mw-page-container-inner">
		<div class="vector-main-menu-container vector-sidebar-container-no-toc">
			<div id="mw-navigation">
				<nav id="mw-panel" class="vector-main-menu-landmark" aria-label="Site" role="navigation">
					<div id="vector-main-menu-pinned-container" class="vector-pinned-container">
				
<div id="vector-main-menu" class="vector-main-menu vector-pinnable-element">
	<div
	class="vector-pinnable-header vector-main-menu-pinnable-header vector-pinnable-header-pinned"
	data-feature-name="main-menu-pinned"
	data-pinnable-element-id="vector-main-menu"
	data-pinned-container-id="vector-main-menu-pinned-container"
	data-unpinned-container-id="vector-main-menu-unpinned-container"
>
	<div class="vector-pinnable-header-label">Main menu</div>
	<button class="vector-pinnable-header-toggle-button vector-pinnable-header-pin-button" data-event-name="pinnable-header.vector-main-menu.pin">move to sidebar</button>
	<button class="vector-pinnable-header-toggle-button vector-pinnable-header-unpin-button" data-event-name="pinnable-header.vector-main-menu.unpin">hide</button>
</div>

	
<div id="p-navigation" class="vector-menu mw-portlet mw-portlet-navigation"  >
	<div class="vector-menu-heading">
		Navigation
	</div>
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="n-mainpage-description" class="mw-list-item"><a href="/wiki/Main_Page" title="Visit the main page [z]" accesskey="z"><span>Main page</span></a></li><li id="n-contents" class="mw-list-item"><a href="/wiki/Wikipedia:Contents" title="Guides to browsing Wikipedia"><span>Contents</span></a></li><li id="n-currentevents" class="mw-list-item"><a href="/wiki/Portal:Current_events" title="Articles related to current events"><span>Current events</span></a></li><li id="n-randompage" class="mw-list-item"><a href="/wiki/Special:Random" title="Visit a randomly selected article [x]" accesskey="x"><span>Random article</span></a></li><li id="n-aboutsite" class="mw-list-item"><a href="/wiki/Wikipedia:About" title="Learn about Wikipedia and how it works"><span>About Wikipedia</span></a></li><li id="n-contactpage" class="mw-list-item"><a href="//en.wikipedia.org/wiki/Wikipedia:Contact_us" title="How to contact Wikipedia"><span>Contact us</span></a></li><li id="n-sitesupport" class="mw-list-item"><a href="https://donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wikipedia.org&amp;uselang=en" title="Support us by donating to the Wikimedia Foundation"><span>Donate</span></a></li></ul>
		
	</div>
</div>

	
<div class="vector-main-menu-action vector-main-menu-action-opt-out">
	<div class="vector-main-menu-action-item">
		
		<div class="vector-main-menu-action-content vector-menu-content">
			<a href="/w/index.php?title=Special:Preferences&amp;useskin=vector&amp;wprov=vctw1#mw-prefsection-rendering-skin" title="Change your settings to go back to the old look of the skin (legacy Vector)"><span>Switch to old look</span></a>
		</div>
	</div>
</div>

	
<div id="p-interaction" class="vector-menu mw-portlet mw-portlet-interaction"  >
	<div class="vector-menu-heading">
		Contribute
	</div>
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="n-help" class="mw-list-item"><a href="/wiki/Help:Contents" title="Guidance on how to use and edit Wikipedia"><span>Help</span></a></li><li id="n-introduction" class="mw-list-item"><a href="/wiki/Help:Introduction" title="Learn how to edit Wikipedia"><span>Learn to edit</span></a></li><li id="n-portal" class="mw-list-item"><a href="/wiki/Wikipedia:Community_portal" title="The hub for editors"><span>Community portal</span></a></li><li id="n-recentchanges" class="mw-list-item"><a href="/wiki/Special:RecentChanges" title="A list of recent changes to Wikipedia [r]" accesskey="r"><span>Recent changes</span></a></li><li id="n-upload" class="mw-list-item"><a href="/wiki/Wikipedia:File_upload_wizard" title="Add images or other media for use on Wikipedia"><span>Upload file</span></a></li></ul>
		
	</div>
</div>

	
</div>

					</div>
		</nav>
			</div>
		</div>
		<div class="vector-sitenotice-container">
			<div id="siteNotice"><!-- CentralNotice --></div>
		</div>
		<div class="mw-content-container">
			<main id="content" class="mw-body" role="main">
				<header class="mw-body-header vector-page-titlebar vector-page-titlebar-blank">
					<h1 id="firstHeading" class="firstHeading mw-first-heading" style="display: none"><span class="mw-page-title-main">Main Page</span></h1>
				
				
						<div class="mw-indicators">
		</div>
</header>
				<div class="vector-page-toolbar">
					<div class="vector-page-toolbar-container">
						<div id="left-navigation">
							<nav aria-label="Namespaces">
								
<div id="p-associated-pages" class="vector-menu vector-menu-tabs mw-portlet mw-portlet-associated-pages"  >
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list">
			<li id="ca-nstab-main" class="selected vector-tab-noicon mw-list-item"><a data-mw="interface" href="/wiki/Main_Page" title="View the content page [c]" accesskey="c" class=""><span>Main Page</span></a>
</li>
<li id="ca-talk" class="vector-tab-noicon mw-list-item"><a data-mw="interface" href="/wiki/Talk:Main_Page" rel="discussion" title="Discuss improvements to the content page [t]" accesskey="t" class=""><span>Talk</span></a>
</li>

		</ul>
		
	</div>
</div>

								

<div id="p-variants" class="vector-menu vector-dropdown vector-menu-dropdown mw-portlet mw-portlet-variants emptyPortlet"  >
	<input type="checkbox"
		id="p-variants-checkbox"
		role="button"
		aria-haspopup="true"
		data-event-name="ui.dropdown-p-variants"
		class="vector-menu-checkbox"
		aria-label="Change language variant"
		
		
	/>
	<label
		id="p-variants-label"
		for="p-variants-checkbox"
		class="vector-menu-heading "
		aria-hidden="true"
		
	>
		
		<span class="vector-menu-heading-label">English</span>
	</label>
	<div class="vector-menu-content vector-dropdown-content">

	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"></ul>
		
	</div>

	</div>
</div>
							</nav>
						</div>
						<div id="right-navigation" class="vector-collapsible">
							<nav aria-label="Views">
								
<div id="p-views" class="vector-menu vector-menu-tabs mw-portlet mw-portlet-views"  >
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list">
			<li id="ca-view" class="selected vector-tab-noicon mw-list-item"><a data-mw="interface" href="/wiki/Main_Page" class=""><span>Read</span></a>
</li>
<li id="ca-viewsource" class="vector-tab-noicon mw-list-item"><a data-mw="interface" href="/w/index.php?title=Main_Page&amp;action=edit" title="This page is protected.
You can view its source [e]" accesskey="e" class=""><span>View source</span></a>
</li>
<li id="ca-history" class="vector-tab-noicon mw-list-item"><a data-mw="interface" href="/w/index.php?title=Main_Page&amp;action=history" title="Past revisions of this page [h]" accesskey="h" class=""><span>View history</span></a>
</li>
<li id="ca-watch" class="mw-watchlink  mw-list-item"><a data-mw="interface" href="/w/index.php?title=Main_Page&amp;action=watch" class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-star mw-ui-icon-wikimedia-star mw-ui-icon-small" data-mw="interface" title="Add this page to your watchlist [w]" accesskey="w"><span>Watch</span></a>
</li>

		</ul>
		
	</div>
</div>

							</nav>
				
							<nav class="vector-page-tools-landmark" aria-label="More options">
								
<div id="vector-page-tools-dropdown" class="vector-menu vector-dropdown vector-menu-dropdown vector-page-tools-dropdown"  >
	<input type="checkbox"
		id="vector-page-tools-dropdown-checkbox"
		role="button"
		aria-haspopup="true"
		data-event-name="ui.dropdown-vector-page-tools-dropdown"
		class="vector-menu-checkbox "
		
		aria-label="Tools"
		
	/>
	<label
		id="vector-page-tools-dropdown-label"
		for="vector-page-tools-dropdown-checkbox"
		class="vector-menu-heading "
		aria-hidden="true"
		
	>
		
		<span class="vector-menu-heading-label">Tools</span>
	</label>
	<div class="vector-menu-content vector-dropdown-content">


									<div id="vector-page-tools-unpinned-container" class="vector-unpinned-container">
						
									</div>
				
	</div>
</div>
							</nav>
						</div>
					</div>
				</div>
				<div class="vector-column-end">
					<nav class="vector-page-tools-landmark vector-sticky-pinned-container" aria-label="More options">
						<div id="vector-page-tools-pinned-container" class="vector-pinned-container">
			
<div id="vector-page-tools" class="vector-page-tools vector-pinnable-element">
	<div
	class="vector-pinnable-header vector-page-tools-pinnable-header vector-pinnable-header-pinned"
	data-feature-name="page-tools-pinned"
	data-pinnable-element-id="vector-page-tools"
	data-pinned-container-id="vector-page-tools-pinned-container"
	data-unpinned-container-id="vector-page-tools-unpinned-container"
>
	<div class="vector-pinnable-header-label">Tools</div>
	<button class="vector-pinnable-header-toggle-button vector-pinnable-header-pin-button" data-event-name="pinnable-header.vector-page-tools.pin">move to sidebar</button>
	<button class="vector-pinnable-header-toggle-button vector-pinnable-header-unpin-button" data-event-name="pinnable-header.vector-page-tools.unpin">hide</button>
</div>

	
<div id="p-cactions" class="vector-menu mw-portlet mw-portlet-cactions emptyPortlet vector-has-collapsible-items"  title="More options" >
	<div class="vector-menu-heading">
		Actions
	</div>
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="ca-more-view" class="selected vector-more-collapsible-item mw-list-item"><a href="/wiki/Main_Page"><span>Read</span></a></li><li id="ca-more-viewsource" class="vector-more-collapsible-item mw-list-item"><a href="/w/index.php?title=Main_Page&amp;action=edit"><span>View source</span></a></li><li id="ca-more-history" class="vector-more-collapsible-item mw-list-item"><a href="/w/index.php?title=Main_Page&amp;action=history"><span>View history</span></a></li><li id="ca-more-watch" class="mw-watchlink vector-more-collapsible-item mw-list-item"><a href="/w/index.php?title=Main_Page&amp;action=watch" data-mw="interface"><span>Watch</span></a></li></ul>
		
	</div>
</div>

<div id="p-tb" class="vector-menu mw-portlet mw-portlet-tb"  >
	<div class="vector-menu-heading">
		General
	</div>
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="t-whatlinkshere" class="mw-list-item"><a href="/wiki/Special:WhatLinksHere/Main_Page" title="List of all English Wikipedia pages containing links to this page [j]" accesskey="j"><span>What links here</span></a></li><li id="t-recentchangeslinked" class="mw-list-item"><a href="/wiki/Special:RecentChangesLinked/Main_Page" rel="nofollow" title="Recent changes in pages linked from this page [k]" accesskey="k"><span>Related changes</span></a></li><li id="t-upload" class="mw-list-item"><a href="/wiki/Wikipedia:File_Upload_Wizard" title="Upload files [u]" accesskey="u"><span>Upload file</span></a></li><li id="t-specialpages" class="mw-list-item"><a href="/wiki/Special:SpecialPages" title="A list of all special pages [q]" accesskey="q"><span>Special pages</span></a></li><li id="t-permalink" class="mw-list-item"><a href="/w/index.php?title=Main_Page&amp;oldid=1114291180" title="Permanent link to this revision of this page"><span>Permanent link</span></a></li><li id="t-info" class="mw-list-item"><a href="/w/index.php?title=Main_Page&amp;action=info" title="More information about this page"><span>Page information</span></a></li><li id="t-cite" class="mw-list-item"><a href="/w/index.php?title=Special:CiteThisPage&amp;page=Main_Page&amp;id=1114291180&amp;wpFormIdentifier=titleform" title="Information on how to cite this page"><span>Cite this page</span></a></li><li id="t-wikibase" class="mw-list-item"><a href="https://www.wikidata.org/wiki/Special:EntityPage/Q5296" title="Structured data on this page hosted by Wikidata [g]" accesskey="g"><span>Wikidata item</span></a></li></ul>
		
	</div>
</div>

<div id="p-coll-print_export" class="vector-menu mw-portlet mw-portlet-coll-print_export"  >
	<div class="vector-menu-heading">
		Print/export
	</div>
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li id="coll-download-as-rl" class="mw-list-item"><a href="/w/index.php?title=Special:DownloadAsPdf&amp;page=Main_Page&amp;action=show-download-screen" title="Download this page as a PDF file"><span>Download as PDF</span></a></li><li id="t-print" class="mw-list-item"><a href="/w/index.php?title=Main_Page&amp;printable=yes" title="Printable version of this page [p]" accesskey="p"><span>Printable version</span></a></li></ul>
		
	</div>
</div>

<div id="p-wikibase-otherprojects" class="vector-menu mw-portlet mw-portlet-wikibase-otherprojects"  >
	<div class="vector-menu-heading">
		In other projects
	</div>
	<div class="vector-menu-content">
		
		<ul class="vector-menu-content-list"><li class="wb-otherproject-link wb-otherproject-commons mw-list-item"><a href="https://commons.wikimedia.org/wiki/Main_Page" hreflang="en"><span>Wikimedia Commons</span></a></li><li class="wb-otherproject-link wb-otherproject-mediawiki mw-list-item"><a href="https://www.mediawiki.org/wiki/MediaWiki" hreflang="en"><span>MediaWiki</span></a></li><li class="wb-otherproject-link wb-otherproject-meta mw-list-item"><a href="https://meta.wikimedia.org/wiki/Main_Page" hreflang="en"><span>Meta-Wiki</span></a></li><li class="wb-otherproject-link wb-otherproject-sources mw-list-item"><a href="https://wikisource.org/wiki/Main_Page" hreflang="en"><span>Multilingual Wikisource</span></a></li><li class="wb-otherproject-link wb-otherproject-species mw-list-item"><a href="https://species.wikimedia.org/wiki/Main_Page" hreflang="en"><span>Wikispecies</span></a></li><li class="wb-otherproject-link wb-otherproject-wikibooks mw-list-item"><a href="https://en.wikibooks.org/wiki/Main_Page" hreflang="en"><span>Wikibooks</span></a></li><li class="wb-otherproject-link wb-otherproject-wikidata mw-list-item"><a href="https://www.wikidata.org/wiki/Wikidata:Main_Page" hreflang="en"><span>Wikidata</span></a></li><li class="wb-otherproject-link wb-otherproject-wikimania badge-Q70893996 mw-list-item" title=""><a href="https://wikimania.wikimedia.org/wiki/Wikimania" hreflang="en"><span>Wikimania</span></a></li><li class="wb-otherproject-link wb-otherproject-wikinews mw-list-item"><a href="https://en.wikinews.org/wiki/Main_Page" hreflang="en"><span>Wikinews</span></a></li><li class="wb-otherproject-link wb-otherproject-wikiquote mw-list-item"><a href="https://en.wikiquote.org/wiki/Main_Page" hreflang="en"><span>Wikiquote</span></a></li><li class="wb-otherproject-link wb-otherproject-wikisource mw-list-item"><a href="https://en.wikisource.org/wiki/Main_Page" hreflang="en"><span>Wikisource</span></a></li><li class="wb-otherproject-link wb-otherproject-wikiversity mw-list-item"><a href="https://en.wikiversity.org/wiki/Wikiversity:Main_Page" hreflang="en"><span>Wikiversity</span></a></li><li class="wb-otherproject-link wb-otherproject-wikivoyage mw-list-item"><a href="https://en.wikivoyage.org/wiki/Main_Page" hreflang="en"><span>Wikivoyage</span></a></li><li class="wb-otherproject-link wb-otherproject-wiktionary mw-list-item"><a href="https://en.wiktionary.org/wiki/Wiktionary:Main_Page" hreflang="en"><span>Wiktionary</span></a></li></ul>
		
	</div>
</div>

</div>

						</div>
	</nav>
				</div>
				<div id="bodyContent" class="vector-body" aria-labelledby="firstHeading" data-mw-ve-target-container>
					<div class="vector-body-before-content">
					
						<div id="siteSub" class="noprint">From Wikipedia, the free encyclopedia</div>
					</div>
					<div id="contentSub"><div id="mw-content-subtitle"></div></div>
					
					
					<div id="mw-content-text" class="mw-body-content mw-content-ltr" lang="en" dir="ltr"><div class="mw-parser-output"><style data-mw-deduplicate="TemplateStyles:r1131603205">.mw-parser-output .mp-box{border:1px solid #aaa;padding:0 0.5em 0.5em;margin-top:4px}.mw-parser-output .mp-h2,body.skin-timeless .mw-parser-output .mp-h2{border:1px solid #aaa;margin:0.5em 0;padding:0.2em 0.4em;font-size:120%;font-weight:bold;font-family:inherit}.mw-parser-output .mp-later{font-size:85%;font-weight:normal}.mw-parser-output #mp-topbanner{background:#f9f9f9;border-color:#ddd}.mw-parser-output #mp-welcomecount{text-align:center;margin:0.4em}.mw-parser-output #mp-welcome{font-size:162%;padding:0.1em}.mw-parser-output #mp-welcome h1{font-size:inherit;font-family:inherit;display:inline;border:none}.mw-parser-output #mp-free{font-size:95%}.mw-parser-output #articlecount{font-size:85%}.mw-parser-output .mp-contains-float::after{content:"";display:block;clear:both}.mw-parser-output #mp-banner{background:#fffaf5;border-color:#f2e0ce}.mw-parser-output #mp-left{background:#f5fffa;border-color:#cef2e0}.mw-parser-output #mp-left .mp-h2{background:#cef2e0;border-color:#a3bfb1}.mw-parser-output #mp-right{background:#f5faff;border-color:#cedff2}.mw-parser-output #mp-right .mp-h2{background:#cedff2;border-color:#a3b0bf}.mw-parser-output #mp-middle{background:#fff5fa;border-color:#f2cedd}.mw-parser-output #mp-middle .mp-h2{background:#f2cedd;border-color:#bfa3af}.mw-parser-output #mp-lower{background:#faf5ff;border-color:#ddcef2}.mw-parser-output #mp-lower .mp-h2{background:#ddcef2;border-color:#afa3bf}.mw-parser-output #mp-bottom{border-color:#e2e2e2}.mw-parser-output #mp-bottom .mp-h2{background:#eee;border-color:#ddd}@media(max-width:875px){.mw-parser-output #mp-tfp table,.mw-parser-output #mp-tfp tr,.mw-parser-output #mp-tfp td,.mw-parser-output #mp-tfp tbody{display:block!important;width:100%!important;box-sizing:border-box}.mw-parser-output #mp-tfp tr:first-child td:first-child a{text-align:center;display:table;margin:0 auto}}@media(min-width:875px){.mw-parser-output #mp-upper{display:flex}.mw-parser-output #mp-left{flex:1 1 55%;margin-right:2px}.mw-parser-output #mp-right{flex:1 1 45%;margin-left:2px}}</style>
<div id="mp-topbanner" class="mp-box">
<div id="mp-welcomecount">
<div id="mp-welcome"><h1><span class="mw-headline" id="Welcome_to_Wikipedia">Welcome to <a href="/wiki/Wikipedia" title="Wikipedia">Wikipedia</a></span></h1>,</div>
<div id="mp-free">the <a href="/wiki/Free_content" title="Free content">free</a> <a href="/wiki/Encyclopedia" title="Encyclopedia">encyclopedia</a> that <a href="/wiki/Help:Introduction_to_Wikipedia" title="Help:Introduction to Wikipedia">anyone can edit</a>.</div>
<div id="articlecount"><a href="/wiki/Special:Statistics" title="Special:Statistics">6,649,984</a> articles in <a href="/wiki/English_language" title="English language">English</a></div>
</div>
</div>
<div id="mp-upper">
<div id="mp-left" class="MainPageBG mp-box">
<h2 id="mp-tfa-h2" class="mp-h2"><span id="From_today.27s_featured_article"></span><span class="mw-headline" id="From_today's_featured_article">From today's featured article</span></h2>
<div id="mp-tfa" class="mp-contains-float"><div id="mp-tfa-img" style="float: left; margin: 0.5em 0.9em 0.4em 0em;">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 171px;">
<a href="/wiki/File:Weymouth_Harbour_and_Bay.jpg" class="image" title="Weymouth Harbour and Bay"><img alt="Weymouth Harbour and Bay" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/42/Weymouth_Harbour_and_Bay.jpg/171px-Weymouth_Harbour_and_Bay.jpg" decoding="async" width="171" height="114" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/42/Weymouth_Harbour_and_Bay.jpg/257px-Weymouth_Harbour_and_Bay.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/42/Weymouth_Harbour_and_Bay.jpg/342px-Weymouth_Harbour_and_Bay.jpg 2x" data-file-width="850" data-file-height="567" /></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;">Weymouth Harbour and Bay</div></div>
</div>
<p><b><a href="/wiki/Weymouth,_Dorset" title="Weymouth, Dorset">Weymouth</a></b> is a seaside town in <a href="/wiki/Dorset" title="Dorset">Dorset</a>, England, on the <a href="/wiki/English_Channel" title="English Channel">English Channel</a>. Situated on a sheltered bay at the mouth of the <a href="/wiki/River_Wey,_Dorset" title="River Wey, Dorset">River Wey</a>, the town had a population of 53,427 in 2021, the third-largest in Dorset. The town had roles in the spread of the <a href="/wiki/Black_Death" title="Black Death">Black Death</a>, the <a href="/wiki/British_colonization_of_the_Americas" title="British colonization of the Americas">settlement of the Americas</a> and the development of <a href="/wiki/Georgian_architecture" title="Georgian architecture">Georgian architecture</a>. It was also a major departure point for the <a href="/wiki/Normandy_landings" title="Normandy landings">Normandy landings</a> during World War&#160;II. Since 2019, the area has been governed by <a href="/wiki/Dorset_Council_(UK)" title="Dorset Council (UK)">Dorset Council</a>. Weymouth's economy depends on tourism. Visitors are attracted by <a href="/wiki/Weymouth_Harbour,_Dorset" title="Weymouth Harbour, Dorset">its harbour</a> <i>(pictured)</i> and position, approximately halfway along the <a href="/wiki/Jurassic_Coast" title="Jurassic Coast">Jurassic Coast</a>. Once a port for cross-channel ferries, Weymouth Harbour is now home to a commercial fishing fleet, pleasure boats and private yachts, while nearby <a href="/wiki/Portland_Harbour" title="Portland Harbour">Portland Harbour</a> is the location of the <a href="/wiki/Weymouth_and_Portland_National_Sailing_Academy" title="Weymouth and Portland National Sailing Academy">Weymouth and Portland National Sailing Academy</a>, where <a href="/wiki/Sailing_at_the_2012_Summer_Olympics" title="Sailing at the 2012 Summer Olympics">the sailing events</a> of the <a href="/wiki/2012_Summer_Olympics" title="2012 Summer Olympics">2012 Summer Olympics</a> and <a href="/wiki/2012_Summer_Paralympics" title="2012 Summer Paralympics">Paralympics</a> were held. (<b><a href="/wiki/Weymouth,_Dorset" title="Weymouth, Dorset">Full&#160;article...</a></b>)
</p>
<div class="tfa-recent" style="text-align: right;">
Recently featured: <style data-mw-deduplicate="TemplateStyles:r1129693374">.mw-parser-output .hlist dl,.mw-parser-output .hlist ol,.mw-parser-output .hlist ul{margin:0;padding:0}.mw-parser-output .hlist dd,.mw-parser-output .hlist dt,.mw-parser-output .hlist li{margin:0;display:inline}.mw-parser-output .hlist.inline,.mw-parser-output .hlist.inline dl,.mw-parser-output .hlist.inline ol,.mw-parser-output .hlist.inline ul,.mw-parser-output .hlist dl dl,.mw-parser-output .hlist dl ol,.mw-parser-output .hlist dl ul,.mw-parser-output .hlist ol dl,.mw-parser-output .hlist ol ol,.mw-parser-output .hlist ol ul,.mw-parser-output .hlist ul dl,.mw-parser-output .hlist ul ol,.mw-parser-output .hlist ul ul{display:inline}.mw-parser-output .hlist .mw-empty-li{display:none}.mw-parser-output .hlist dt::after{content:": "}.mw-parser-output .hlist dd::after,.mw-parser-output .hlist li::after{content:" · ";font-weight:bold}.mw-parser-output .hlist dd:last-child::after,.mw-parser-output .hlist dt:last-child::after,.mw-parser-output .hlist li:last-child::after{content:none}.mw-parser-output .hlist dd dd:first-child::before,.mw-parser-output .hlist dd dt:first-child::before,.mw-parser-output .hlist dd li:first-child::before,.mw-parser-output .hlist dt dd:first-child::before,.mw-parser-output .hlist dt dt:first-child::before,.mw-parser-output .hlist dt li:first-child::before,.mw-parser-output .hlist li dd:first-child::before,.mw-parser-output .hlist li dt:first-child::before,.mw-parser-output .hlist li li:first-child::before{content:" (";font-weight:normal}.mw-parser-output .hlist dd dd:last-child::after,.mw-parser-output .hlist dd dt:last-child::after,.mw-parser-output .hlist dd li:last-child::after,.mw-parser-output .hlist dt dd:last-child::after,.mw-parser-output .hlist dt dt:last-child::after,.mw-parser-output .hlist dt li:last-child::after,.mw-parser-output .hlist li dd:last-child::after,.mw-parser-output .hlist li dt:last-child::after,.mw-parser-output .hlist li li:last-child::after{content:")";font-weight:normal}.mw-parser-output .hlist ol{counter-reset:listitem}.mw-parser-output .hlist ol>li{counter-increment:listitem}.mw-parser-output .hlist ol>li::before{content:" "counter(listitem)"\a0 "}.mw-parser-output .hlist dd ol>li:first-child::before,.mw-parser-output .hlist dt ol>li:first-child::before,.mw-parser-output .hlist li ol>li:first-child::before{content:" ("counter(listitem)"\a0 "}</style><div class="hlist inline">
<ul><li><i><a href="/wiki/High_School_Musical:_The_Musical:_The_Series" title="High School Musical: The Musical: The Series">High School Musical: The Musical: The Series</a></i></li>
<li><a href="/wiki/Yugoslav_destroyer_Beograd" title="Yugoslav destroyer Beograd">Yugoslav destroyer <i>Beograd</i></a></li>
<li><a href="/wiki/Bacteria" title="Bacteria">Bacteria</a></li></ul>
</div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist tfa-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Today%27s_featured_article/April_2023" title="Wikipedia:Today&#39;s featured article/April 2023">Archive</a></b></li>
<li><b><a href="https://lists.wikimedia.org/postorius/lists/daily-article-l.lists.wikimedia.org/" class="extiw" title="mail:daily-article-l">By email</a></b></li>
<li><b><a href="/wiki/Wikipedia:Featured_articles" title="Wikipedia:Featured articles">More featured articles</a></b></li>
<li><b><a href="/wiki/Wikipedia:About_Today%27s_featured_article" title="Wikipedia:About Today&#39;s featured article">About</a></b></li></ul>
</div></div>
<h2 id="mp-dyk-h2" class="mp-h2"><span class="mw-headline" id="Did_you_know_...">Did you know&#160;...</span></h2>
<div id="mp-dyk" class="mp-contains-float">
<div class="dyk-img" style="float: right; margin-left: 0.5em;">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 100px;">
<a href="/wiki/File:Rutherford%27s_Monument.jpg" class="image" title="Rutherford&#39;s Monument"><img alt="Rutherford&#39;s Monument" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/42/Rutherford%27s_Monument.jpg/100px-Rutherford%27s_Monument.jpg" decoding="async" width="100" height="178" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/42/Rutherford%27s_Monument.jpg/150px-Rutherford%27s_Monument.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/42/Rutherford%27s_Monument.jpg/200px-Rutherford%27s_Monument.jpg 2x" data-file-width="3096" data-file-height="5504" /></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;">Rutherford's Monument</div></div>
</div>
<ul><li>... that the <b><a href="/wiki/Rutherford%27s_Monument" title="Rutherford&#39;s Monument">56-foot-tall (17&#160;m) monument</a></b> <i>(pictured)</i> to the theologian <a href="/wiki/Samuel_Rutherford" title="Samuel Rutherford">Samuel Rutherford</a> near <a href="/wiki/Anwoth_Old_Church" title="Anwoth Old Church">his parish church</a> in <a href="/wiki/Anwoth" title="Anwoth">Anwoth</a> was badly damaged by a lightning strike five years after its construction?</li>
<li>... that <b><a href="/wiki/Americano_Media" title="Americano Media">Americano Media</a></b> wants to be "<a href="/wiki/Fox_News" title="Fox News">Fox News</a> in Spanish"?</li>
<li>... that <a href="/wiki/Joanna_Cherry" title="Joanna Cherry">Joanna Cherry</a> showed a printed copy of an Internet meme featuring <b><a href="/wiki/Lily_Hoshikawa" title="Lily Hoshikawa">Lily Hoshikawa</a></b> during a <a href="/wiki/Parliament_of_the_United_Kingdom" title="Parliament of the United Kingdom">UK parliamentary</a> committee meeting?</li>
<li>... that 47-year-old Turkish para-karateka <b><a href="/wiki/Oya_Ekici" title="Oya Ekici">Oya Ekici</a></b> won the bronze medal at the <a href="/wiki/2022_European_Karate_Championships" title="2022 European Karate Championships">2022 European Championships</a>?</li>
<li>... that producers of <i><a href="/wiki/The_Simpsons" title="The Simpsons">The Simpsons</a></i> have spoken about the importance of <b><a href="/wiki/List_of_LGBT_characters_in_The_Simpsons" title="List of LGBT characters in The Simpsons">its LGBT characters</a></b> in representation?</li>
<li>... that <b><a href="/wiki/HMS_Martin_(1910)" title="HMS Martin (1910)">HMS&#160;<i>Martin</i></a></b> was part of the <a href="/wiki/Grand_Fleet" title="Grand Fleet">Grand Fleet</a> of the <a href="/wiki/Royal_Navy" title="Royal Navy">Royal Navy</a> in the First World War, but after the war was sold to be <a href="/wiki/Ship_breaking" title="Ship breaking">broken up</a>?</li>
<li>... that the saying "<b><a href="/wiki/Give_me_the_man_and_I_will_give_you_the_case_against_him" title="Give me the man and I will give you the case against him">give me the man and I will give you the case against him</a></b>" is usually attributed to Soviet-era public figures such as <a href="/wiki/Lavrentiy_Beria" title="Lavrentiy Beria">Beria</a> or <a href="/wiki/Andrey_Vyshinsky" title="Andrey Vyshinsky">Vyshinsky</a>?</li>
<li>... that <a href="/wiki/Ice_Spice" title="Ice Spice">Ice Spice</a> is <b><a href="/wiki/Princess_Diana_(song)" title="Princess Diana (song)">Princess Diana</a></b>?</li></ul>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist dyk-footer noprint" style="margin-top: 0.5em; text-align: right;">
<ul><li><b><a href="/wiki/Wikipedia:Recent_additions" title="Wikipedia:Recent additions">Archive</a></b></li>
<li><b><a href="/wiki/Help:Your_first_article" title="Help:Your first article">Start a new article</a></b></li>
<li><b><a href="/wiki/Template_talk:Did_you_know" title="Template talk:Did you know">Nominate an article</a></b></li></ul>
</div>
</div>
</div>
<div id="mp-right" class="MainPageBG mp-box">
<h2 id="mp-itn-h2" class="mp-h2"><span class="mw-headline" id="In_the_news">In the news</span></h2>
<div id="mp-itn" class="mp-contains-float"><style data-mw-deduplicate="TemplateStyles:r1053378754">.mw-parser-output .itn-img{float:right;margin-left:0.5em;margin-top:0.2em}</style><div role="figure" class="itn-img">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 136px;">
<a href="/wiki/File:Kelvin_Kiptum_(KEN)_2023.jpg" class="image" title="Kelvin Kiptum"><img alt="Kelvin Kiptum" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Kelvin_Kiptum_%28KEN%29_2023.jpg/136px-Kelvin_Kiptum_%28KEN%29_2023.jpg" decoding="async" width="136" height="144" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Kelvin_Kiptum_%28KEN%29_2023.jpg/204px-Kelvin_Kiptum_%28KEN%29_2023.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Kelvin_Kiptum_%28KEN%29_2023.jpg/272px-Kelvin_Kiptum_%28KEN%29_2023.jpg 2x" data-file-width="808" data-file-height="858" /></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word; text-align: left;">Kelvin Kiptum</div></div>
</div>
<ul><li>In Kenya, at least 109 people are found in <a href="/wiki/Mass_grave" title="Mass grave">mass graves</a> and more than 400 others are missing after the leader of <b><a href="/wiki/Malindi_cult" title="Malindi cult">a cult</a></b> allegedly instructed members to starve themselves.</li>
<li>In <b><a href="/wiki/2023_London_Marathon" title="2023 London Marathon">the London Marathon</a></b>, <a href="/wiki/Sifan_Hassan" title="Sifan Hassan">Sifan Hassan</a> wins the women's race, while <a href="/wiki/Kelvin_Kiptum" title="Kelvin Kiptum">Kelvin Kiptum</a> <i>(pictured)</i> wins the men's event and breaks the course record.</li>
<li>The wreckage of the <i><b><a href="/wiki/Montevideo_Maru" title="Montevideo Maru">Montevideo Maru</a></b></i>, a Japanese vessel sunk by the US during World War&#160;II with over 1,000 captive Australian nationals onboard, is discovered in the <a href="/wiki/South_China_Sea" title="South China Sea">South China Sea</a>.</li></ul>
<div class="itn-footer" style="margin-top: 0.5em;">
<div><b><a href="/wiki/Portal:Current_events" title="Portal:Current events">Ongoing</a></b>: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist inline">
<ul><li><a href="/wiki/2023_Israeli_judicial_reform_protests" title="2023 Israeli judicial reform protests">Israeli judicial reform protests</a></li>
<li><a href="/wiki/Russian_invasion_of_Ukraine" title="Russian invasion of Ukraine">Russian invasion of Ukraine</a></li>
<li><a href="/wiki/2023_Sudan_conflict" title="2023 Sudan conflict">Sudan conflict</a></li></ul></div></div>
<div><b><a href="/wiki/Deaths_in_2023" title="Deaths in 2023">Recent deaths</a></b>&#58; <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist inline">
<ul><li><a href="/wiki/Tarek_Fatah" title="Tarek Fatah">Tarek Fatah</a></li>
<li><a href="/wiki/Jerry_Springer" title="Jerry Springer">Jerry Springer</a></li>
<li><a href="/wiki/Rambahadur_Limbu" title="Rambahadur Limbu">Rambahadur Limbu</a></li>
<li><a href="/wiki/Emily_Meggett" title="Emily Meggett">Emily Meggett</a></li>
<li><a href="/wiki/Enver_Baig" title="Enver Baig">Enver Baig</a></li>
<li><a href="/wiki/Sergio_Rendine" title="Sergio Rendine">Sergio Rendine</a></li></ul></div></div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist itn-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:In_the_news/Candidates" title="Wikipedia:In the news/Candidates">Nominate an article</a></b></li></ul>
</div></div>
<h2 id="mp-otd-h2" class="mp-h2"><span class="mw-headline" id="On_this_day">On this day</span></h2>
<div id="mp-otd" class="mp-contains-float">
<p><b><a href="/wiki/April_30" title="April 30">April 30</a></b>
</p>
<div style="float:right;margin-left:0.5em;" id="mp-otd-img">
<div class="thumbinner mp-thumb" style="background: transparent; border: none; padding: 0; max-width: 162px;">
<a href="/wiki/File:Evacuees_offloaded_onto_the_USS_Midway.jpg" class="image" title="Evacuees on the USS Midway"><img alt="Evacuees on the USS Midway" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Evacuees_offloaded_onto_the_USS_Midway.jpg/162px-Evacuees_offloaded_onto_the_USS_Midway.jpg" decoding="async" width="162" height="122" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Evacuees_offloaded_onto_the_USS_Midway.jpg/243px-Evacuees_offloaded_onto_the_USS_Midway.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Evacuees_offloaded_onto_the_USS_Midway.jpg/324px-Evacuees_offloaded_onto_the_USS_Midway.jpg 2x" data-file-width="800" data-file-height="600" /></a><div class="thumbcaption" style="padding: 0.25em 0; word-wrap: break-word;">Evacuees on the USS <i>Midway</i></div></div>
</div>
<ul><li><a href="/wiki/AD_311" title="AD 311">311</a> – The <b><a href="/wiki/Diocletianic_Persecution" title="Diocletianic Persecution">Diocletianic Persecution</a></b> of Christians officially ended in the eastern <a href="/wiki/Roman_Empire" title="Roman Empire">Roman Empire</a>.</li>
<li><a href="/wiki/1943" title="1943">1943</a> – <a href="/wiki/World_War_II" title="World War II">Second World War</a>: The <a href="/wiki/Royal_Navy" title="Royal Navy">Royal Navy</a> submarine <a href="/wiki/HMS_Seraph_(P219)" title="HMS Seraph (P219)">HMS&#160;<i>Seraph</i></a> began <b><a href="/wiki/Operation_Mincemeat" title="Operation Mincemeat">Operation Mincemeat</a></b> to deceive Germany about the upcoming <a href="/wiki/Allied_invasion_of_Sicily" title="Allied invasion of Sicily">invasion of Sicily</a>.</li>
<li><a href="/wiki/1963" title="1963">1963</a> – A refusal by the <a href="/wiki/Bristol_Omnibus_Company" title="Bristol Omnibus Company">Bristol Omnibus Company</a> and the <a href="/wiki/Transport_and_General_Workers%27_Union" title="Transport and General Workers&#39; Union">Transport and General Workers' Union</a> to permit the employment of black bus crews led to <b><a href="/wiki/Bristol_Bus_Boycott" title="Bristol Bus Boycott">a bus boycott</a></b> in <a href="/wiki/Bristol" title="Bristol">Bristol</a>, England.</li>
<li><a href="/wiki/1975" title="1975">1975</a> – American forces completed <b><a href="/wiki/Operation_Frequent_Wind" title="Operation Frequent Wind">a helicopter evacuation</a></b> <i>(aircraft and evacuees pictured)</i> of U.S. citizens, <a href="/wiki/South_Vietnam" title="South Vietnam">South Vietnamese</a> civilians and others from <a href="/wiki/Ho_Chi_Minh_City" title="Ho Chi Minh City">Saigon</a>, just before <a href="/wiki/North_Vietnam" title="North Vietnam">North Vietnamese</a> troops <b><a href="/wiki/Fall_of_Saigon" title="Fall of Saigon">captured the city</a></b>,  ending the <a href="/wiki/Vietnam_War" title="Vietnam War">Vietnam War</a>.</li>
<li><a href="/wiki/2021" title="2021">2021</a> – <b><a href="/wiki/2021_Meron_crowd_crush" title="2021 Meron crowd crush">A crowd crush</a></b> during <a href="/wiki/Hillula_of_Rabbi_Shimon_bar_Yochai" title="Hillula of Rabbi Shimon bar Yochai">the annual pilgrimage</a> to the <a href="/wiki/Tomb_of_Rabbi_Shimon_bar_Yochai" title="Tomb of Rabbi Shimon bar Yochai">tomb of Rabbi Shimon bar Yochai</a> in Israel, killed 45 people.</li></ul>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist" style="margin-top: 0.5em;"><ul><li><b><a href="/wiki/Marie_of_the_Incarnation_(Ursuline)" title="Marie of the Incarnation (Ursuline)">Marie of the Incarnation</a></b>  (<abbr title="died">d.</abbr>&#160;1672)</li><li><b><a href="/wiki/Emily_Stowe" title="Emily Stowe">Emily Stowe</a></b>  (<abbr title="died">d.</abbr>&#160;1903)</li><li><b><a href="/wiki/Kirsten_Dunst" title="Kirsten Dunst">Kirsten Dunst</a></b>  (<abbr title="born">b.</abbr>&#160;1982)</li></ul></div>
<div style="margin-top:0.5em;">
More anniversaries: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist inline nowraplinks">
<ul><li><a href="/wiki/April_29" title="April 29">April 29</a></li>
<li><b><a href="/wiki/April_30" title="April 30">April 30</a></b></li>
<li><a href="/wiki/May_1" title="May 1">May 1</a></li></ul>
</div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist otd-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Selected_anniversaries/April" title="Wikipedia:Selected anniversaries/April">Archive</a></b></li>
<li><b><a href="https://lists.wikimedia.org/postorius/lists/daily-article-l.lists.wikimedia.org/" class="extiw" title="mail:daily-article-l">By email</a></b></li>
<li><b><a href="/wiki/List_of_days_of_the_year" title="List of days of the year">List of days of the year</a></b></li></ul>
</div></div>
</div>
</div>
<div id="mp-lower" class="MainPageBG mp-box">
<h2 id="mp-tfp-h2" class="mp-h2"><span id="Today.27s_featured_picture"></span><span class="mw-headline" id="Today's_featured_picture">Today's featured picture</span></h2>
<div id="mp-tfp">
<table role="presentation" style="margin:0 3px 3px; width:100%; box-sizing:border-box; text-align:left; background-color:transparent; border-collapse:collapse;">
<tbody><tr>
<td style="padding:0 0.9em 0 0; width:350px;"><a href="/wiki/File:Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_(edit).jpg" class="image" title="Street Musicians at the Door"><img alt="Street Musicians at the Door" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_%28edit%29.jpg/350px-Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_%28edit%29.jpg" decoding="async" width="350" height="441" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_%28edit%29.jpg/525px-Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_%28edit%29.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_%28edit%29.jpg/700px-Street_Musicians_at_the_Door_-_Jacob_Octhtervelt_%28edit%29.jpg 2x" data-file-width="6356" data-file-height="8000" /></a>
</td>
<td style="padding:0 6px 0 0">
<p><i><b><a href="/wiki/Street_Musicians_at_the_Door" title="Street Musicians at the Door">Street Musicians at the Door</a></b></i> is an <a href="/wiki/Oil_painting" title="Oil painting">oil-on-canvas painting</a> by the <a href="/wiki/Dutch_Golden_Age" title="Dutch Golden Age">Dutch Golden Age</a> artist <a href="/wiki/Jacob_Ochtervelt" title="Jacob Ochtervelt">Jacob Ochtervelt</a>, painted in <a href="/wiki/Rotterdam" title="Rotterdam">Rotterdam</a> in 1665. It depicts a mother, child and maid from a wealthy family interacting with two musicians at the door of their house. The musicians are playing a <a href="/wiki/Violin" title="Violin">violin</a> and a <a href="/wiki/Hurdy-gurdy" title="Hurdy-gurdy">hurdy-gurdy</a>. It is an example of an "entrance hall painting", a genre pioneered by Ochtervelt. The work is now in the collection of the <a href="/wiki/Saint_Louis_Art_Museum" title="Saint Louis Art Museum">Saint Louis Art Museum</a> in <a href="/wiki/St._Louis" title="St. Louis">St.&#160;Louis</a>, Missouri.
</p>
<p style="text-align:left;"><small>Painting credit: <a href="/wiki/Jacob_Ochtervelt" title="Jacob Ochtervelt">Jacob Ochtervelt</a></small></p>
<div class="potd-recent" style="text-align:right;">
Recently featured: <link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist inline">
<ul><li><a href="/wiki/Template:POTD/2023-04-29" title="Template:POTD/2023-04-29">Chalkhill blue</a></li>
<li><a href="/wiki/Template:POTD/2023-04-28" title="Template:POTD/2023-04-28">Gabrielle Ray</a></li>
<li><a href="/wiki/Template:POTD/2023-04-27" title="Template:POTD/2023-04-27">Monsoon of South Asia</a></li></ul>
</div></div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist potd-footer noprint" style="text-align:right;">
<ul><li><b><a href="/wiki/Wikipedia:Picture_of_the_day/Archive" title="Wikipedia:Picture of the day/Archive">Archive</a></b></li>
<li><b><a href="/wiki/Wikipedia:Featured_pictures" title="Wikipedia:Featured pictures">More featured pictures</a></b></li></ul>
</div>
</td></tr></tbody></table></div>
</div>
<div id="mp-bottom" class="mp-box">
<h2 id="mp-other" class="mp-h2"><span class="mw-headline" id="Other_areas_of_Wikipedia">Other areas of Wikipedia</span></h2>
<div id="mp-other-content">
<ul><li><b><a href="/wiki/Wikipedia:Community_portal" title="Wikipedia:Community portal">Community portal</a></b> – The central hub for editors, with resources, links, tasks, and announcements.</li>
<li><b><a href="/wiki/Wikipedia:Village_pump" title="Wikipedia:Village pump">Village pump</a></b> – Forum for discussions about Wikipedia itself, including policies and technical issues.</li>
<li><b><a href="/wiki/Wikipedia:News" title="Wikipedia:News">Site news</a></b> – Sources of news about Wikipedia and the broader Wikimedia movement.</li>
<li><b><a href="/wiki/Wikipedia:Teahouse" title="Wikipedia:Teahouse">Teahouse</a></b> – Ask basic questions about using or editing Wikipedia.</li>
<li><b><a href="/wiki/Wikipedia:Help_desk" title="Wikipedia:Help desk">Help desk</a></b> – Ask questions about using or editing Wikipedia.</li>
<li><b><a href="/wiki/Wikipedia:Reference_desk" title="Wikipedia:Reference desk">Reference desk</a></b> – Ask research questions about encyclopedic topics.</li>
<li><b><a href="/wiki/Wikipedia:Contents/Portals" title="Wikipedia:Contents/Portals">Content portals</a></b> – A unique way to navigate the encyclopedia.</li></ul>
</div>
<h2 id="mp-sister" class="mp-h2"><span id="Wikipedia.27s_sister_projects"></span><span class="mw-headline" id="Wikipedia's_sister_projects">Wikipedia's sister projects</span></h2>
<div id="mp-sister-content"><style data-mw-deduplicate="TemplateStyles:r1007624485">.mw-parser-output #sister-projects-list{display:flex;flex-wrap:wrap}.mw-parser-output #sister-projects-list li{display:inline-block}.mw-parser-output #sister-projects-list li span{font-weight:bold}.mw-parser-output #sister-projects-list li>div{display:inline-block;vertical-align:middle;padding:6px 4px}.mw-parser-output #sister-projects-list li>div:first-child{text-align:center}@media(min-width:360px){.mw-parser-output #sister-projects-list li{width:33%;min-width:20em;white-space:nowrap;flex:1 0 25%}.mw-parser-output #sister-projects-list li>div:first-child{min-width:50px}}</style>
<p>Wikipedia is written by volunteer editors and hosted by the <a href="/wiki/Wikimedia_Foundation" title="Wikimedia Foundation">Wikimedia Foundation</a>, a non-profit organization that also hosts a range of other volunteer <a href="https://wikimediafoundation.org/our-work/wikimedia-projects/" class="extiw" title="foundationsite:our-work/wikimedia-projects/">projects</a>:
</p>
<style data-mw-deduplicate="TemplateStyles:r1126788409">.mw-parser-output .plainlist ol,.mw-parser-output .plainlist ul{line-height:inherit;list-style:none;margin:0;padding:0}.mw-parser-output .plainlist ol li,.mw-parser-output .plainlist ul li{margin-bottom:0}</style><div class="plainlist">
<ul id="sister-projects-list">
<li>
  <div><a href="https://commons.wikimedia.org/wiki/" title="Commons"><img alt="Commons logo" src="//upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/31px-Commons-logo.svg.png" decoding="async" width="31" height="42" srcset="//upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/47px-Commons-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/4/4a/Commons-logo.svg/62px-Commons-logo.svg.png 2x" data-file-width="1024" data-file-height="1376" /></a></div>
  <div><span><a href="https://commons.wikimedia.org/wiki/" class="extiw" title="c:">Commons</a></span><br />Free media repository</div>
</li>
<li>
  <div><a href="https://www.mediawiki.org/wiki/" title="MediaWiki"><img alt="MediaWiki logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/MediaWiki-2020-icon.svg/35px-MediaWiki-2020-icon.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a6/MediaWiki-2020-icon.svg/53px-MediaWiki-2020-icon.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a6/MediaWiki-2020-icon.svg/70px-MediaWiki-2020-icon.svg.png 2x" data-file-width="100" data-file-height="100" /></a></div>
  <div><span><a href="https://www.mediawiki.org/wiki/" class="extiw" title="mw:">MediaWiki</a></span><br />Wiki software development</div>
</li>
<li>
  <div><a href="https://meta.wikimedia.org/wiki/" title="Meta-Wiki"><img alt="Meta-Wiki logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/35px-Wikimedia_Community_Logo.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/53px-Wikimedia_Community_Logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/75/Wikimedia_Community_Logo.svg/70px-Wikimedia_Community_Logo.svg.png 2x" data-file-width="900" data-file-height="900" /></a></div>
  <div><span><a href="https://meta.wikimedia.org/wiki/" class="extiw" title="m:">Meta-Wiki</a></span><br />Wikimedia project coordination</div>
</li>
<li>
  <div><a href="https://en.wikibooks.org/wiki/" title="Wikibooks"><img alt="Wikibooks logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/35px-Wikibooks-logo.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/53px-Wikibooks-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikibooks-logo.svg/70px-Wikibooks-logo.svg.png 2x" data-file-width="300" data-file-height="300" /></a></div>
  <div><span><a href="https://en.wikibooks.org/wiki/" class="extiw" title="b:">Wikibooks</a></span><br />Free textbooks and manuals</div>
</li>
<li>
  <div><a href="https://www.wikidata.org/wiki/" title="Wikidata"><img alt="Wikidata logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/47px-Wikidata-logo.svg.png" decoding="async" width="47" height="26" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/71px-Wikidata-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Wikidata-logo.svg/94px-Wikidata-logo.svg.png 2x" data-file-width="1050" data-file-height="590" /></a></div>
  <div><span><a href="https://www.wikidata.org/wiki/" class="extiw" title="d:">Wikidata</a></span><br />Free knowledge base</div>
</li>
<li>
  <div><a href="https://en.wikinews.org/wiki/" title="Wikinews"><img alt="Wikinews logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/51px-Wikinews-logo.svg.png" decoding="async" width="51" height="28" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/77px-Wikinews-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/24/Wikinews-logo.svg/102px-Wikinews-logo.svg.png 2x" data-file-width="759" data-file-height="415" /></a></div>
  <div><span><a href="https://en.wikinews.org/wiki/" class="extiw" title="n:">Wikinews</a></span><br />Free-content news</div>
</li>
<li>
  <div><a href="https://en.wikiquote.org/wiki/" title="Wikiquote"><img alt="Wikiquote logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/35px-Wikiquote-logo.svg.png" decoding="async" width="35" height="41" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/53px-Wikiquote-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Wikiquote-logo.svg/70px-Wikiquote-logo.svg.png 2x" data-file-width="300" data-file-height="355" /></a></div>
  <div><span><a href="https://en.wikiquote.org/wiki/" class="extiw" title="q:">Wikiquote</a></span><br />Collection of quotations</div>
</li>
<li>
  <div><a href="https://en.wikisource.org/wiki/" title="Wikisource"><img alt="Wikisource logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/35px-Wikisource-logo.svg.png" decoding="async" width="35" height="37" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/53px-Wikisource-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Wikisource-logo.svg/70px-Wikisource-logo.svg.png 2x" data-file-width="410" data-file-height="430" /></a></div>
  <div><span><a href="https://en.wikisource.org/wiki/" class="extiw" title="s:">Wikisource</a></span><br />Free-content library</div>
</li>
<li>
  <div><a href="https://species.wikimedia.org/wiki/" title="Wikispecies"><img alt="Wikispecies logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/35px-Wikispecies-logo.svg.png" decoding="async" width="35" height="41" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/53px-Wikispecies-logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/df/Wikispecies-logo.svg/70px-Wikispecies-logo.svg.png 2x" data-file-width="941" data-file-height="1103" /></a></div>
  <div><span><a href="https://species.wikimedia.org/wiki/" class="extiw" title="species:">Wikispecies</a></span><br />Directory of species</div>
</li>
<li>
  <div><a href="https://en.wikiversity.org/wiki/" title="Wikiversity"><img alt="Wikiversity logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Wikiversity_logo_2017.svg/41px-Wikiversity_logo_2017.svg.png" decoding="async" width="41" height="34" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Wikiversity_logo_2017.svg/62px-Wikiversity_logo_2017.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Wikiversity_logo_2017.svg/82px-Wikiversity_logo_2017.svg.png 2x" data-file-width="626" data-file-height="512" /></a></div>
  <div><span><a href="https://en.wikiversity.org/wiki/" class="extiw" title="v:">Wikiversity</a></span><br />Free learning tools</div>
</li>
<li>
  <div><a href="https://en.wikivoyage.org/wiki/" title="Wikivoyage"><img alt="Wikivoyage logo" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/35px-Wikivoyage-Logo-v3-icon.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/53px-Wikivoyage-Logo-v3-icon.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Wikivoyage-Logo-v3-icon.svg/70px-Wikivoyage-Logo-v3-icon.svg.png 2x" data-file-width="193" data-file-height="193" /></a></div>
  <div><span><a href="https://en.wikivoyage.org/wiki/" class="extiw" title="voy:">Wikivoyage</a></span><br />Free travel guide</div>
</li>
<li>
  <div><a href="https://en.wiktionary.org/wiki/" title="Wiktionary"><img alt="Wiktionary logo" src="//upload.wikimedia.org/wikipedia/en/thumb/0/06/Wiktionary-logo-v2.svg/35px-Wiktionary-logo-v2.svg.png" decoding="async" width="35" height="35" srcset="//upload.wikimedia.org/wikipedia/en/thumb/0/06/Wiktionary-logo-v2.svg/53px-Wiktionary-logo-v2.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/0/06/Wiktionary-logo-v2.svg/70px-Wiktionary-logo-v2.svg.png 2x" data-file-width="391" data-file-height="391" /></a></div>
  <div><span><a href="https://en.wiktionary.org/wiki/" class="extiw" title="wikt:">Wiktionary</a></span><br />Dictionary and thesaurus</div>
</li>
</ul>
</div></div>
<h2 id="mp-lang" class="mp-h2"><span class="mw-headline" id="Wikipedia_languages">Wikipedia languages</span></h2>
<div><style data-mw-deduplicate="TemplateStyles:r997272951">.mw-parser-output .wikipedia-languages-complete{font-weight:bold}.mw-parser-output .wikipedia-languages ul{margin-left:0}.mw-parser-output .wikipedia-languages ul a{white-space:nowrap}.mw-parser-output .wikipedia-languages>ul{list-style:none;text-align:center;clear:both}.mw-parser-output .wikipedia-languages-count-container{width:90%;display:flex;justify-content:center;padding-top:1em;margin:0 auto}.mw-parser-output .wikipedia-languages-prettybars{width:100%;height:1px;margin:0.5em 0;background-color:#c8ccd1;flex-shrink:1;align-self:center}.mw-parser-output .wikipedia-languages-count{padding:0 1em;white-space:nowrap}</style>
<div class="wikipedia-languages nourlexpansion">
<p>This Wikipedia is written in <a href="/wiki/English_language" title="English language">English</a>. Many <a href="https://meta.wikimedia.org/wiki/List_of_Wikipedias" class="extiw" title="meta:List of Wikipedias">other Wikipedias are available</a>; some of the largest are listed below.
</p>
<ul class="plainlinks">
<li>
  <div class="wikipedia-languages-count-container">
    <div class="wikipedia-languages-prettybars"></div>
    <div role="heading" class="wikipedia-languages-count">1,000,000+ articles</div>
    <div class="wikipedia-languages-prettybars"></div>
  </div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist wikipedia-languages-langs inline">
<ul><li><a class="external text" href="https://ar.wikipedia.org/wiki/"><span class="autonym" title="Arabic (ar:)" lang="ar">العربية</span></a></li>
<li><a class="external text" href="https://de.wikipedia.org/wiki/"><span class="autonym" title="German (de:)" lang="de">Deutsch</span></a></li>
<li><a class="external text" href="https://es.wikipedia.org/wiki/"><span class="autonym" title="Spanish (es:)" lang="es">Español</span></a></li>
<li><a class="external text" href="https://fr.wikipedia.org/wiki/"><span class="autonym" title="French (fr:)" lang="fr">Français</span></a></li>
<li><a class="external text" href="https://it.wikipedia.org/wiki/"><span class="autonym" title="Italian (it:)" lang="it">Italiano</span></a></li>
<li><a class="external text" href="https://nl.wikipedia.org/wiki/"><span class="autonym" title="Dutch (nl:)" lang="nl">Nederlands</span></a></li>
<li><a class="external text" href="https://ja.wikipedia.org/wiki/"><span class="autonym" title="Japanese (ja:)" lang="ja">日本語</span></a></li>
<li><a class="external text" href="https://pl.wikipedia.org/wiki/"><span class="autonym" title="Polish (pl:)" lang="pl">Polski</span></a></li>
<li><a class="external text" href="https://pt.wikipedia.org/wiki/"><span class="autonym" title="Portuguese (pt:)" lang="pt">Português</span></a></li>
<li><a class="external text" href="https://ru.wikipedia.org/wiki/"><span class="autonym" title="Russian (ru:)" lang="ru">Русский</span></a></li>
<li><a class="external text" href="https://sv.wikipedia.org/wiki/"><span class="autonym" title="Swedish (sv:)" lang="sv">Svenska</span></a></li>
<li><a class="external text" href="https://uk.wikipedia.org/wiki/"><span class="autonym" title="Ukrainian (uk:)" lang="uk">Українська</span></a></li>
<li><a class="external text" href="https://vi.wikipedia.org/wiki/"><span class="autonym" title="Vietnamese (vi:)" lang="vi">Tiếng Việt</span></a></li>
<li><a class="external text" href="https://zh.wikipedia.org/wiki/"><span class="autonym" title="Chinese (zh:)" lang="zh">中文</span></a></li></ul>
</div>
</li>
<li>
  <div class="wikipedia-languages-count-container">
    <div class="wikipedia-languages-prettybars"></div>
    <div role="heading" class="wikipedia-languages-count">250,000+ articles</div>
    <div class="wikipedia-languages-prettybars"></div>
  </div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist wikipedia-languages-langs inline">
<ul><li><a class="external text" href="https://id.wikipedia.org/wiki/"><span class="autonym" title="Indonesian (id:)" lang="id">Bahasa Indonesia</span></a></li>
<li><a class="external text" href="https://ms.wikipedia.org/wiki/"><span class="autonym" title="Malay (ms:)" lang="ms">Bahasa Melayu</span></a></li>
<li><a class="external text" href="https://zh-min-nan.wikipedia.org/wiki/"><span class="autonym" title="Min Nan Chinese (nan:)" lang="nan">Bân-lâm-gú</span></a></li>
<li><a class="external text" href="https://bg.wikipedia.org/wiki/"><span class="autonym" title="Bulgarian (bg:)" lang="bg">Български</span></a></li>
<li><a class="external text" href="https://ca.wikipedia.org/wiki/"><span class="autonym" title="Catalan (ca:)" lang="ca">Català</span></a></li>
<li><a class="external text" href="https://cs.wikipedia.org/wiki/"><span class="autonym" title="Czech (cs:)" lang="cs">Čeština</span></a></li>
<li><a class="external text" href="https://da.wikipedia.org/wiki/"><span class="autonym" title="Danish (da:)" lang="da">Dansk</span></a></li>
<li><a class="external text" href="https://eo.wikipedia.org/wiki/"><span class="autonym" title="Esperanto (eo:)" lang="eo">Esperanto</span></a></li>
<li><a class="external text" href="https://eu.wikipedia.org/wiki/"><span class="autonym" title="Basque (eu:)" lang="eu">Euskara</span></a></li>
<li><a class="external text" href="https://fa.wikipedia.org/wiki/"><span class="autonym" title="Persian (fa:)" lang="fa">فارسی</span></a>&#8206;</li>
<li><a class="external text" href="https://he.wikipedia.org/wiki/"><span class="autonym" title="Hebrew (he:)" lang="he">עברית</span></a></li>
<li><a class="external text" href="https://ko.wikipedia.org/wiki/"><span class="autonym" title="Korean (ko:)" lang="ko">한국어</span></a></li>
<li><a class="external text" href="https://hu.wikipedia.org/wiki/"><span class="autonym" title="Hungarian (hu:)" lang="hu">Magyar</span></a></li>
<li><a class="external text" href="https://no.wikipedia.org/wiki/"><span class="autonym" title="Norwegian (no:)" lang="no">Norsk Bokmål</span></a></li>
<li><a class="external text" href="https://ro.wikipedia.org/wiki/"><span class="autonym" title="Romanian (ro:)" lang="ro">Română</span></a></li>
<li><a class="external text" href="https://sr.wikipedia.org/wiki/"><span class="autonym" title="Serbian (sr:)" lang="sr">Srpski</span></a></li>
<li><a class="external text" href="https://sh.wikipedia.org/wiki/"><span class="autonym" title="Serbo-Croatian (sh:)" lang="sh">Srpskohrvatski</span></a></li>
<li><a class="external text" href="https://fi.wikipedia.org/wiki/"><span class="autonym" title="Finnish (fi:)" lang="fi">Suomi</span></a></li>
<li><a class="external text" href="https://tr.wikipedia.org/wiki/"><span class="autonym" title="Turkish (tr:)" lang="tr">Türkçe</span></a></li></ul>
</div>
</li>
<li>
  <div class="wikipedia-languages-count-container">
    <div class="wikipedia-languages-prettybars"></div>
    <div role="heading" class="wikipedia-languages-count">50,000+ articles</div>
    <div class="wikipedia-languages-prettybars"></div>
  </div>
<link rel="mw-deduplicated-inline-style" href="mw-data:TemplateStyles:r1129693374"/><div class="hlist wikipedia-languages-langs inline">
<ul><li><a class="external text" href="https://ast.wikipedia.org/wiki/"><span class="autonym" title="Asturian (ast:)" lang="ast">Asturianu</span></a></li>
<li><a class="external text" href="https://bn.wikipedia.org/wiki/"><span class="autonym" title="Bangla (bn:)" lang="bn">বাংলা</span></a></li>
<li><a class="external text" href="https://bs.wikipedia.org/wiki/"><span class="autonym" title="Bosnian (bs:)" lang="bs">Bosanski</span></a></li>
<li><a class="external text" href="https://et.wikipedia.org/wiki/"><span class="autonym" title="Estonian (et:)" lang="et">Eesti</span></a></li>
<li><a class="external text" href="https://el.wikipedia.org/wiki/"><span class="autonym" title="Greek (el:)" lang="el">Ελληνικά</span></a></li>
<li><a class="external text" href="https://simple.wikipedia.org/wiki/"><span class="autonym" title="Simple English (simple:)" lang="simple">Simple English</span></a></li>
<li><a class="external text" href="https://fy.wikipedia.org/wiki/"><span class="autonym" title="Western Frisian (fy:)" lang="fy">Frysk</span></a></li>
<li><a class="external text" href="https://ga.wikipedia.org/wiki/"><span class="autonym" title="Irish (ga:)" lang="ga">Gaeilge</span></a></li>
<li><a class="external text" href="https://gl.wikipedia.org/wiki/"><span class="autonym" title="Galician (gl:)" lang="gl">Galego</span></a></li>
<li><a class="external text" href="https://hr.wikipedia.org/wiki/"><span class="autonym" title="Croatian (hr:)" lang="hr">Hrvatski</span></a></li>
<li><a class="external text" href="https://ka.wikipedia.org/wiki/"><span class="autonym" title="Georgian (ka:)" lang="ka">ქართული</span></a></li>
<li><a class="external text" href="https://lv.wikipedia.org/wiki/"><span class="autonym" title="Latvian (lv:)" lang="lv">Latviešu</span></a></li>
<li><a class="external text" href="https://lt.wikipedia.org/wiki/"><span class="autonym" title="Lithuanian (lt:)" lang="lt">Lietuvių</span></a></li>
<li><a class="external text" href="https://ml.wikipedia.org/wiki/"><span class="autonym" title="Malayalam (ml:)" lang="ml">മലയാളം</span></a></li>
<li><a class="external text" href="https://mk.wikipedia.org/wiki/"><span class="autonym" title="Macedonian (mk:)" lang="mk">Македонски</span></a></li>
<li><a class="external text" href="https://nn.wikipedia.org/wiki/"><span class="autonym" title="Norwegian Nynorsk (nn:)" lang="nn">Norsk nynorsk</span></a></li>
<li><a class="external text" href="https://sq.wikipedia.org/wiki/"><span class="autonym" title="Albanian (sq:)" lang="sq">Shqip</span></a></li>
<li><a class="external text" href="https://sk.wikipedia.org/wiki/"><span class="autonym" title="Slovak (sk:)" lang="sk">Slovenčina</span></a></li>
<li><a class="external text" href="https://sl.wikipedia.org/wiki/"><span class="autonym" title="Slovenian (sl:)" lang="sl">Slovenščina</span></a></li>
<li><a class="external text" href="https://th.wikipedia.org/wiki/"><span class="autonym" title="Thai (th:)" lang="th">ไทย</span></a></li></ul>
</div>
</li>
</ul>
</div></div>
</div>
<!-- 
NewPP limit report
Parsed by mw1355
Cached time: 20230430064734
Cache expiry: 3600
Reduced expiry: true
Complications: []
CPU time usage: 0.315 seconds
Real time usage: 0.421 seconds
Preprocessor visited node count: 4720/1000000
Post‐expand include size: 134313/2097152 bytes
Template argument size: 12364/2097152 bytes
Highest expansion depth: 20/100
Expensive parser function count: 14/500
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 38281/5000000 bytes
Lua time usage: 0.063/10.000 seconds
Lua memory usage: 2006630/52428800 bytes
Number of Wikibase entities loaded: 0/400
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%  318.965      1 -total
 37.50%  119.625      1 Wikipedia:Main_Page/Tomorrow
 25.43%   81.125      9 Template:Main_page_image
 22.89%   73.013      1 Wikipedia:Today's_featured_article/April_30,_2023
 17.93%   57.197      9 Template:Str_number/trim
 14.94%   47.668      1 Wikipedia:Selected_anniversaries/April_30
 13.70%   43.711      2 Template:Main_page_image/TFA
 12.21%   38.941      1 Template:Did_you_know/Queue/6
 11.40%   36.361     28 Template:Flatlist
 10.77%   34.367      2 Template:Wikipedia_languages
-->

<!-- Saved in parser cache with key enwiki:pcache:idhash:15580374-0!canonical and timestamp 20230430064733 and revision id 1114291180. Rendering was triggered because: page-view
 -->
</div><!--esi <esi:include src="/esitest-fa8a495983347898/content" /> -->
<div class="printfooter" data-nosnippet="">Retrieved from "<a dir="ltr" href="https://en.wikipedia.org/w/index.php?title=Main_Page&amp;oldid=1114291180">https://en.wikipedia.org/w/index.php?title=Main_Page&amp;oldid=1114291180</a>"</div></div>
					<div id="catlinks" class="catlinks catlinks-allhidden" data-mw="interface"></div>
						
<div id="p-lang-btn" class="vector-menu vector-dropdown vector-menu-dropdown mw-portlet mw-portlet-lang"  >
	<input type="checkbox"
		id="p-lang-btn-checkbox"
		role="button"
		aria-haspopup="true"
		data-event-name="ui.dropdown-p-lang-btn"
		class="vector-menu-checkbox mw-interlanguage-selector"
		aria-label="Go to an article in another language. Available in 47 languages"
		
		
	/>
	<label
		id="p-lang-btn-label"
		for="p-lang-btn-checkbox"
		class="vector-menu-heading mw-ui-button mw-ui-quiet mw-ui-progressive mw-portlet-lang-heading-47"
		aria-hidden="true"
		
	>
		<span class="mw-ui-icon mw-ui-icon-language-progressive mw-ui-icon-wikimedia-language-progressive"></span>

		<span class="vector-menu-heading-label">47 languages</span>
	</label>
	<div class="vector-menu-content vector-dropdown-content">

		<div class="vector-menu-content">
			
			<ul class="vector-menu-content-list"><li class="interlanguage-link interwiki-ar mw-list-item"><a href="https://ar.wikipedia.org/wiki/" title="Arabic" lang="ar" hreflang="ar" class="interlanguage-link-target"><span>العربية</span></a></li><li class="interlanguage-link interwiki-bn mw-list-item"><a href="https://bn.wikipedia.org/wiki/" title="Bangla" lang="bn" hreflang="bn" class="interlanguage-link-target"><span>বাংলা</span></a></li><li class="interlanguage-link interwiki-bg mw-list-item"><a href="https://bg.wikipedia.org/wiki/" title="Bulgarian" lang="bg" hreflang="bg" class="interlanguage-link-target"><span>Български</span></a></li><li class="interlanguage-link interwiki-bs mw-list-item"><a href="https://bs.wikipedia.org/wiki/" title="Bosnian" lang="bs" hreflang="bs" class="interlanguage-link-target"><span>Bosanski</span></a></li><li class="interlanguage-link interwiki-ca mw-list-item"><a href="https://ca.wikipedia.org/wiki/" title="Catalan" lang="ca" hreflang="ca" class="interlanguage-link-target"><span>Català</span></a></li><li class="interlanguage-link interwiki-cs mw-list-item"><a href="https://cs.wikipedia.org/wiki/" title="Czech" lang="cs" hreflang="cs" class="interlanguage-link-target"><span>Čeština</span></a></li><li class="interlanguage-link interwiki-da mw-list-item"><a href="https://da.wikipedia.org/wiki/" title="Danish" lang="da" hreflang="da" class="interlanguage-link-target"><span>Dansk</span></a></li><li class="interlanguage-link interwiki-de mw-list-item"><a href="https://de.wikipedia.org/wiki/" title="German" lang="de" hreflang="de" class="interlanguage-link-target"><span>Deutsch</span></a></li><li class="interlanguage-link interwiki-et mw-list-item"><a href="https://et.wikipedia.org/wiki/" title="Estonian" lang="et" hreflang="et" class="interlanguage-link-target"><span>Eesti</span></a></li><li class="interlanguage-link interwiki-el mw-list-item"><a href="https://el.wikipedia.org/wiki/" title="Greek" lang="el" hreflang="el" class="interlanguage-link-target"><span>Ελληνικά</span></a></li><li class="interlanguage-link interwiki-es mw-list-item"><a href="https://es.wikipedia.org/wiki/" title="Spanish" lang="es" hreflang="es" class="interlanguage-link-target"><span>Español</span></a></li><li class="interlanguage-link interwiki-eo mw-list-item"><a href="https://eo.wikipedia.org/wiki/" title="Esperanto" lang="eo" hreflang="eo" class="interlanguage-link-target"><span>Esperanto</span></a></li><li class="interlanguage-link interwiki-eu mw-list-item"><a href="https://eu.wikipedia.org/wiki/" title="Basque" lang="eu" hreflang="eu" class="interlanguage-link-target"><span>Euskara</span></a></li><li class="interlanguage-link interwiki-fa mw-list-item"><a href="https://fa.wikipedia.org/wiki/" title="Persian" lang="fa" hreflang="fa" class="interlanguage-link-target"><span>فارسی</span></a></li><li class="interlanguage-link interwiki-fr mw-list-item"><a href="https://fr.wikipedia.org/wiki/" title="French" lang="fr" hreflang="fr" class="interlanguage-link-target"><span>Français</span></a></li><li class="interlanguage-link interwiki-gl mw-list-item"><a href="https://gl.wikipedia.org/wiki/" title="Galician" lang="gl" hreflang="gl" class="interlanguage-link-target"><span>Galego</span></a></li><li class="interlanguage-link interwiki-ko mw-list-item"><a href="https://ko.wikipedia.org/wiki/" title="Korean" lang="ko" hreflang="ko" class="interlanguage-link-target"><span>한국어</span></a></li><li class="interlanguage-link interwiki-hr mw-list-item"><a href="https://hr.wikipedia.org/wiki/" title="Croatian" lang="hr" hreflang="hr" class="interlanguage-link-target"><span>Hrvatski</span></a></li><li class="interlanguage-link interwiki-id mw-list-item"><a href="https://id.wikipedia.org/wiki/" title="Indonesian" lang="id" hreflang="id" class="interlanguage-link-target"><span>Bahasa Indonesia</span></a></li><li class="interlanguage-link interwiki-it mw-list-item"><a href="https://it.wikipedia.org/wiki/" title="Italian" lang="it" hreflang="it" class="interlanguage-link-target"><span>Italiano</span></a></li><li class="interlanguage-link interwiki-he mw-list-item"><a href="https://he.wikipedia.org/wiki/" title="Hebrew" lang="he" hreflang="he" class="interlanguage-link-target"><span>עברית</span></a></li><li class="interlanguage-link interwiki-ka mw-list-item"><a href="https://ka.wikipedia.org/wiki/" title="Georgian" lang="ka" hreflang="ka" class="interlanguage-link-target"><span>ქართული</span></a></li><li class="interlanguage-link interwiki-lv mw-list-item"><a href="https://lv.wikipedia.org/wiki/" title="Latvian" lang="lv" hreflang="lv" class="interlanguage-link-target"><span>Latviešu</span></a></li><li class="interlanguage-link interwiki-lt mw-list-item"><a href="https://lt.wikipedia.org/wiki/" title="Lithuanian" lang="lt" hreflang="lt" class="interlanguage-link-target"><span>Lietuvių</span></a></li><li class="interlanguage-link interwiki-hu mw-list-item"><a href="https://hu.wikipedia.org/wiki/" title="Hungarian" lang="hu" hreflang="hu" class="interlanguage-link-target"><span>Magyar</span></a></li><li class="interlanguage-link interwiki-mk mw-list-item"><a href="https://mk.wikipedia.org/wiki/" title="Macedonian" lang="mk" hreflang="mk" class="interlanguage-link-target"><span>Македонски</span></a></li><li class="interlanguage-link interwiki-ms mw-list-item"><a href="https://ms.wikipedia.org/wiki/" title="Malay" lang="ms" hreflang="ms" class="interlanguage-link-target"><span>Bahasa Melayu</span></a></li><li class="interlanguage-link interwiki-nl mw-list-item"><a href="https://nl.wikipedia.org/wiki/" title="Dutch" lang="nl" hreflang="nl" class="interlanguage-link-target"><span>Nederlands</span></a></li><li class="interlanguage-link interwiki-ja mw-list-item"><a href="https://ja.wikipedia.org/wiki/" title="Japanese" lang="ja" hreflang="ja" class="interlanguage-link-target"><span>日本語</span></a></li><li class="interlanguage-link interwiki-no mw-list-item"><a href="https://no.wikipedia.org/wiki/" title="Norwegian Bokmål" lang="nb" hreflang="nb" class="interlanguage-link-target"><span>Norsk bokmål</span></a></li><li class="interlanguage-link interwiki-nn mw-list-item"><a href="https://nn.wikipedia.org/wiki/" title="Norwegian Nynorsk" lang="nn" hreflang="nn" class="interlanguage-link-target"><span>Norsk nynorsk</span></a></li><li class="interlanguage-link interwiki-pl mw-list-item"><a href="https://pl.wikipedia.org/wiki/" title="Polish" lang="pl" hreflang="pl" class="interlanguage-link-target"><span>Polski</span></a></li><li class="interlanguage-link interwiki-pt mw-list-item"><a href="https://pt.wikipedia.org/wiki/" title="Portuguese" lang="pt" hreflang="pt" class="interlanguage-link-target"><span>Português</span></a></li><li class="interlanguage-link interwiki-ro mw-list-item"><a href="https://ro.wikipedia.org/wiki/" title="Romanian" lang="ro" hreflang="ro" class="interlanguage-link-target"><span>Română</span></a></li><li class="interlanguage-link interwiki-ru mw-list-item"><a href="https://ru.wikipedia.org/wiki/" title="Russian" lang="ru" hreflang="ru" class="interlanguage-link-target"><span>Русский</span></a></li><li class="interlanguage-link interwiki-simple mw-list-item"><a href="https://simple.wikipedia.org/wiki/" title="Simple English" lang="en-simple" hreflang="en-simple" class="interlanguage-link-target"><span>Simple English</span></a></li><li class="interlanguage-link interwiki-sk mw-list-item"><a href="https://sk.wikipedia.org/wiki/" title="Slovak" lang="sk" hreflang="sk" class="interlanguage-link-target"><span>Slovenčina</span></a></li><li class="interlanguage-link interwiki-sl mw-list-item"><a href="https://sl.wikipedia.org/wiki/" title="Slovenian" lang="sl" hreflang="sl" class="interlanguage-link-target"><span>Slovenščina</span></a></li><li class="interlanguage-link interwiki-sr mw-list-item"><a href="https://sr.wikipedia.org/wiki/" title="Serbian" lang="sr" hreflang="sr" class="interlanguage-link-target"><span>Српски / srpski</span></a></li><li class="interlanguage-link interwiki-sh mw-list-item"><a href="https://sh.wikipedia.org/wiki/" title="Serbo-Croatian" lang="sh" hreflang="sh" class="interlanguage-link-target"><span>Srpskohrvatski / српскохрватски</span></a></li><li class="interlanguage-link interwiki-fi mw-list-item"><a href="https://fi.wikipedia.org/wiki/" title="Finnish" lang="fi" hreflang="fi" class="interlanguage-link-target"><span>Suomi</span></a></li><li class="interlanguage-link interwiki-sv mw-list-item"><a href="https://sv.wikipedia.org/wiki/" title="Swedish" lang="sv" hreflang="sv" class="interlanguage-link-target"><span>Svenska</span></a></li><li class="interlanguage-link interwiki-th mw-list-item"><a href="https://th.wikipedia.org/wiki/" title="Thai" lang="th" hreflang="th" class="interlanguage-link-target"><span>ไทย</span></a></li><li class="interlanguage-link interwiki-tr mw-list-item"><a href="https://tr.wikipedia.org/wiki/" title="Turkish" lang="tr" hreflang="tr" class="interlanguage-link-target"><span>Türkçe</span></a></li><li class="interlanguage-link interwiki-uk mw-list-item"><a href="https://uk.wikipedia.org/wiki/" title="Ukrainian" lang="uk" hreflang="uk" class="interlanguage-link-target"><span>Українська</span></a></li><li class="interlanguage-link interwiki-vi mw-list-item"><a href="https://vi.wikipedia.org/wiki/" title="Vietnamese" lang="vi" hreflang="vi" class="interlanguage-link-target"><span>Tiếng Việt</span></a></li><li class="interlanguage-link interwiki-zh mw-list-item"><a href="https://zh.wikipedia.org/wiki/" title="Chinese" lang="zh" hreflang="zh" class="interlanguage-link-target"><span>中文</span></a></li></ul>
			
		</div>

	</div>
</div>
				</div>
			</main>
			
		</div>
		<div class="mw-footer-container">
			
<footer id="footer" class="mw-footer" role="contentinfo" >
	<ul id="footer-info">
	<li id="footer-info-lastmod"> This page was last edited on 5 October 2022, at 19:27<span class="anonymous-show">&#160;(UTC)</span>.</li>
	<li id="footer-info-copyright">Text is available under the <a rel="license" href="//en.wikipedia.org/wiki/Wikipedia:Text_of_the_Creative_Commons_Attribution-ShareAlike_3.0_Unported_License">Creative Commons Attribution-ShareAlike License 3.0</a><a rel="license" href="//creativecommons.org/licenses/by-sa/3.0/" style="display:none;"></a>;
additional terms may apply.  By using this site, you agree to the <a href="//foundation.wikimedia.org/wiki/Terms_of_Use">Terms of Use</a> and <a href="//foundation.wikimedia.org/wiki/Privacy_policy">Privacy Policy</a>. Wikipedia® is a registered trademark of the <a href="//www.wikimediafoundation.org/">Wikimedia Foundation, Inc.</a>, a non-profit organization.</li>
</ul>

	<ul id="footer-places">
	<li id="footer-places-privacy"><a href="https://foundation.wikimedia.org/wiki/Privacy_policy">Privacy policy</a></li>
	<li id="footer-places-about"><a href="/wiki/Wikipedia:About">About Wikipedia</a></li>
	<li id="footer-places-disclaimers"><a href="/wiki/Wikipedia:General_disclaimer">Disclaimers</a></li>
	<li id="footer-places-contact"><a href="//en.wikipedia.org/wiki/Wikipedia:Contact_us">Contact Wikipedia</a></li>
	<li id="footer-places-mobileview"><a href="//en.m.wikipedia.org/w/index.php?title=Main_Page&amp;mobileaction=toggle_view_mobile" class="noprint stopMobileRedirectToggle">Mobile view</a></li>
	<li id="footer-places-developers"><a href="https://developer.wikimedia.org">Developers</a></li>
	<li id="footer-places-statslink"><a href="https://stats.wikimedia.org/#/en.wikipedia.org">Statistics</a></li>
	<li id="footer-places-cookiestatement"><a href="https://foundation.wikimedia.org/wiki/Cookie_statement">Cookie statement</a></li>
</ul>

	<ul id="footer-icons" class="noprint">
	<li id="footer-copyrightico"><a href="https://wikimediafoundation.org/"><img src="/static/images/footer/wikimedia-button.png" srcset="/static/images/footer/wikimedia-button-1.5x.png 1.5x, /static/images/footer/wikimedia-button-2x.png 2x" width="88" height="31" alt="Wikimedia Foundation" loading="lazy" /></a></li>
	<li id="footer-poweredbyico"><a href="https://www.mediawiki.org/"><img src="/static/images/footer/poweredby_mediawiki_88x31.png" alt="Powered by MediaWiki" srcset="/static/images/footer/poweredby_mediawiki_132x47.png 1.5x, /static/images/footer/poweredby_mediawiki_176x62.png 2x" width="88" height="31" loading="lazy"/></a></li>
</ul>

</footer>

		</div>
	</div> 
</div> 
<div class="vector-header-container vector-sticky-header-container">
	<div id="vector-sticky-header" class="vector-sticky-header">
		<div class="vector-sticky-header-start">
			<div class="vector-sticky-header-icon-start mw-ui-icon-flush-left mw-ui-icon-flush-right" aria-hidden="true">
				
			<button
				
				tabindex="-1"
				data-event-name="ui.vector-sticky-search-form.icon"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-search vector-sticky-header-search-toggle">
				<span>Search</span>
			
			</button>
		</div>
			
		<div role="search" class="vector-search-box-vue  vector-search-box-show-thumbnail vector-search-box">
			<div>
				<form action="/w/index.php" id="vector-sticky-search-form"
					class="vector-search-box-form">
					<div 
						class="vector-search-box-inner"
						 data-search-loc="header-moved">
						<input class="vector-search-box-input"
							
							type="search" name="search"
							placeholder="Search Wikipedia"
						>
						<input type="hidden" name="title" value="Special:Search">
						<input
							 class="searchButton mw-fallbackSearchButton" type="submit" name="fulltext" title="Search Wikipedia for this text" value="Search">
						<input
							 class="searchButton" type="submit" name="go" title="Go to a page with this exact name if it exists" value="Go">
					</div>
				</form>
			</div>
		</div>
		<div class="vector-sticky-header-context-bar">
				<div class="vector-sticky-header-context-bar-primary" aria-hidden="true" ><span class="mw-page-title-main">Main Page</span></div>
			</div>
		</div>
		<div class="vector-sticky-header-end" aria-hidden="true">
			<div class="vector-sticky-header-icons">
				<a href="#"
			
				id="ca-talk-sticky-header"
				tabindex="-1"
				data-event-name="talk-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-speechBubbles sticky-header-icon">
				<span></span>
			</a>
			
			<a href="#"
			
				id="ca-subject-sticky-header"
				tabindex="-1"
				data-event-name="subject-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-article sticky-header-icon">
				<span></span>
			</a>
			
			<a href="#"
			
				id="ca-history-sticky-header"
				tabindex="-1"
				data-event-name="history-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-history sticky-header-icon">
				<span></span>
			</a>
			
			<a href="#"
			
				id="ca-watchstar-sticky-header"
				tabindex="-1"
				data-event-name="watch-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-star sticky-header-icon mw-watchlink">
				<span></span>
			</a>
			
			<a href="#"
			
				id="ca-edit-sticky-header"
				tabindex="-1"
				data-event-name="wikitext-edit-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-wikiText sticky-header-icon">
				<span></span>
			</a>
			
			<a href="#"
			
				id="ca-viewsource-sticky-header"
				tabindex="-1"
				data-event-name="ve-edit-protected-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-editLock sticky-header-icon">
				<span></span>
			</a>
			
			<a href="#"
			
				id="ca-ve-edit-sticky-header"
				tabindex="-1"
				data-event-name="ve-edit-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-ui-icon mw-ui-icon-element mw-ui-icon-wikimedia-edit sticky-header-icon">
				<span></span>
			</a>
			
		</div>
			<div class="vector-sticky-header-buttons">
				
			<button
				id="p-lang-btn-sticky-header"
				tabindex="-1"
				data-event-name="ui.dropdown-p-lang-btn-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet mw-interlanguage-selector">
				<span class="mw-ui-icon mw-ui-icon-wikimedia-language mw-ui-icon-wikimedia-wikimedia-language"></span><span>47 languages</span>
			
			</button>
			<a href="#"
			
				id="ca-addsection-sticky-header"
				tabindex="-1"
				data-event-name="addsection-sticky-header"
				
				
				class="mw-ui-button mw-ui-quiet sticky-header-icon mw-ui-primary mw-ui-progressive">
				<span class="mw-ui-icon mw-ui-icon-wikimedia-speechBubbleAdd-progressive mw-ui-icon-wikimedia-wikimedia-speechBubbleAdd-progressive"></span><span>Add topic</span>
			</a>
			
		</div>
			<div class="vector-sticky-header-icon-end">
				<div class="vector-user-links">
				</div>
			</div>
		</div>
	</div>
</div>
<div class='vector-settings'>
	
<button
	
	
	
	
	
	class="mw-ui-button mw-ui-icon mw-ui-icon-element vector-limited-width-toggle">
	<span>Toggle limited content width</span>

</button>

</div>
<script>(RLQ=window.RLQ||[]).push(function(){mw.config.set({"wgHostname":"mw1455","wgBackendResponseTime":171,"wgPageParseReport":{"limitreport":{"cputime":"0.315","walltime":"0.421","ppvisitednodes":{"value":4720,"limit":1000000},"postexpandincludesize":{"value":134313,"limit":2097152},"templateargumentsize":{"value":12364,"limit":2097152},"expansiondepth":{"value":20,"limit":100},"expensivefunctioncount":{"value":14,"limit":500},"unstrip-depth":{"value":0,"limit":20},"unstrip-size":{"value":38281,"limit":5000000},"entityaccesscount":{"value":0,"limit":400},"timingprofile":["100.00%  318.965      1 -total"," 37.50%  119.625      1 Wikipedia:Main_Page/Tomorrow"," 25.43%   81.125      9 Template:Main_page_image"," 22.89%   73.013      1 Wikipedia:Today's_featured_article/April_30,_2023"," 17.93%   57.197      9 Template:Str_number/trim"," 14.94%   47.668      1 Wikipedia:Selected_anniversaries/April_30"," 13.70%   43.711      2 Template:Main_page_image/TFA"," 12.21%   38.941      1 Template:Did_you_know/Queue/6"," 11.40%   36.361     28 Template:Flatlist"," 10.77%   34.367      2 Template:Wikipedia_languages"]},"scribunto":{"limitreport-timeusage":{"value":"0.063","limit":"10.000"},"limitreport-memusage":{"value":2006630,"limit":52428800}},"cachereport":{"origin":"mw1355","timestamp":"20230430064734","ttl":3600,"transientcontent":true}}});});</script>
<script type="application/ld+json">{"@context":"https:\/\/schema.org","@type":"Article","name":"Main Page","url":"https:\/\/en.wikipedia.org\/wiki\/Main_Page","sameAs":"http:\/\/www.wikidata.org\/entity\/Q5296","mainEntity":"http:\/\/www.wikidata.org\/entity\/Q5296","author":{"@type":"Organization","name":"Contributors to Wikimedia projects"},"publisher":{"@type":"Organization","name":"Wikimedia Foundation, Inc.","logo":{"@type":"ImageObject","url":"https:\/\/www.wikimedia.org\/static\/images\/wmf-hor-googpub.png"}},"datePublished":"2002-01-26T15:28:12Z","dateModified":"2022-10-05T19:27:50Z","image":"https:\/\/upload.wikimedia.org\/wikipedia\/commons\/4\/42\/Weymouth_Harbour_and_Bay.jpg","headline":"Wikimedia project page"}</script><script type="application/ld+json">{"@context":"https:\/\/schema.org","@type":"Article","name":"Main Page","url":"https:\/\/en.wikipedia.org\/wiki\/Main_Page","sameAs":"http:\/\/www.wikidata.org\/entity\/Q5296","mainEntity":"http:\/\/www.wikidata.org\/entity\/Q5296","author":{"@type":"Organization","name":"Contributors to Wikimedia projects"},"publisher":{"@type":"Organization","name":"Wikimedia Foundation, Inc.","logo":{"@type":"ImageObject","url":"https:\/\/www.wikimedia.org\/static\/images\/wmf-hor-googpub.png"}},"datePublished":"2002-01-26T15:28:12Z","dateModified":"2022-10-05T19:27:50Z","image":"https:\/\/upload.wikimedia.org\/wikipedia\/commons\/4\/42\/Weymouth_Harbour_and_Bay.jpg","headline":"Wikimedia project page"}</script>
</body>
</html>
''';
