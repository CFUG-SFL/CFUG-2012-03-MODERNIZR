<cfsilent>
	<cfdirectory directory="#expandPath("./uploads/")#" name="dir" filter="th_*" sort="datelastmodified" />
</cfsilent><!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<title>Simple File API</title>
	<link rel="icon" type="image/png" href="../../../favicon.png" />
	<link href="http://fonts.googleapis.com/css?family=Inconsolata|Ubuntu:300,400,500,700" rel="stylesheet" type="text/css" />
    <link href="../../../includes/css/normalize.css" rel="stylesheet" type="text/css" />
	<link href="../../modernizr/css/display.css" rel="stylesheet" type="text/css" />
	<link href="./../css/ui.css" rel="stylesheet" type="text/css" />
	<link href="../../../includes/css/smoothness/jqueryui.1.8.18.css" rel="stylesheet" type="text/css" />
	<script src="../../../includes/js/modernizr.js"></script>
	<style>
	</style>
</head>
<body>
	<!-- UI container : fades in on init -->
	<div id="ui">
		
		<!-- the dropbox : this is where we drag and drop files -->
		<div id="dropbox"><span id="droplabel">Drop files here...</span></div>
		<!-- /dropbox -->
		
		<!-- the progress : this div shows each file being uploaded and their total progress -->
		<div id="progress">
			<div id="total"></div>
		</div>
		<!-- /progress -->
		
		<!-- the preview : this is where the image previews go -->
		<div id="preview">
			<h2>Images</h2>
			<cfoutput query="dir">
				<div data-original="./uploads/#replace(name,'th_','o_')#">
					<img src="./uploads/#name#" />
					<div>
						<a href="##">View</a> &bull; <a href="##">Delete</a>
					</div>
				</div>
			</cfoutput>
			<!-- this div shows the no images message -->
			<div id="noimages"></div>
		</div>
		<!-- /preview -->
	
	</div>
	<!-- /ui -->

	<!-- this div displays a message when the browser you are using does not dupport this application -->
	<div id="notsupported"></div>

	<!-- the overlay and lightbox is used to view the images -->
	<div id="overlay"></div>
	<div id="lightbox">
		<div id="holder"></div>
		<a href="#">close image</a>
	</div>

	<!-- load jQuery and jQuery UI from CDN with local fallback -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	<script>window.jQuery || document.write('<script src="../../includes/js/jquery.1.7.1.min.js"><\/script>')</script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
	<script>window.jQuery.ui || document.write('<script src="../../includes/js/jquery.ui.1.8.18.js"><\/script>')</script>

	<script>
		var cfversion =  <cfoutput>#listFirst(server.coldfusion.productversion)#</cfoutput>;
		console.log(cfversion);
	</script>

	<!-- load the applicaiton js file -->
	<script src="./../js/fileapi.js"></script>
</body>
</html>