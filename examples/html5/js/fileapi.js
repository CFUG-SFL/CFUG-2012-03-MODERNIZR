var dropbox 		= document.getElementById('dropbox'),
	preview 		= document.getElementById('preview'),
	progress 		= $('#progress'),
	total 			= $('#total'),
	noimages 		= $('#noimages'),
	lightbox 		= $('#lightbox'),
	overlay 		= $('#overlay'),
	filesToUpload 	= [],
	ids				= 0;

// only set listeners if browser supports drag and drop and the new FormData function presented by XHR Level 2
// https://developer.mozilla.org/en/XMLHttpRequest/FormData
// http://www.html5rocks.com/en/tutorials/file/xhr2/
// 
if (Modernizr.draganddrop && typeof FormData === 'function' && cfversion >= 10){
	// init event handlers
	dropbox.addEventListener('dragenter', dragEnter, false);
	dropbox.addEventListener('dragexit', dragExit, false);
	dropbox.addEventListener('dragleave', dragExit, false);
	dropbox.addEventListener('dragover', noopHandler, false);
	dropbox.addEventListener('drop', drop, false);
	// setup actions
	setupUI();
}else if (cfversion < 10){
	document.body.className = 'min-cf';
	document.getElementById('notsupported').innerHTML = 'This example requires ColdFusion 10';
}else{
	// this browser is not modern enough
	document.getElementById('notsupported').innerHTML = 'This browser does not support drag and drop and the new XHR Level 2 FormData function.<br />Please use Chrome or the latest Firefox release';
}

// this function handles showing a message when there are no images uploaded
function noImages(ln){
	if (ln == undefined)
		ln = $(preview).find('div[data-original]').length;
	if (ln == 0)
		noimages.html('There are no images uploaded.<br />To begin simply drag and drop files above').show();
	else
		noimages.html('').hide();
}
 
// this is ran at the begining - looks for all images and then send to setup actions
function setupUI(){
	var imgs = $(preview).find('div[data-original]');
	noImages(imgs.length);
	if(imgs.length != 0){
		// go thru each one and set what is necessary for the view and delete links
		imgs.each(function(){
			setupImageAction($(this));		
		});
	}
	lightbox.find('a').on('click',function(event){
		event.stopPropagation();
		event.preventDefault();
		lightbox.fadeOut(250,function(){
			overlay.fadeOut(250);
		});
	})
	// show UI
	$('#ui').fadeIn(500);
}

// setup the actions for each anchor tag inside an image displayed
function setupImageAction(me){
	me.find('a').each(function(i){
		if (i == 0)
			$(this).on('click',function(event){
				event.stopPropagation();
				event.preventDefault();
				showImage(me.data('original'));
			})
		else
			$(this).on('click',function(event){
				event.stopPropagation();
				event.preventDefault();
				deleteImage(me);
			})
	});
}

// delete image action > makes and ajax call and then calls noImages() at end
function deleteImage(jqObject){
	// ajax call the jQuery way
	$.ajax('upload.cfm',{
		type:'POST',
		data:'act=FileDelete&file=' + jqObject.data('original'),
		success: function(data){
			if(data.SUCCESS == 'true');
			jqObject.fadeOut('100',function(){
				$(this).remove();
				noImages();
			});
		}
	});
}

// show image funciton > displays the original file in the lightbox
function showImage(path){
	lightbox.find('div#holder').html('<img src="' + path + '" />');
	overlay.fadeIn(500,function(){
		lightbox.fadeIn(500);
	});
}

// event listeners for drag and drop : start
function dragEnter(evt) {
	evt.stopPropagation();
	evt.preventDefault();
	$(dropbox).addClass('over');
}

function dragExit(evt) {
	evt.stopPropagation();
	evt.preventDefault();
	$(dropbox).removeClass('over');
}

function noopHandler(evt) {
  evt.stopPropagation();
  evt.preventDefault();
}

function drop(evt){
	$(dropbox).removeClass('over');
	evt.stopPropagation();
	evt.preventDefault();
	 
	var files = evt.dataTransfer.files;
	var count = files.length;
	 
	if (count > 0)
		handleFiles(files);
}
// event listeners for drag and drop : end

// called when a file or files are dropped
function handleFiles(files){
	// regex to check type
	var imageType = /image.*/;
	// loop thru files sent
	for (var i = 0; i < files.length; i++){
		// get the current file
		var file = files[i];
		// check that it is valid
		if (!file.type.match(imageType)) {
	      continue;  
	    } 
	    filesToUpload.push(file);
	}
	// send files to upload
	for (var i in filesToUpload){
		if(!filesToUpload[i].rowid)
			sendFile(filesToUpload[i]);
	}
}

// called from handleFiles - the xhr request for uploading files
function sendFile(file)  {  

	var formData 	= new FormData();
	var xhr 		= new XMLHttpRequest();

	createProgress(file);

	formData.append('uploadfile', file);
	formData.append('act', 'FileUpload');

	xhr.open('POST', 'upload.cfm', true);
		
		xhr.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				var data = JSON.parse(this.responseText);
				if (data.SUCCESS == true){
					// create the elements
					var a = document.createElement('div'),
						b = document.createElement('img'),
						c = document.createElement('div');
					// set the element properties
						a.dataset.original = './uploads/' + data.ORIGINAL;
						b.src = './uploads/' + data.THUMBNAIL;
					// append to dom
					preview.appendChild(a);
					a.appendChild(b);
					a.appendChild(c);
					c.innerHTML = '<a href="#">View</a> &bull; <a href="#">Delete</a>';
					// setup the Image Actions
					setupImageAction($(a));
					noImages(1);
				}
				finalizeProgress(file);
			}
		}

		// Listen to the upload progress.
		xhr.upload.onprogress = function(e) {
			if (e.lengthComputable) {
				updateProgress((e.loaded / e.total) * 100,file);
			}
		};

	xhr.send(formData);  // multipart/form-data
}  

// called from createProgress and updateProgress
function updateText(){
	var c = filesToUpload.length;
	if (c > 0)
		total.html(c + ' file' + (c != 1 ? 's' : '') +' processing');
	else
		total.html('');
}

// called on sendFile when xhr is created
function createProgress(file){
	file.rowid = 'row_' + ids;
	ids++;
	str = '<div class="row" id="' + file.rowid + '">' + file.name.toLowerCase() + '<div class="process"></div><div class="bar"></div></div>';
	progress.append(str);
	updateText();
}

// called on sendFile during xhr upload progress
function updateProgress(percent,file){
	var a = file.rowid,
		b = Math.round(percent);
	if (b == 100){
		$('#' + a + ' .process').html('Processing file on server');
		$('#' + a + ' .bar').css('width',b + '%');
	}else{
		$('#' + a + ' .process').html(b + '% uploaded');
		$('#' + a + ' .bar').css('width',b + '%');
	}
}

// called on sendFile when xhr is complete 
function finalizeProgress(file){	
	var a = file.rowid;
	$('#' + a + ' .process').html('Complete');
	$('#' + a).delay(500).fadeOut(500,updateText);
	filesToUpload.pop(file);
}