import 'package:wnews/wnews.dart';
import 'package:test/test.dart';

void main() {
  test('throws from empty string', () {
    expect(() => extractNews(''), throwsArgumentError);
  });

  test('extracts the correct number of news items', () {
    expect(extractNews(_html).length, 4);
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