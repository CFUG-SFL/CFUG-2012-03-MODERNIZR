<cfscript>
	path = expandPath("./uploads/");
	str = {
		success 	: true,
		message 	: "",
		original	: "",
		thumbnail 	: ""
	};
	param name="form.act" default="";
</cfscript>

<cfswitch expression="#form.act#">

	<cfcase value="FileDelete">

		<cfscript>
			try{
				// delete thumbnail and original image
				fileDelete(expandPath(replace(form.file,"uploads/o_","uploads/th_")));
				fileDelete(expandPath(form.file));
			}
			catch(Any e){
				// ignore errors
			}
		</cfscript>

	</cfcase>

	<!--- file uploads --->
	<cfcase value="FileUpload">
		<cftry>
			<cffile action="upload" filefield="uploadfile" destination="#path#" accept="image/png,image/jpg,image/jpeg" strict="true" nameconflict="overwrite" />
			<!--- 
			* 	Use for debugging if you'd like 
			* 	<cfdocument format="pdf" filename="fileupload.pdf" overwrite="true"><cfdump var="#cffile#"></cfdocument>
			--->
			<cfscript>
				newname = "o_" & lcase(cffile.serverfile);
				// make sure our name is lower case
				fileMove(path & cffile.serverfile,path & newname);
				// lets create a thumbnail
				image = imageRead(path & newname);
				// set the new image height and thmbnail here
				new_width = new_height = 160;
				// create square thumbnail
				if (image.width < image.height)
					imageCrop(image,0,(image.height-image.width)/2,image.width,image.width);
				else if (image.width > image.height)
					imageCrop(image,(image.width-image.height)/2,0,image.height,image.height);
				// now scale it down/up
				imageResize(image, new_width, new_height);
				// write the thumbnail
				imageWrite(image,path & "th_" & lcase(cffile.serverfile), true, .8);
				// set the names so we get it in our json string
				str.original 	= newname;
				str.thumbnail 	= "th_" & lcase(cffile.serverfile);
			</cfscript>
			<!---
			* 	Use for debugging if you'd like 
			* 	<cfdocument format="pdf" filename="image.pdf" overwrite="true"><cfdump var="#image#"></cfdocument>
			--->
			<cfcatch type="any">
				<cfscript>
					str.message = cfcatch.message;
					str.success = false;
					str.original = str.thumbnail = "";
				</cfscript>
			</cfcatch>
		</cftry>
	</cfcase>

	 <cfdefaultcase> 
	 	<cfset str.success = false />
	 </cfdefaultcase>
</cfswitch>
<cfcontent type="text/json" reset = "true" />
<cfoutput>#serializeJSON(str)#</cfoutput>