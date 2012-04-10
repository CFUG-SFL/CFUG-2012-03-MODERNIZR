<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
	<title>Presentation for March 29, 2012 - Modernizr, HTML5 and ColdFusion 10</title>
    <meta name="viewport" content="width=1024" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<link rel="icon" type="image/png" href="./favicon.png" />
	<link href="http://fonts.googleapis.com/css?family=Allerta+Stencil|Inconsolata|Ubuntu:300,400,500,700" rel="stylesheet" type="text/css" />
    <link href="./includes/css/normalize.css" rel="stylesheet" type="text/css" />
    <link href="./includes/css/impress.css" rel="stylesheet" type="text/css" />
</head>
<body class="impress-not-supported">

	<div class="fallback-message">
	    <p>Your browser <b>doesn't support the features required</b> by impress.js, so you are presented with a simplified version of this presentation.</p>
	    <p>For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser.</p>
	</div>

	<div id="badge"></div>

	<div id="author">
		South Florida CFUG : 03.29.2012 &bull; 
		Introduction to Modernizr, a little HTML5/CSS3 and maybe ... &bull;
		Giancarlo Gomez
	</div>

	<div id="impress">
   
		
		<div class="step slide" data-x="0" data-y="0" id="cover">
        	<h1>ColdFusion User Group Meeting <small>March 29,2012</small></h1>
        	<q id="presentation-title">Introduction to Modernizr, a little HTML5/CSS3 and maybe ...</q>
    	</div>

        <cfloop from="1" to="2" index="i">
		<div class="step slide" data-x="1800" data-y="0">
        	<h1>What is Modernizr?</h1>
        	<q>
                Modernizr is an open-source JavaScript library that helps you build the next generation of HTML5 and CSS3-powered websites by detecting the features your visitor's browser supports.
        		<cfif !compare(i,2)>
                <br /><br />
        		Say goodbye to UA sniffing and welcome to feature detection!<br /><br />
                <div class="clue">In detecting feature support, it allows developers to test for some of the new technologies and then provide fallbacks for browsers that do not support them. This is called feature detection and is much more efficient than browser sniffing</div>
                </cfif>
        	</q>
    	</div>
        </cfloop>

        <cfloop from="1" to="3" index="i">
		<div class="step slide" data-x="3600" data-y="0">
        	<h1>How does it do it?</h1>
        	<q>
        		<ul class="medium">
        			<li>It tests for over 40 next-generation features, all in a matter of milliseconds</li>
        			<li>It creates a JavaScript object (named Modernizr) that contains the results of these tests as boolean properties</li>
        			<li>It adds classes to the html element that explain precisely what features are and are not natively supported</li>
        			<li>It provides a script loader so you can pull in polyfills to backfill functionality in old browsers</li>
                </ul>
                <cfif i GTE 2>
                <div class="clue">
                    Modernizr does not fill in the gaps for you. It only detects whether a feature is supported. 
                    But you can use it as part of the polyfilling process with the script loader also knows as <a href="http://yepnopejs.com/" target="_blank">yepnope.js</a>
                </div>
                </cfif>
                <cfif i GTE 3>
                <div class="clue">
                    Although, it does take care of 1 for you. It adds support for new HTML5 elements for version of IE that do not recognize them (not functionality just default styles).
                </div>
                </cfif>
        	</q>
    	</div>
        </cfloop>

		<cfloop from="1" to="2" index="i">
		<div class="step slide" data-x="5400" data-y="0">
        	<h1>A polly .. what?</h1>
        	<q>
        		<strong>polyfill (n):</strong> a JavaScript shim that replicates the standard API for older browsers
                <cfif !compare(i,2)>
        		<br /><br />
        		<div class="small">
	        		<strong>Good News:</strong><br />
	        		They exists for nearly every HTML5 feature that Modernizr detects
	        		<br /><br />
	        		<strong>Read more at:</strong><br />
	        		<a href="https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-browser-Polyfills" target="_blank">
	        			https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-browser-Polyfills
	        		</a>
        		</div>
                </cfif>
        	</q>
    	</div>
        </cfloop>

		<div class="step slide" data-x="7200" data-y="0">
        	<h1>Examples?</h1>
        	<q>
        		Great .. now let's see this thing in action!!!!!!
                <ol class="examples">
                    <li>
                        <strong>Example #1</strong>
                        <span>In this example we check if the browser supports the canvas element and if so we set the innerHTML text value of a dom element and the style of the page is set using Modernizr's css helpers.</span>
                        <a href="./examples/modernizr/example1.html" target="_blank"><span>open example</span></a>
                        <a href="" target="_blank"><span>view on github</span></a>
                    </li>
                    <li>
                        <strong>Example #2</strong>
                        <span>In this example we check if the browser supports the HTML5 input date type. If not we use the jQuery UI version as a fallback. Like example 1 we set the message to dom element and the styles are controlled by css rules.</span>
                        <a href="./examples/modernizr/example2.html" target="_blank"><span>open example</span></a>
                        <a href="" target="_blank"><span>view on github</span></a>
                    </li>
                </ol>
        	</q>
    	</div>

		<div id="html5" class="step slide" data-x="7200" data-y="1000">
        	<h1>What is all this talk about HTML5 and CSS3? <small>html5rocks.com</small></h1>
        	<p>
        		HMTL5 is not a single thing or a monolithic technology. It is a collection of features, technologies, and APIs that brings the power of the desktop and the vibrancy of multimedia experience to the web-while amplifying the web’s core strengths of interactivity and connectivity.
        		<br /><br />
				HTML5 includes the fifth revision of the HTML markup language, CSS3, and a series of JavaScript APIs. Together, these technologies enable you to create complex applications that previously could be created only for desktop platforms.
				<br /><br />
				CSS3 offers exciting new possibilities to create an impact with your designs, allows you to use more diverse style sheets for a variety of occasions and lots more.
        	</p>
        	<section id="classes">
		    <ul>
		      <li class="offline"><a href="http://www.html5rocks.com/en/features/offline" target="_blank"><h3>Offline</h3></a></li>
		      <li class="storage"><a href="http://www.html5rocks.com/en/features/storage" target="_blank"><h3>Storage</h3></a></li>
		      <li class="connectivity"><a href="http://www.html5rocks.com/en/features/connectivity" target="_blank"><h3>Connectivity</h3></a></li>
		      <li class="file_access"><a href="http://www.html5rocks.com/en/features/file_access" target="_blank"><h3>File Access</h3></a></li>
		      <li class="semantics"><a href="http://www.html5rocks.com/en/features/semantics" target="_blank"><h3>Semantics</h3></a></li>
		      <li class="multimedia"><a href="http://www.html5rocks.com/en/features/multimedia" target="_blank"><h3>Audio/Video</h3></a></li>
		      <li class="graphics"><a href="http://www.html5rocks.com/en/features/graphics" target="_blank"><h3>3D/Graphics</h3></a></li>
		      <li class="presentation"><a href="http://www.html5rocks.com/en/features/presentation" target="_blank"><h3>Presentation</h3></a></li>
		      <li class="performance"><a href="http://www.html5rocks.com/en/features/performance" target="_blank"><h3>Performance</h3></a></li>
		      <li class="nuts_and_bolts"><a href="http://www.html5rocks.com/en/features/nuts_and_bolts" target="_blank"><h3>Nuts &amp; Bolts</h3></a></li>
		    </ul>
		    <div style="text-align:center; clear:left; margin-top:2em;">
		    	<a href="http://www.html5rocks.com/" target="_blank">Find out more @ html5rocks.com!!!!</a>
		    </div>
		  </section>
    	</div>

    	<div class="step slide" data-x="9000" data-y="1000">
    		<h1>More Examples ....</h1>
        	<q>
        		Let's take a look at some of these cool new features!
                 <ol class="examples">
                    <li>
                        <strong>Example #1</strong>
                        <span>In this example we see how easily we can add placeholders and simple validation to our HTML5 forms</span>
                        <a href="./examples/html5/example1.html" target="_blank"><span>open example</span></a>
                        <a href="" target="_blank"><span>view on github</span></a>
                    </li>
                    <li>
                        <strong>Example #2</strong>
                        <span>
                            In this example we see how we can take advantage of the new File API to create a Drag and Drop interface for users to easily upload multiple files at a time.
                            <br /><strong class="red">REQUIREMENTS: ColdFusion 10 and a modern browser that supports drag and drop and XHR2</strong>
                        </span>
                        <a href="./examples/html5/uploader/" target="_blank"><span>open example</span></a>
                        <a href="" target="_blank"><span>view on github</span></a>
                    </li>
                </ol>
            </q>
    	</div>

     	<div id="coldfusion10" class="step slide" data-x="9000" data-y="2000">
    		<h1>ColdFusion 10</h1>
        	<q>
        		Have you downloaded the beta?<br />
        		<strong>&nbsp; &nbsp; If not what are you waiting for! Go get it at <a href="http://labs.adobe.com/technologies/coldfusion10/" target="_blank">Adobe Labs</a>!</strong>
                <br/ ><br />
                We ran out of time at this point but Ray Camden did a presentation and his PDF and code examples are all included in the following zip file from Ray's site. I suggest you go thru it to see some of the new features and play with the code examples. A link to his video presentation is included below as well.
                <ul>
                    <li><a href="http://www.raymondcamden.com/enclosures/forpreso.zip" target="_blank">Ray's Presentation - The Files</a></li>
                    <li><a href="https://www.adobe.com/cfusion/event/index.cfm?loc=en%5Fus&id=2001079&event=register%5Fno%5Fsession" target="_blank">Ray's Presentation - The Video</a></li>
                </ul>
        	</q>
    	</div>

        <div id="links" class="step slide" data-x="10800" data-y="2000">
            <h1>Links!</h1>
            <p>The following are links from mentioned during the presentation + some extra ones.</p>
            <ul>
                <li><a href="http://www.modernizr.com/" target="_blank">Modernizr<span>The main subject of this presentation</span></a></li>
                <li><a href="http://www.html5rocks.com/en/" target="_blank">HTML5 Rocks<span>A resource for open web HTML5 developers<span></a></li>
                <li><a href="http://html5boilerplate.com/" target="_blank">HTML5 Boilerplate<span>A rock-solid default template for HTML5 awesome.</span></a></li>
                <li><a href="http://html5doctor.com/" target="_blank">HTML5 Doctor<span>helping you implement HTML5 today</span></a></li>
                <li><a href="http://www.20thingsilearned.com/home" target="_blank">20 THINGS I LEARNED ACOUNT BROWSERS &amp; THE WEB<span>Cool book created by the Google Chrome Team</span></a></li>
                <li><a href="http://www.w3.org/html/logo/index.html" target="_blank">W3C HTML5 Logo<span>SHow your support!!!</span></a></li>
                <li><a href="http://www.youtube.com/user/paulirish" target="_blank">Paul Irish's YouTube Channel<span>Great speaker, check out his videos on Chromes developer tools</span></a></li>
            </ul>

            <ul>
                <li><a href="http://mir.aculo.us/dom-monster/" target="_blank">DOM Monster<span>a cross-platform, cross-browser bookmarklet that will analyze the DOM & other features of the page you're on, and give you its bill of health.</span></a></li>
                <li><a href="http://haz.io/" target="_blank">haz.io<span>HTML5 &amp;CSS3 Browser Capabilities</span></a></li>
                <li><a href="http://html5readiness.com/" target="_blank">HTML5 Readiness</a></li>
                <li><a href="http://ishtml5readyyet.com/" target="_blank">IS HTML5 READY YET?</a></li>
                <li><a href="http://ishtml5ready.com/" target="_blank">IS HTML5 READY?</a></li>
                <li><a href="http://wufoo.com/html5/" target="_blank">The Current State of HTML5 Forms</a></li>
                <li><a href="http://html5test.com/" target="_blank">The HTML5 test<span>How well does your browser support HTML5?</span></a></li>
                <li><a href="http://caniuse.com/" target="_blank">When can I use...<span>Support tables for HTML5, CSS3, etc</span></a></li>
            </ul>
        </div>

    	<div id="complete" class="step slide" data-x="12600" data-y="2000">
    		<h1>Complete!</h1>
        	<q>
        		Giancarlo Gomez<br />
        		305.610.9428<br />
        		<a href="http://www.fusedevelopments.com">www.fusedevelopments.com</a><br />
        		<a href="mailto:jc@fusedevelopments.com">jc@fusedevelopments.com</a><br />
        		<a href="http://www.twitter.com/GiancarloGomez">@GiancarloGomez</a><br />
                <br />
                This presentation was created with <a href="https://github.com/bartaz/impress.js/" target="_blank">impress.js</a>
        	</q>
    	</div>
    
	</div>

    <div class="hint">Use a spacebar or arrow keys to navigate</div>

	<script type="text/javascript" src="./includes/js/impress.js"></script>
	<script type="text/javascript">
        if ("ontouchstart" in document.documentElement) { 
            document.querySelector(".hint").innerHTML = "Tap on the left or right to navigate";
        }
        impress().init();
    </script>

</body>
</html>