	var RTE_BUTTON_IMAGE_PREFIX = "rteButtonImage";
	var RTE_BUTTON_DIV_PREFIX = "rteButtonDiv";
	var RTE_BUTTON_PAD1_PREFIX = "rteButtonPad1";
	var RTE_BUTTON_PAD2_PREFIX = "rteButtonPad2";
	var rteButtonMap = new Object();

	function RTEButton
	(
		idGenerator,
		caption,
		action,
		text,
		image,
		promo,
		editorid
	)
	{
		this.idGenerator = idGenerator;
		this.caption = caption;
		this.action = action; // Function pointer
		this.text = text;
		this.image = image;
		this.enabled = true;
		this.Instantiate = RTEButtonInstantiate;
		this.Enable = RTEButtonEnable;
		this.editorid = editorid;
		
		if(typeof promo != "undefined")
		{
			if(promo) this.promo = true;
		}
	}

	function RTEButtonInstantiate()
	{
		this.id = this.idGenerator.GenerateID();
		rteButtonMap[this.id] = this;
		var html = "";
		html += '<div id="';
		html += RTE_BUTTON_DIV_PREFIX;
		html += this.id;
		if (this.promo)
		{
			html += '" class="RTEButtonNormalPromo"';
		}
		else
		{
			html += '" class="RTEButtonNormal"';
		}
		html += ' onselectstart="RTEButtonOnSelectStart()"';
		html += ' ondragstart="RTEButtonOnDragStart()"';
		html += ' onmousedown="RTEButtonOnMouseDown(this)"';
		html += ' onmouseup="RTEButtonOnMouseUp(this)"';
		html += ' onmouseout="RTEButtonOnMouseOut(this)"';
		html += ' onmouseover="RTEButtonOnMouseOver(this)"';
		html += ' onclick="RTEButtonOnClick(this)"';
		html += ' ondblclick="RTEButtonOnDblClick(this)"';
		html += '>';
		html += '<a href="#" style="cursor:hand" onmouseover="window.status=\'' + this.caption + '\';return true;" onmouseout="window.status=window.defaultStatus;return true;">';
		html += '<table cellpadding=0 cellspacing=0 border=0><tr><td><img id="';
		html += RTE_BUTTON_PAD1_PREFIX;
		html += this.id;
		html += '" width=2 height=2></td><td></td><td></td></tr><tr><td></td><td><table cellpadding=0 cellspacing=0 border=0><tr>';
		html += '<td>';
		html += '<img id="';
		html += RTE_BUTTON_IMAGE_PREFIX;
		html += this.id;
		html += '" src="';
		html += this.image;
		html += '" title="';
		html += this.caption;
		html += '">';
		html += '</td>';
		if (this.text != "") {
		    html += '<td>&nbsp;</td>';
		    html += '<td class=RTEButtonText nowrap>';
		    html += this.text;
		    html += '</td>';
		}
		html += '</tr></table></td><td></td></tr><tr><td></td><td></td><td><img id="';
		html += RTE_BUTTON_PAD2_PREFIX;
		html += this.id;
		html += '" width=2 height=2></td></tr></table>';
		html += '</a>';
		html += '</div>';
		document.write(html);
	}

	function RTEButtonEnable(enabled)
	{
		this.enabled = enabled;
		if (this.enabled)
		{
			if (this.promo)
			{
				document.all[RTE_BUTTON_DIV_PREFIX + this.id].className = "RTEButtonNormalPromo";
			}
			else
			{
				document.all[RTE_BUTTON_DIV_PREFIX + this.id].className = "RTEButtonNormal";
			}
		}
		else
		{
			if (this.promo)
			{
				document.all[RTE_BUTTON_DIV_PREFIX + this.id].className = "RTEButtonDisabledPromo";
			}
			else
			{
				document.all[RTE_BUTTON_DIV_PREFIX + this.id].className = "RTEButtonDisabled";
			}
		}
	}

	function RTEButtonOnSelectStart()
	{
		window.event.returnValue = false;
	}

	function RTEButtonOnDragStart()
	{
		window.event.returnValue = false;
	}

	function RTEButtonOnMouseDown(element)
	{
		if (event.button == 1)
		{
			var id = element.id.substring(RTE_BUTTON_DIV_PREFIX.length, element.id.length);
			var button = rteButtonMap[id];
			if (button.enabled)
			{
				RTEButtonPushButton(id, button);
			}
		}
	}

	function RTEButtonOnMouseUp(element)
	{
		if (event.button == 1)
		{
			var id = element.id.substring(RTE_BUTTON_DIV_PREFIX.length, element.id.length);
			var button = rteButtonMap[id];
			if (button.enabled)
			{
				RTEButtonReleaseButton(id, button);
			}
		}
	}

	function RTEButtonOnMouseOut(element)
	{
		var id = element.id.substring(RTE_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteButtonMap[id];
		if (button.enabled)
		{
			RTEButtonReleaseButton(id, button);
		}

		document.onclick = HideMenu;
	}

	function RTEButtonOnMouseOver(element)
	{
		var id = element.id.substring(RTE_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteButtonMap[id];
		if (button.enabled)
		{
			RTEButtonReleaseButton(id, button);
			if (button.promo)
			{
				document.all[RTE_BUTTON_DIV_PREFIX + id].className = "RTEButtonMouseOverPromo";
			}
			else
			{
				document.all[RTE_BUTTON_DIV_PREFIX + id].className = "RTEButtonMouseOver";
			}
		}
	
		document.onclick = null;
	}

	function RTEButtonOnClick(element)
	{
		var id = element.id.substring(RTE_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteButtonMap[id];
		if(button.enabled) button.action(button.editorid, element);
	}

	function RTEButtonOnDblClick(element)
	{
		RTEButtonOnClick(element);
	}

	function RTEButtonPushButton(id, element)
	{
		document.all[RTE_BUTTON_PAD1_PREFIX + id].width = 3;
		document.all[RTE_BUTTON_PAD1_PREFIX + id].height = 3;
		document.all[RTE_BUTTON_PAD2_PREFIX + id].width = 1;
		document.all[RTE_BUTTON_PAD2_PREFIX + id].height = 1;

		if (element.promo)
		{
			document.all[RTE_BUTTON_DIV_PREFIX + id].className = "RTEButtonPressedPromo";
		}
		else
		{
			document.all[RTE_BUTTON_DIV_PREFIX + id].className = "RTEButtonPressed";
		}
	}

	function RTEButtonReleaseButton(id, element)
	{
		document.all[RTE_BUTTON_PAD1_PREFIX + id].width = 2;
		document.all[RTE_BUTTON_PAD1_PREFIX + id].height = 2;
		document.all[RTE_BUTTON_PAD2_PREFIX + id].width = 2;
		document.all[RTE_BUTTON_PAD2_PREFIX + id].height = 2;

		if (element.promo)
		{
			document.all[RTE_BUTTON_DIV_PREFIX + id].className = "RTEButtonNormalPromo";
		}
		else
		{
			document.all[RTE_BUTTON_DIV_PREFIX + id].className = "RTEButtonNormal";
		}
	}



var RTE_EDITOR_COMPOSITION_PREFIX = "rteEditorComposition";
var RTE_EDITOR_TOOLBAR_PREFIX = "rteEditorToolbar";
var RTE_EDITOR_SMILEY_BUTTON_PREFIX = "rteEditorSmileyButton";
var RTE_EDITOR_IMAGE_CHOOSER_PREFIX = "rteEditorImageChooser";
var RTE_EDITOR_DEFAULT_FONT_FAMILY = "arial";
var RTE_EDITOR_DEFAULT_FONT_SIZE = "10pt";
var RTE_EDITOR_FONT_PREFIX = "rteEditorFont";
var RTE_EDITOR_SIZE_PREFIX = "rteEditorSize";
var RTE_EDITOR_FORE_PREFIX = "rteEditorFore";
var RTE_EDITOR_BACK_PREFIX = "rteEditorBack";
var RTE_EDITOR_ALIGN_PREFIX = "rteEditorAlign";
var RTE_EDITOR_LIST_PREFIX = "rteEditorList";
var RTE_EDITOR_MAX_HEIGHT = 800;
var rteEditorMap = new Object();

var rteEditorIDGenerator = null;
var rteEditorActive = 0;
var g_nTimer = 0;

function FunctionCall(p_oFunction, p_aArguments)
{
	this.Function = p_oFunction;
	this.Arguments = p_aArguments;
}

function SetEditorComposeReadyTimeout(p_sEditorId)
{
    window.setTimeout("CallComposeReadyHandler("+p_sEditorId+")",100);
}

function CallComposeReadyHandler(p_sEditorId)
{
    rteEditorMap[p_sEditorId].HandleComposeReady();    
}

function RTEEditor(idGenerator)
{
	this.idGenerator = idGenerator;
	this.textMode = false;
	this.backgroundColor = "";
	this.backgroundImage = "";
	this.foregroundColor = "";
	this.fontFamily = "";
	this.fontSize = "";
	this.stationeryButton = false;
	this.stationeryEnabled = false;
	this.seasonalStationery = false;
	this.spellCheck = false;
	this.photoToolbar = null;
	this.spellCheckCB = null;
	this.photoAlbumCB = null;
	this.expandPT = false;
	this.showPT = false;
	this.stationeryWindow = null;
	this.useAX = false;
	this.location = "us";
	this.iconVersion = "1";
	this.imageSize = 120;
	this.instantiated = false;
	this.Instantiate = RTEEditorInstantiate;
	this.GetText = RTEEditorGetText;
	this.SetText = RTEEditorSetText;
	this.GetHTML = RTEEditorGetHTML;
	this.SetHTML = RTEEditorSetHTML;
	this.Focus = RTEEditorFocus;
	this.SetDomain = SetDomain;
	this.SetBackgroundColor = RTEEditorSetBackgroundColor;
	this.GetBackgroundColor = RTEEditorGetBackgroundColor;
	this.RemoveBackgroundColor = RTEEditorRemoveBackgroundColor;
	this.SetBackgroundImage = RTEEditorSetBackgroundImage;
	this.GetBackgroundImage = RTEEditorGetBackgroundImage;
	this.RemoveBackgroundImage = RTEEditorRemoveBackgroundImage;
	this.SetForegroundColor = RTEEditorSetForegroundColor;
	this.GetForegroundColor = RTEEditorGetForegroundColor;
	this.RemoveForegroundColor = RTEEditorRemoveForegroundColor;
	this.SetFontFamily = RTEEditorSetFontFamily;
	this.GetFontFamily = RTEEditorGetFontFamily;
	this.RemoveFontFamily = RTEEditorRemoveFontFamily;
	this.SetFontSize = RTEEditorSetFontSize;
	this.GetFontSize = RTEEditorGetFontSize;
	this.RemoveFontSize = RTEEditorRemoveFontSize;
	this.SetStationeryButton = RTEEditorSetStationeryButton;
	this.SetStationeryEnabled = RTEEditorSetStationeryEnabled;
	this.SetSeasonalStationery = RTEEditorSetSeasonalStationery;
	this.SetSpellCheck = RTEEditorSetSpellCheck;
	this.SetUseAX = RTEEditorSetUseAX;
	this.SetSpellCheckCB = RTEEditorSetSpellCheckCB;
	this.SetDeleteThumbnailCB = RTEEditorSetDeleteThumbnailCB;
	this.SetEditPhotoCB = RTEEditorSetEditPhotoCB;
	this.SetEditBorderCB = RTEEditorSetEditBorderCB;
	this.SetDownloadBorderCB = RTEEditorSetDownloadBorderCB;
	this.SetEditLayoutCB = RTEPTSetEditLayoutCB;
	this.SetEditOptimizeCB = RTEEditorSetEditOptimizeCB;
	this.SetEditPhotoFrameCB = RTEEditorSetEditPhotoFrameCB;
	this.SetThumbnailCB = RTEEditorSetThumbnailCB;
	this.GetPhotoAlbumCB = RTEEditorGetPhotoAlbumCB;
	this.GetNumSelectedThumbnail = RTEEditorGetNumSelectedThumbnail;
	this.GetNumThumbnailsFromLocalDisk = RTEEditorGetNumThumbnailsFromLocalDisk;
	this.GetNumThumbnail = RTEEditorGetNumThumbnail;
	this.EnablePhotoToolbar	= RTEEditorEnablePhotoToolbar;
	this.EnableOptimize = RTEEditorEnableOptimize;
	this.ExpandPhotoToolbar = RTEEditorExpandPhotoToolbar;
	this.IsPhotoToolbarExpanded = RTEEditorIsPhotoToolbarExpanded;
	this.ShowPhotoToolbar = RTEEditorShowPhotoToolbar;
	this.ShowPhotoToolbarButtons = RTEEditorShowPhotoToolbarButtons;
	this.SetPhotoOptimize = RTEEditorSetPhotoOptimize;
	this.RefreshPhotoOptimize = RTEEditorRefreshPhotoOptimize;
	this.SetSavePhotosToYahoo = RTEEditorSetSavePhotosToYahoo;
	this.SetPhotoFrame = RTEEditorSetPhotoFrame;
	this.SetPhotoAlbums = RTEEditorSetPhotoAlbums;
	this.GetToolbarState = RTEEditorGetToolbarState;
	this.RestoreToolbarState = RTEEditorRestoreToolbarState;
	this.GetSaveToAlbumInfo = RTEEditorGetSaveToAlbumInfo;
	this.ResizeSelectedImages = RTEEditorResizeSelectedImages;
	this.InsertImage = RTEEditorInsertImage;
	this.GetSelectedImages=RTEEditorGetSelectedImages;
	this.GetPhotoMailFlags=RTEEditorGetPhotoMailFlags; 
	this.RefreshSelectedImages=RTEEditorRefreshSelectedImages;
	this.ViewHTMLSource = RTEEditorViewHTMLSource;
	this.Unload = RTEEditorUnload;
	this.GetComposition = RTEEditorGetComposition;
	this.GetDocument = RTEEditorGetDocument;
	this.Exec = RTEEditorExec;
	this.ShowStationery = RTEEditorShowStationery;
	this.InsertThumbnail = RTEEditorInsertThumbnail;
	this.DeleteThumbnail = RTEEditorDeleteThumbnail;
	this.ComposeControl = null;
	this.ComposeControlDocument = null;
	this.ComposeControlSelection = null;
	this.Selection = null;
	this.ThumbnailManager = new RTEThumbnailManager(this);
	this.Wrapper = null;
	this.DropCB = null;
	this.SetDropCB = RTEEditorSetDropCB;
	this.InsertThumbnailCB = null;
	this.SetInsertThumbnailCB = RTEEditorSetInsertThumbnailCB;
	this.SetFirstThumbnailInsertedCB = RTEEditorSetFirstThumbnailInsertedCB;                                      
	this.SetLastThumbnailDeletedCB = RTEEditorSetLastThumbnailDeletedCB;                              
	this.HandleDesignEvent = RTEEditorHandleDesignEvent;
	this.HandleHtmlDragStart = RTEEditorHandleHtmlDragStart;
	this.HandleHtmlDrag = RTEEditorHandleHtmlDrag;
	this.HandleHtmlDrop = RTEEditorHandleHtmlDrop;
	this.HandleDragDrop = RTEEditorHandleDragDrop;
	this.HandleHtmlOnCut = RTEEditorHandleHtmlOnCut;
	this.HandleHtmlOnCopy = RTEEditorHandleHtmlOnCopy;
	this.HandleComposeReady = RTEEditorHandleComposeReady;
	this.ComposeReadyCB = null;	
	this.SetComposeReadyCB = RTEEditorSetComposeReadyCB;
	this.RestoreThumbnails = RTEEditorRestoreThumbnails;
	this.UseWrapper = true;
	this.ShowWrapper = RTEEditorShowWrapper;
	this.HideWrapper = RTEEditorHideWrapper;
	this.HaveInsertionPoint = false;
	this.PhotoMailExpiration = null;
	this.SetPhotoMailExpiration = RTEEditorSetPhotoMailExpiration;
	this.SetLocation = RTEEditorSetLocation;
	this.SetIconVersion = RTEEditorSetIconVersion;
	this.GetThumbnails = RTEEditorGetThumbnails;
	this.DisplayThumbnailPropertiesCB = null;
	this.SetDisplayThumbnailPropertiesCB = RTESetDisplayThumbnailPropertiesCB;
	this.ThumbnailInsertionNode = null;
	this.SetThumbnailInsertionNode = RTESetThumbnailInsertionNode;
	this.SetBatchInsertionCB = RTESetBatchInsertionCB;
	this.SetBatchDeletetionCB = RTESetBatchDeletetionCB;
	this.PrepareThumbnailsForSend = RTEPrepareThumbnailsForSend;
	this.ComposeControlReady = false;
	this.FunctionQueue = [];
	this.QueueFunctionCall = RTEQueueFunctionCall;
	this.CallQueuedFunctions = RTECallQueuedFunctions;
	this.CallFunction = RTECallFunction;
	this.SetResetBorderCB = RTESetResetBorderCB;
	this.OpenWindow = RTEEditorOpenWindow;
	this.RefreshThumbnails = RTEEditorRefreshThumbnails;
	this.RemoveThumbnails = RTEEditorRemoveThumbnails;
	this.RefreshThumbnail = RTEEditorRefreshThumbnail;
	this.SetInitialFocus = RTEEditorSetInitialFocus;
	this.GetThumbnailCaptions = RTEEditorGetThumbnailCaptions;
    this.FarmPath = "";
    this.SetFarmPath = RTEEditorSetFarmPath;
    this.SetHeight = RTEEditorSetHeight;
}
                                            
function RTEEditorSetFarmPath (sFarmPath) {
 
    this.FarmPath = sFarmPath;

}

function RTEEditorGetThumbnailCaptions()
{
	var aThumbnails = this.ThumbnailManager.Thumbnails;
	
	if(aThumbnails.length > 0)
	{
		var aCaptions = new Array();
		var i = aThumbnails.length - 1;
		var oThumbnail = null;
		var oDocument = editor.GetDocument();
		var sCaption = "";
		
		if(oDocument)
		{
			do
			{
				oThumbnail = oDocument.getElementById(aThumbnails[i][0]);
                sCaption = ReplaceSpecialChars(oThumbnail.Caption.innerText);
                sCaption = sCaption.replace(/[\n\r]/gi,'');

                aCaptions.push(new Array(oThumbnail.Image.RealPath, sCaption));
			}
			while(i--);
			
			return aCaptions;
		}
		
		oDocument = null;
	}
}

function RTEEditorSetInitialFocus()
{
    try
    {
    	var oDocument = this.GetDocument();
    	oDocument.body.focus();
	
    	var oTextRange = oDocument.body.createTextRange();

		oTextRange.select();
		oTextRange.collapse();
		oTextRange.select();
    }
    catch(e)
    {
        this.QueueFunctionCall("SetInitialFocus");
    }
}

function RTEEditorRemoveThumbnails()
{
	this.ThumbnailManager.RemoveThumbnails();
}

function RTEEditorOpenWindow(p_sURL, p_sName, p_sFeatures, p_bReplace)
{
	var oWindow = this.ComposeControl.open(p_sURL, p_sName, p_sFeatures, p_bReplace);
	return oWindow;
}

function RTEQueueFunctionCall(p_oFunction, p_aArguments)
{
	this.FunctionQueue.push(new FunctionCall(p_oFunction, p_aArguments));
}

function RTECallQueuedFunctions()
{
	for(var i=0; i<this.FunctionQueue.length; i++) this.CallFunction(this.FunctionQueue[i]);
}

function RTECallFunction(p_oFunctionCall)
{
	var sFunction = "this[p_oFunctionCall.Function](";
	
	if(p_oFunctionCall.Arguments && p_oFunctionCall.Arguments.length > 0)
	{
		for(var i=0; i<p_oFunctionCall.Arguments.length; i++) sFunction += "p_oFunctionCall.Arguments[" + i + "],";
		sFunction = sFunction.substring(0,sFunction.length-1);
	}
	
	sFunction += ");";

	eval(sFunction);	
}

function RTEPrepareThumbnailsForSend()
{
	this.ThumbnailManager.PrepareThumbnailsForSend();
}

function RTESetBatchInsertionCB(p_oObject)
{
	this.ThumbnailManager.SetBatchInsertionCB(p_oObject);
}

function RTESetBatchDeletetionCB(p_oObject)
{
	this.ThumbnailManager.SetBatchDeletetionCB(p_oObject);
}

function RTESetThumbnailInsertionNode()
{
	if(this.ComposeControlDocument.getElementById("rtethumbnailinsertionnode"))
	{
		var oDIV = this.ComposeControlDocument.getElementById("rtethumbnailinsertionnode");
		this.ThumbnailInsertionNode = oDIV;
		return oDIV;
	}
	else
	{
		var oMessageBody = (this.UseWrapper && this.Wrapper.Visible) ? this.Wrapper.Content : this.ComposeControlDocument.body;
	
		var oBRTop = this.ComposeControlDocument.createElement("br");
		var oBRBottom = this.ComposeControlDocument.createElement("br");

		var oDIV = this.ComposeControlDocument.createElement("div");
		oDIV.id = "rtethumbnailinsertionnode";

		oMessageBody.appendChild(oBRTop);
		oMessageBody.appendChild(oDIV);
		oMessageBody.appendChild(oBRBottom);	
		
		this.ThumbnailInsertionNode = oDIV;

		return oDIV;	
	}
}

function RTESetDisplayThumbnailPropertiesCB(p_oObject)
{
	if(!this.DisplayThumbnailPropertiesCB) this.DisplayThumbnailPropertiesCB = new Array();
	this.DisplayThumbnailPropertiesCB.push(p_oObject);
}

function RTEEditorHandleHtmlOnCut(p_oEvent)
{
	var oTextRange = this.ComposeControlSelection.createRange();
	
	if(oTextRange && oTextRange.htmlText)
	{
		var oRegEx = new RegExp(this.ThumbnailManager.ThumbnailIdPrefix+"1_[0-9]+", "g");
		var aMessageThumbnailIds = oTextRange.htmlText.match(oRegEx);

		if(aMessageThumbnailIds)
		{
			alert(rte_i18n_CutBlockedText);
			this.ComposeControlSelection.empty();
			this.ComposeControl.EventHandled(true);
		}
	}
}		

function RTEEditorHandleHtmlOnCopy(p_oEvent)
{
	var oTextRange = this.ComposeControlSelection.createRange();
	
	if(oTextRange && oTextRange.htmlText)
	{
		var oRegEx = new RegExp(this.ThumbnailManager.ThumbnailIdPrefix+"1_[0-9]+", "g");
		var aMessageThumbnailIds = oTextRange.htmlText.match(oRegEx);

		if(aMessageThumbnailIds)
		{
			alert(rte_i18n_CopyBlockedText);
			this.ComposeControlSelection.empty();
			this.ComposeControl.EventHandled(true);
		}
	}
}

function RTEEditorShowWrapper()
{
	this.UseWrapper = true;
	if(this.ThumbnailManager.Thumbnails.length > 0 && !this.Wrapper.Visible) this.Wrapper.Show();
}

function RTEEditorHideWrapper()
{
	this.UseWrapper = false;
	if(this.Wrapper.Visible) this.Wrapper.Hide();
}

function RTEEditorSetPhotoMailExpiration(p_sString)
{
	this.PhotoMailExpiration = p_sString;
}

function RTEEditorRestoreThumbnails()
{
	this.ThumbnailManager.RestoreThumbnails();
	if(this.ThumbnailManager.Thumbnails.length > 0 && this.UseWrapper && !this.Wrapper.Visible) this.Wrapper.Show();
}

function RTEEditorSetComposeReadyCB(p_oObject) {

	if(!this.ComposeReadyCB) this.ComposeReadyCB = new Array();
	this.ComposeReadyCB.push(p_oObject);

}

function RTEEditorSetDropCB(p_oObject) {

	if(!this.DropCB) this.DropCB = new Array();
	this.DropCB.push(p_oObject);

}

function RTEEditorSetInsertThumbnailCB(p_oObject) {

	if(!this.InsertThumbnailCB) this.InsertThumbnailCB = new Array();
	this.InsertThumbnailCB.push(p_oObject);

}

function RTEEditorSetLastThumbnailDeletedCB(cb)
{
	this.ThumbnailManager.SetLastThumbnailDeletedCB(cb);
}

function RTEEditorSetFirstThumbnailInsertedCB(cb)
{
    this.ThumbnailManager.SetFirstThumbnailInsertedCB(cb);
}

function RTEEditorHandleComposeReady()
{
	if(this.ComposeControlReady == true) return;

    try
    {
        this.ComposeControl = document.all(RTE_EDITOR_COMPOSITION_PREFIX + this.id);
    	this.ComposeControlDocument = this.ComposeControl.GetDocument();
    	this.ComposeControlSelection = this.ComposeControlDocument.selection;
    	this.ThumbnailManager.StartRange = this.ComposeControlSelection.createRange();
    	this.ThumbnailManager.EndRange = this.ComposeControlSelection.createRange();
    }
    catch(e)
    {
    	this.ComposeControl = null;
    	this.ComposeControlDocument = null;
    	this.ComposeControlSelection = null;
    	this.ThumbnailManager.StartRange = null;
    	this.ThumbnailManager.EndRange = null;
        
        window.setTimeout("CallComposeReadyHandler("+this.id+")",100);
        
        return;
    }

	this.Wrapper = new RTEPhotoMailWrapper(this);
	if(this.ComposeReadyCB) {
		for(var i in this.ComposeReadyCB) {
			this.ComposeReadyCB[i]();
		}
	}
	this.ComposeControlReady = true;
	this.CallQueuedFunctions();
	this.ComposeControlDocument.body.style.fontFamily = RTE_EDITOR_DEFAULT_FONT_FAMILY;
	this.ComposeControlDocument.body.style.fontSize = RTE_EDITOR_DEFAULT_FONT_SIZE;
    this.ComposeControlDocument.body.id = this.id;
	
	this.ComposeControlDocument.attachEvent("onkeyup", Document_Keyup);

	var theDoc = rteEditorMap[this.id].ComposeControlDocument;
	if ( typeof document.all == "undefined" ) {
		var frameHeadElt = theDoc.getElementsByTagName ( "HEAD" ) [0];
		frameHeadElt.innerHTML = '<STYLE TYPE="text/css">\nP {margin:0px;}\n* {scrollbar-base-color:rgb(192,192,192);}\n</STYLE>';
	} else {
		var sheet = addStyleSheet ( theDoc );
		addStylesheetRule ( sheet, "P", "margin:0px;" );
	//	if ( gIeVersion > 5 ) {
	//		addStylesheetRule ( sheet, "*", "scrollbar-base-color:#D4D5CB;" );
	//	}
	}

}

function RTEEditorHandleDesignEvent(p_nMethod, p_sDispid, p_oEvent, p_oElement) {
	
	if(!this.ComposeControlReady) return;

	if(p_nMethod == 8) return;

	var sThumbnailPrefix = this.ThumbnailManager.ThumbnailIdPrefix;
	var sWrapperPrefix = this.Wrapper.IdPrefix;

	if(p_oEvent.srcElement && p_oEvent.srcElement.id.substr(0, sThumbnailPrefix.length) == sThumbnailPrefix)
	{
		var aParts = p_oEvent.srcElement.id.split("_");
		var oThumbnail = this.ComposeControlDocument.getElementById(sThumbnailPrefix + "1_" + aParts[1]);
		if(aParts && aParts.length == 2 && oThumbnail) oThumbnail.HandleDesignEvent(p_oEvent, p_oElement);
	}
	else if(this.Wrapper.Visible)
	{
		if(p_oEvent.srcElement && p_oEvent.srcElement.id.substr(0, sWrapperPrefix.length) == sWrapperPrefix) this.Wrapper.HandleDesignEvent(p_oEvent, p_oElement);
		else this.Wrapper.Content.HandleDesignEvent(p_oEvent, p_oElement);			
	}
	else
	{
		var bScrollbar = (p_oEvent.srcElement && p_oEvent.srcElement.tagName == "BODY" && (p_oEvent.clientX > p_oEvent.srcElement.clientWidth || p_oEvent.clientY > p_oEvent.srcElement.clientHeight)) ? true : false;

		switch(p_oEvent.type)
		{
			case "mousedown":
			
				HideMenu();
				this.HaveInsertionPoint = true;
			
			break;
			
			case "mousemove":

				if(bScrollbar) this.ComposeControl.SetCursor("IDC_ARROW");
				else
				{
					if(this.ThumbnailManager.Drag)
					{
						if(p_oEvent.button == 1)
						{
							if(this.Wrapper.Visible) this.ComposeControl.SetCursor("IDC_NO");
							else
							{
								this.ComposeControl.SetCursor("IDC_DRAGDROP");
								var oTextRange = this.ComposeControlSelection.createRange();
		
								if(oTextRange && oTextRange.moveToPoint)
								{
									oTextRange.moveToPoint(p_oEvent.clientX, p_oEvent.clientY);
									oTextRange.select();
								}
							}
						}
						else
						{
							this.ThumbnailManager.ClearSelected();
							this.ComposeControl.SetCursor("IDC_IBEAM");
						}
					}
					else this.ComposeControl.SetCursor("IDC_IBEAM");
				}

			break;
			
			case "mouseout":

				this.ComposeControl.SetCursor("IDC_ARROW");

			break;
			
			case "mouseup":

				if(!this.Wrapper.Visible && !bScrollbar && this.ThumbnailManager.Drag)
				{
					var i = 0;
					var oTextRange = this.ComposeControlSelection.createRange();
					var aSelectedThumbnails = this.ThumbnailManager.GetSelectedDisplayOrder();
					var nSelectedThumbs = aSelectedThumbnails.length-1;
					var sThumbPlaceholders = "";
					
					do
					{
						sThumbPlaceholders += "<span id=\"thumbplaceholder"+i+"\"></span>";
						i++;
					}
					while(i<=nSelectedThumbs);
				
					oTextRange.pasteHTML(sThumbPlaceholders);

					i = 0;

					do
					{
						this.ComposeControlDocument.getElementById("thumbplaceholder"+i).replaceNode(this.ComposeControlDocument.getElementById(aSelectedThumbnails[i]).removeNode(true));
						i++;
					}
					while(i<=nSelectedThumbs);

					this.ThumbnailManager.ClearSelected();
					this.ComposeControl.SetCursor("IDC_IBEAM");
				}
				
				if(!p_oEvent.ctrlKey && this.ThumbnailManager.Selected.length != 0) this.ThumbnailManager.ClearSelected();
				
			break;
			
			case "keyup":
				
				this.HaveInsertionPoint = true;
				
				if(this.ThumbnailManager.Thumbnails.length > 0)
				{
					var oRegEx = new RegExp(this.ThumbnailManager.ThumbnailIdPrefix+"1_[0-9]+", "g");
					var aMessageThumbnailIds = this.ComposeControlDocument.body.innerHTML.match(oRegEx);
					
					if(aMessageThumbnailIds)
					{
						if(aMessageThumbnailIds.length < this.ThumbnailManager.Thumbnails.length)
						{
							var sMessageThumbnailIds = aMessageThumbnailIds.toString();
							
							for(var i in this.ThumbnailManager.Thumbnails)
							{
								if(sMessageThumbnailIds.indexOf(this.ThumbnailManager.Thumbnails[i][0]) == -1)
								{
									this.ThumbnailManager.DeleteThumbnail(this.ThumbnailManager.Thumbnails[i][0]);
								}
							}
						}
					}
					else this.ThumbnailManager.DeleteThumbnail();
				}

			break;
			
		} // end switch
	}
}
			
function Document_Keyup(p_oEvent)
{
	var nOff = 0;
	var nScollPos = 0;
	var nComposeScollPos = 0;
	var editorObjectIndex = findParentObjectIndex( p_oEvent.srcElement );	
	
	//
	// here, get the current Scroll bar positions.
	nScrollPos = document.body.scrollTop + document.body.clientHeight -
		(document.body.offsetHeight - document.body.clientHeight);
	var nCarPos = ylib_getPageY( rteEditorMap[editorObjectIndex].ComposeControl );
	var nBottomCompose = nCarPos;
	var doc = rteEditorMap[editorObjectIndex].ComposeControlDocument;
	if ( doc ) {
		nBottomCompose += doc.body.clientHeight;
		var car = doc.selection.createRange();
		nOff = car.offsetTop;// + doc.body.scrollTop;
		nCarPos += nOff;
		
		//
		// test to see if need to scroll down.
		//
		if (( nCarPos > nScrollPos ) && ( nBottomCompose > nCarPos )) {
			// need to scroll down...
			window.scrollBy( 0, (nCarPos - nScrollPos) + 15 );
		} else if ( document.body.scrollTop > nCarPos ) {
			// need to scroll up...
			window.scrollBy( 0, (nCarPos - document.body.scrollTop) - 15 );
		}
	}
}

/*
 * There may be multiple instances of the editor.  We need to find which one
 * we're dealing with by finding the body tag that owns the object that
 * received the event.  
 */
function findParentObjectIndex( theObject )
{
	while( theObject != null ) {
		// The body tag's id contains the index into our editor array
		if ( theObject.tagName && theObject.tagName == "BODY" ) {
			return theObject.id;
		}
		theObject = theObject.parentNode;
	}
	return "";
}

function RTEEditorHandleHtmlDragStart(p_oEvent) {
	
	if(this.ComposeControl) this.Selection = this.ComposeControlSelection.createRange();
	else this.Selection = null;
	
}

function RTEEditorHandleHtmlDrag(p_nCursorX, p_nCursorY) {
	
	if(this.ComposeControl)
	{
		var oElement = this.ComposeControlDocument.elementFromPoint(p_nCursorX, p_nCursorY);
		
		if(oElement)
		{
			if(oElement.id) if(oElement.id.indexOf(this.ThumbnailManager.ThumbnailIdPrefix) != -1 || oElement.id.indexOf(this.Wrapper.IdPrefix) != -1) return;
			if(oElement.tagName == "BODY" && this.Wrapper.Visible) return;
		}	

		var oTextRange = this.ComposeControlSelection.createRange();

		if(oTextRange && oTextRange.moveToPoint)
		{
			oTextRange.moveToPoint(p_nCursorX, p_nCursorY);
			oTextRange.select();
		}
		else return;
	}
	else return;
	
}

function RTEEditorHandleHtmlDrop(p_nCursorX, p_nCursorY) {

	if(this.ComposeControl)
	{
		var oElement = this.ComposeControlDocument.elementFromPoint(p_nCursorX, p_nCursorY);
		
		if(oElement)
		{
			if(oElement.id) if(oElement.id.indexOf(this.ThumbnailManager.ThumbnailIdPrefix) != -1 || oElement.id.indexOf(this.Wrapper.IdPrefix) != -1) return;
			if(oElement.tagName == "BODY" && this.Wrapper.Visible) return;
		}

		var oTextRange = this.ComposeControlSelection.createRange();

		if(oTextRange && oTextRange.moveToPoint)
		{
			oTextRange.moveToPoint(p_nCursorX, p_nCursorY);
			oTextRange.select();
		}
		else return;

		var sSelection = ""; 

		if(this.Selection && this.Selection.htmlText.length > 0) sSelection = this.Selection.htmlText;
		else return;

		var sThumbnailPrefix = this.ThumbnailManager.ThumbnailIdPrefix;
		var oRegEx = new RegExp(sThumbnailPrefix+"1_[0-9]+", "g");
		var aMessageThumbnailIds = sSelection.match(oRegEx);			

		if(aMessageThumbnailIds)
		{
			oTextRange.pasteHTML(sSelection.replace((new RegExp(sThumbnailPrefix,"g")),"marker"));
			
			var aMarkers = this.ComposeControlDocument.body.innerHTML.match(/marker1_[0-9]+/g);

			if(aMarkers)
			{
				var i = aMarkers.length-1;

				do if(this.ComposeControlDocument.getElementById(aMessageThumbnailIds[i])) this.ComposeControlDocument.getElementById(aMarkers[i]).replaceNode(this.ComposeControlDocument.getElementById(aMessageThumbnailIds[i]));
				while(i--);
			}
		}
		else oTextRange.pasteHTML(sSelection);

		this.Selection.text = "";
	}
	else return;

}

function RTEEditorHandleDragDrop(p_sFilePath, p_nSizeKB, p_nCurrentFile, p_nTotalFiles) {

	if(this.ComposeControl)
	{
		if(this.DropCB) for(var i in this.DropCB) this.DropCB[i](p_sFilePath, p_nSizeKB, p_nCurrentFile, p_nTotalFiles);
		this.ComposeControl.EventHandled(true);
	}
	else return;

}

// ---------- Style sheet utilities


// add a new stylesheet to the document
function addStyleSheet ( doc, id )
{
	if ( id != null )
		removeStyleSheet ( doc, id );
	
	var styleElt = doc.createElement( "STYLE" );
	if ( id != null )
		styleElt.id = id;
	doc.getElementsByTagName( "HEAD" ).item( 0 ).appendChild( styleElt );
	return doc.styleSheets[ doc.styleSheets.length-1 ];
}

// add a new stylesheet to the document
function removeStyleSheet ( doc, id ) {
	var sheets = doc.getElementsByTagName( "STYLE" );
	var n;  // for munger;
	for ( var i=0, n=sheets.length; i<n; ++i ) {
		if ( sheets[i].id == id ) {
			sheets[i].parentNode.removeChild ( sheets[i] );
			return sheets[i];
		}
	}
	return null;
}

// add a new rule to a stylesheet; this API is very
// different between IE and Mozilla
function addStylesheetRule ( styleSheet, name, styles )
{
	// generally we prefer "can we do X?" tests,
	// versus "what browser are we running?" tests 
	if ( typeof styleSheet.addRule != "undefined" )
		styleSheet.addRule( name, styles );
	else if ( typeof styleSheet.insertRule != "undefined" )
		styleSheet.insertRule( name + " { " + styles + " }", styleSheet.cssRules.length );
}

function RTEEditorInstantiate()
{
	if (this.instantiated) {
		return;
	}
	this.id = this.idGenerator.GenerateID();
	rteEditorMap[this.id] = this;
	rteEditorIDGenerator = this.idGenerator;

	var html = "";
	html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" nowrap>";
	html += "<tr>";

	if(this.useAX)
	{
		html += "<td width=2% id=\"RTEPTBtn1"+this.id+"\" style=\"background-color:#B3B3B3;padding:1px 1px 0px 1px;display:none;\" nowrap>";

			html += "<table cellspacing=0 cellpadding=0 border=0>";
			html += "<tr>";
			html += "<td class=\"RTEToolbar\">";

				html += RTEUtilBeginScript();
				html += "var pmPTToggleButton = new RTEToggleButton(";
				html += "rteEditorIDGenerator,";
				html += "\"" + rte_i18n_PhotoMailToolsHoverText + "\",";
				html += "\"RTEEditorOnPMToolbar(" + this.id + ")\",";
				html += "\"<table height=28 cellpadding=0 cellspacing=0 border=0>";
				html += "<tr valign=middle>";
				html += "<td><img src=\\\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_pm_1.gif\\\" height=22 width=22 border=0></td>";
				html += "<td style=\\\"font:bold 11px verdana;\\\" nowrap>" + rte_i18n_PhotoMailToolsButtonText + "</td>";
				html += "<td><img src=\\\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_open_1.gif\\\" style=\\\"margin:0 5px;\\\" height=16 width=16 border=0></td>";
				html += "</tr>";
				html += "</table>\"";
				html += ");";
				html += "pmPTToggleButton.Instantiate();";
				html += RTEUtilEndScript();

			html += "</td>";
			html += "</tr>";
			html += "</table>";

		html += "</td>";
		html += "<td width=2 nowrap></td>";
		html += "<td style=\"background-color:#B3B3B3;padding:1px 1px 0px 1px;\">";
	}
	else  html += "<td style=\"background-color:#B3B3B3;padding:1px\">"
	
	html += "<table id=\"RTEToolbarTable"+this.id+"\" width=100% cellspacing=0 cellpadding=0>"
	html += "<tr>";
	html += "<td id=\"" + RTE_EDITOR_TOOLBAR_PREFIX + this.id + "\" class=\"RTEToolbar\">";
	html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
	html += "<tr>";

   html += "<td></td>";
	// cut, paste, copy
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var cutButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_Cut + "\",";
	html += "RTEEditorOnCut,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_cut_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "cutButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var copyButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_Copy + "\",";
	html += "RTEEditorOnCopy,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_copy_1.gif\",";
	html += "false,";	
	html += "\"" + this.id + "\"";
	html += ");";
	html += "copyButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var pasteButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_Paste + "\",";
	html += "RTEEditorOnPaste,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_paste_1.gif\",";
	html += "false,";	
	html += "\"" + this.id + "\"";
	html += ");";
	html += "pasteButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += "<div class=\"RTEDivider\"></div>";
	html += "</td>";
	// font
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var fontButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_FontFace + "\",";
	html += "RTEEditorOnFontDropDown,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_fontface_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "fontButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	// size 
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var sizeButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_FontSize + "\",";
	html += "RTEEditorOnSizeDropDown,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_fontsize_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "sizeButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	// bold, italic, underline
	html += "<td>";
	html += "<div class=\"RTEDivider\"></div>";
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var boldButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_Bold + "\",";
	html += "RTEEditorOnBold,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_bold_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "boldButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var italicButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_Italic + "\",";
	html += "RTEEditorOnItalic,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_italic_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "italicButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var underlineButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_Underline + "\",";
	html += "RTEEditorOnUnderline,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_uline_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "underlineButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += "<div class=\"RTEDivider\"></div>";
	html += "</td>";
	html += "<td></td>";
	html += "<td></td>";
	// smiley button
	html += "<td id=\"" + RTE_EDITOR_SMILEY_BUTTON_PREFIX + this.id + "\">";
	html += RTEUtilBeginScript();
	html += "var insertSmileyButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_InsertEmoticon + "\",";
	html += "RTEEditorOnStartInsertSmiley,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_smiley_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "insertSmileyButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	// insert weblink
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var createHyperlinkButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_CreateHyperlink + "\",";
	html += "RTEEditorOnCreateHyperlink,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_link_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "createHyperlinkButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += "<div class=\"RTEDivider\"></div>";
	html += "</td>";

	// insert image
	/*
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var insertImageButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_InsertImage + "\",";
	html += "\"RTEEditorOnInsertImage(" + this.id + ")\",";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_link_1.gif\"";
	html += ");";
	html += "insertImageButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += "<div class=\"RTEDivider\"></div>";
	html += "</td>";
	*/

	// alignment
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var alignmentButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_AlignText + "\",";
	html += "RTEEditorOnAlignment,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_justpd_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "alignmentButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	// bulleted list
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var bulletedListButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_List + "\",";
	html += "RTEEditorOnList,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_listpd_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "bulletedListButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += "<div class=\"RTEDivider\"></div>";
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var decreaseIndentButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_DecreaseIndent + "\",";
	html += "RTEEditorOnDecreaseIndent,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_ileft_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "decreaseIndentButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
	html += "<td>";
	html += RTEUtilBeginScript();
	html += "var increaseIndentButton = new RTEButton(";
	html += "rteEditorIDGenerator,";
	html += "\"" + rte_i18n_IncreaseIndent + "\",";
	html += "RTEEditorOnIncreaseIndent,";
	html += "\"\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tb_iright_1.gif\",";
	html += "false,";
	html += "\"" + this.id + "\"";
	html += ");";
	html += "increaseIndentButton.Instantiate();";
	html += RTEUtilEndScript();
	html += "</td>";
		    html += "<td></td>";
	html += "</tr>";
	html += "</table>";
	html += "</td>";
	html += "</tr>";
	html += "</table>" //RTE toolbar 
	html += "</tr>";

	//Photomail toolbar
	if (this.useAX)
	{
		html += "<tr id=RTEPTRow1" + this.id + "><td height=1><div id=\"RTEPTSpace1"+this.id+"\" style=\"height:1px;background-color:#B3B3B3;\"><div id=\"RTEPTSpace2"+this.id+"\" style=\"height:1px;\"><spacer type=\"block\" height=1></div></div></td><td height=1 bgcolor=\"#F6F6F6\"></td><td height=1 bgcolor=\"#B3B3B3\"></td></tr>";
		html += "<tr id=RTEPTRow2" + this.id + " style=\"display:none;\"><td height=2><div style=\"border-left:solid 1px #C7C7C7; border-right:solid 1px #C7C7C7; height:2px;background-color:#E6E6E6;\"><div style=\"border-left:solid 1px #fff;height:2px;\"><spacer type=\"block\" height=2></div></div></td><td height=2 bgcolor=\"#F6F6F6\"></td><td height=2 bgcolor=\"#F6F6F6\"></td></tr>";
		html += "<tr id=RTEPTRow3" + this.id + " style=\"display:none;\"><td height=1><div style=\"border-left:solid 1px #C7C7C7; border-right:solid 1px #C7C7C7; height:1px;background-color:#E6E6E6;\"><div style=\"border-left:solid 1px #fff;height:1px;\"><spacer type=\"block\" height=1></div></div></td><td height=1 bgcolor=\"#C7C7C7\"></td><td height=1 bgcolor=\"#C7C7C7\"></td></tr>";			
		html += "<tr id=RTEPTRow4" + this.id + " style=\"display:none;\">";
		html += "<td colspan=3 style=\"border-style:solid; border-color:#C7C7C7; border-width:0 1px 1px 1px;\">";

			html += RTEUtilBeginScript();
			html += "var rtePhotoToolbar = new RTEPhotoToolbar(";
			html += "rteEditorIDGenerator,";
			html += "\"" + rte_i18n_PhotoToolbar + "\"";
			html += ");";
			html += "rtePhotoToolbar.Instantiate();";
			html += "RTEEditorSetPhotoToolbar(" + this.id + ",rtePhotoToolbar)";
			html += RTEUtilEndScript();
		
		html += "</td>";
		html += "</tr>";
	}

	html += "<tr>";
	html += this.useAX ? "<td colspan=3>" : "<td>";

	if (this.useAX) {


	    html += "<object id=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" width=\"100%\" height=\"220\" classid=\"CLSID:E9277B43-B5F6-4801-B4C2-0F1B61496715\" style=\"margin-top:4px;\">";
	    html += "<PARAM name=\"DropFT\" value=\"*\">";
	    html += "<PARAM name=\"aspect\" value=\"150\">";
	    html += "<param name=\"intrnlproc\" value=\"y\">";
	    html += "<param name=\"menu\" value=\"1," + rte_i18n_ContextMenuItemText1 + "|2," + rte_i18n_ContextMenuItemText2 + "|3," + rte_i18n_ContextMenuItemText3 + "|4," + rte_i18n_ContextMenuItemText4 + "\">";
	    html += "<PARAM name=\"newimagelayout\" value=\"<img src='%s' width=%d height=%d alt='%s' id='imagetest'>\">";
	    html += "</object>";

		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"ComposeReady()\">";
		html += "SetEditorComposeReadyTimeout(" + this.id + ");";
		html += RTEUtilEndScript();

		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"DesignEvents(p_nMethod, p_sDispid, p_oEvent, p_oElement)\">";
		html += "rteEditorMap[" + this.id + "].HandleDesignEvent(p_nMethod, p_sDispid, p_oEvent, p_oElement);";
		html += RTEUtilEndScript();
		
		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"HtmlDragStart(p_oEvent)\">";
		html += "rteEditorMap[" + this.id + "].HandleHtmlDragStart(p_oEvent);";
		html += RTEUtilEndScript();
		
		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"HtmlDrag(p_nCursorX, p_nCursorY)\">";
		html += "rteEditorMap[" + this.id + "].HandleHtmlDrag(p_nCursorX, p_nCursorY);";
		html += RTEUtilEndScript();
		
		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"HtmlDrop(p_nCursorX, p_nCursorY)\">";
		html += "rteEditorMap[" + this.id + "].HandleHtmlDrop(p_nCursorX, p_nCursorY);";
		html += RTEUtilEndScript();

		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"DragDrop(p_sFilePath, p_nWidth, p_nHeight, p_nThumbWidth, p_nThumbHeight, p_nSizeKB, p_nCurrentFile, p_nTotalFiles)\">";
		html += "rteEditorMap[" + this.id + "].HandleDragDrop(p_sFilePath, p_nSizeKB, p_nCurrentFile, p_nTotalFiles);";
		html += RTEUtilEndScript();

		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"HtmlOnCut(p_oEvent)\">";
		html += "rteEditorMap[" + this.id + "].HandleHtmlOnCut(p_oEvent);";
		html += RTEUtilEndScript();

		html += "<" + RTEUtilScript() + " for=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" event=\"HtmlOnCopy(p_oEvent)\">";
		html += "rteEditorMap[" + this.id + "].HandleHtmlOnCopy(p_oEvent);";
		html += RTEUtilEndScript();		
	}
	else {
	    html += "<iframe id=\"" + RTE_EDITOR_COMPOSITION_PREFIX + this.id + "\" width=\"100%\" height=\"220\" style=\"margin-top:4px;\">";
	    html += "</iframe>";
	}
	
	html += "</td>";
	html += "</tr>";
	html += "</table>";
	html += RTEUtilBeginScript();
	html += "var " + RTE_EDITOR_IMAGE_CHOOSER_PREFIX + this.id + " = new RTEImageChooser(";
	html += "rteEditorIDGenerator,";
	html += "8, 5,";
	html += "18, 18,";
	html += "[";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/01.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/02.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/03.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/04.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/05.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/06.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/07.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/08.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/09.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/10.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/11.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/12.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/13.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/14.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/15.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/16.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/17.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/18.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/19.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/20.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/21.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/22.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/23.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/24.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/25.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/26.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/27.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/28.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/29.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/30.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/31.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/32.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/33.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/34.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/35.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/37.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/39.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/40.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/47.gif\",";
	html += "\"http://saisan7:8080/www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/tsmileys2/50.gif\"";
	html += "],";
	html += "RTEEditorOnEndInsertSmiley";
	html += ");";
	html += RTE_EDITOR_IMAGE_CHOOSER_PREFIX + this.id + ".SetUserData(" + this.id + ");";
	html += RTE_EDITOR_IMAGE_CHOOSER_PREFIX + this.id + ".Instantiate();";
	html += RTEUtilEndScript();
	html +="<iframe id='" + RTE_EDITOR_FONT_PREFIX + this.id + "' class=RTESelector width=125 height=235 marginwidth=0 marginheight=0 frameborder=0 scrolling=no style='top:30px;left:86px;display:none'></iframe>";
	html += "<iframe id='" + RTE_EDITOR_SIZE_PREFIX + this.id + "' class=RTESelector width=145 height=256 marginwidth=0 marginheight=0 frameborder=0 scrolling=no style='top:30px;left:114px;display:none'></iframe>";
	html += "<iframe id='" + RTE_EDITOR_ALIGN_PREFIX + this.id + "' class=RTESelector width=112 height=88 marginwidth=0 marginheight=0 frameborder=0 scrolling=no style='top:30px;left:344px;display:none'></iframe>";
	html += "<iframe id='" + RTE_EDITOR_LIST_PREFIX + this.id + "' class=RTESelector width=121 height=60 marginwidth=0 marginheight=0 frameborder=0 scrolling=no style='top:30px;left:372px;display:none'></iframe>";
	html += "<iframe id='" + RTE_EDITOR_FORE_PREFIX + this.id + "' class=RTESelector src='' width=168 height=186 frameborder=0 scrolling=no style='top:30px;left:230px;display:none;'></iframe>";
	html += "<iframe id='" + RTE_EDITOR_BACK_PREFIX + this.id + "' class=RTESelector src='' width=168 height=186 frameborder=0 scrolling=no style='top:30px;left:258px;display:none;'></iframe>";
	document.write(html);
	html = '';
	html += '<body style="font-family:' + RTE_EDITOR_DEFAULT_FONT_FAMILY + ';font-size:' + RTE_EDITOR_DEFAULT_FONT_SIZE + '">';
	html += '</body>';

	if (!this.useAX) {
		var theFrame = eval(RTE_EDITOR_COMPOSITION_PREFIX + this.id);
		
	    theFrame.document.designMode = "on";
	    theFrame.document.open();
	    theFrame.document.write(html);
	    theFrame.document.close();
	    theFrame.document.onclick = new Function("RTEEditorOnClick(" + this.id + ")");
        theFrame.document.body.id = this.id;
		
		var sheet = addStyleSheet ( theFrame.document );
		addStylesheetRule ( sheet, "P", "margin:0px;" );
	}

	RTEEditorInitDropDowns(this.id);
	rteEditorIDGenerator = null;
	this.instantiated = true;
}

function RTEEditorSetHeight(p_sId)
{
    var sId = p_sId ? p_sId : (RTE_EDITOR_COMPOSITION_PREFIX + this.id);
    var nClientHeight = document.body.clientHeight;
    var nHeight = nClientHeight < RTE_EDITOR_MAX_HEIGHT ? nClientHeight : RTE_EDITOR_MAX_HEIGHT;

    document.getElementById(sId).height = nHeight;
}

function RTEEditorGetText()
{
	return this.GetDocument().body.innerText;
}

function RTEEditorSetText(text)
{
	text = text.replace(/\n/g, "<br>");
	text = "<div>" + text + "</div>";
	this.GetDocument().body.innerHTML = text;
}

function RTEEditorGetHTML()
{
	if(this.textMode) return this.GetDocument().body.innerText;
	else
	{
		var sMessage = (this.Wrapper && this.Wrapper.Visible) ? this.Wrapper.Content.innerHTML : this.GetDocument().body.innerHTML;
		return sMessage.toLowerCase() == "<div></div>" ? "" : sMessage;
	}
}

function RTEEditorSetHTML(html)
{
	if(this.textMode) 
	{
	    this.GetDocument().body.innerText = html;
	}
	else if(this.useAX)
	{
		if(!this.ComposeControlReady) 
		{
		    this.QueueFunctionCall("SetHTML",[html]);
		}
		else
		{
			html = "<div>" + html + "</div>";
			if(this.GetDocument() != null && this.GetDocument().body != null) {
			    this.GetDocument().body.innerHTML = html;
				if ( gReplyForward ) {
					this.SetInitialFocus();
				}
            } else {
			    this.QueueFunctionCall("SetHTML",[html]);
			}
		}
	}
	else //iframe
	{
		if(this.GetDocument() != null && this.GetDocument().body != null)
		    this.GetDocument().body.innerHTML = "<div>" + html + "</div>";
	}
}

function RTEEditorFocus()
{
	if(this.useAX)
    {
        try
        {
            this.GetDocument().body.focus();
        }
        catch(e)
        {
            this.QueueFunctionCall("Focus");            
        }
    }
	else this.GetComposition().focus();
}

function SetDomain(d)
{
	if(!this.useAX) this.GetDocument().domain = d;
}

function RTEEditorOnSpellCheck(id)
{
    var editor = rteEditorMap[id];
    if (editor.spellCheckCB) {
	editor.spellCheckCB();
    }
}

/*Show hide photomail toolbar*/
function RTEEditorOnPMToolbar(id)
{
	var oTd = document.all("RTEPTBtn1"+id);
	
	if(!oTd.ToolbarVisible)
	{
		oTd.style.backgroundColor = "#C7C7C7";

		var oTable = oTd.children(0);
		oTable.cells(0).style.backgroundImage = "url(tb_close_l_bg_1.gif)";
		oTable.cells(0).style.backgroundColor = "#E6E6E6";

		
		
		oTd.getElementsByTagName("img")[1].src = "tb_close_1.gif";

		document.getElementById("RTEPTSpace1"+id).style.borderLeft = "solid 1px #C7C7C7";
		document.getElementById("RTEPTSpace1"+id).style.borderRight = "solid 1px #C7C7C7";
		document.getElementById("RTEPTSpace1"+id).style.backgroundColor = "#E6E6E6";
		document.getElementById("RTEPTSpace2"+id).style.borderLeft = "solid 1px #fff";
		
		oTd.ToolbarVisible = true;
	}
	else
	{
		oTd.style.backgroundColor = "#B3B3B3";

		var oTable = oTd.children(0);
		oTable.cells(0).style.backgroundImage = "url(tb_open_l_bg_1.gif)";
		oTable.cells(0).style.backgroundColor = "#D7D7D7";

		oTd.getElementsByTagName("img")[1].src = "tb_open_1.gif";
		
		document.getElementById("RTEPTSpace1"+id).style.borderLeft = "";
		document.getElementById("RTEPTSpace1"+id).style.borderRight = "";
		document.getElementById("RTEPTSpace1"+id).style.backgroundColor = "#B3B3B3";
		document.getElementById("RTEPTSpace2"+id).style.borderLeft = "";
		
		oTd.ToolbarVisible = false;
	}

    var editor = rteEditorMap[id];
    if(editor.photoToolbar) editor.ExpandPhotoToolbar(!editor.expandPT);
}

function RTEEditorOnCut(id)
{
	RTEEditorFormat(id, "cut");
}

function RTEEditorOnCopy(id)
{
	RTEEditorFormat(id, "copy");
}

function RTEEditorOnPaste(id)
{
	RTEEditorFormat(id, "paste");
}

function RTEEditorOnBold(id)
{
	RTEEditorFormat(id, "bold");
}

function RTEEditorOnItalic(id)
{
	RTEEditorFormat(id, "italic");
}

function RTEEditorOnUnderline(id)
{
	RTEEditorFormat(id, "underline");
}

function RTEEditorOnAlignLeft(id)
{
	RTEEditorFormat(id, "justifyleft");
}

function RTEEditorOnCenter(id)
{
	RTEEditorFormat(id, "justifycenter");
}

function RTEEditorOnAlignRight(id)
{
	RTEEditorFormat(id, "justifyright");
}

function RTEEditorOnNumberedList(id)
{
	RTEEditorFormat(id, "insertOrderedList");
}

function RTEEditorOnBulletedList(id)
{
	RTEEditorFormat(id, "insertUnorderedList");
}

function RTEEditorOnDecreaseIndent(id)
{
    
	RTEEditorFormat(id, "outdent");
}

function RTEEditorOnIncreaseIndent(id)
{
    
	RTEEditorFormat(id, "indent");
}

function RTEEditorOnCreateHyperlink(id)
{
	if (!RTEEditorValidateMode(id)) {
		return;
	}
	RTEEditorHideAllDropDowns(id);
	var editor = rteEditorMap[id];
	var anchor = RTEEditorGetElement("A", editor.GetDocument().selection.createRange().parentElement());
	var link = prompt(rte_i18n_EnterLink, anchor ? anchor.href : "http://");
	if (link && link != "http://") {
		if (editor.GetDocument().selection.type == "None") {
			var range = editor.GetDocument().selection.createRange();
			range.pasteHTML('<A HREF="' + link + '"></A>');
			range.select();
		}
		else {
			RTEEditorFormat(id, "CreateLink", link);
		}
	}
}

function RTEEditorOnInsertImage(id)
{
	if (!RTEEditorValidateMode(id)) {
		return;
	}
	RTEEditorHideAllDropDowns(id);
	window.open("/ym/UploadImage?.rand=" + Math.random());
}

function RTEEditorOnStartInsertSmiley(id,element)
{
	if(!RTEEditorValidateMode(id)) return;

	if(eval(RTE_EDITOR_IMAGE_CHOOSER_PREFIX + id).IsShowing())
	{
		eval(RTE_EDITOR_IMAGE_CHOOSER_PREFIX + id).Hide();
	}
	else
	{
		RTEEditorHideAllDropDowns(id);
		var editor = rteEditorMap[id];
		editor.selectionRange = editor.GetDocument().selection.createRange();
		eval(RTE_EDITOR_IMAGE_CHOOSER_PREFIX + id).Show(element.offsetLeft, (element.offsetTop+30));
	}
}

function RTEEditorOnEndInsertSmiley(image, id)
{
    if (!RTEEditorValidateMode(id)) {
	return;
    }
    var imgTag = '<img src="' + image + '">';
    var editor = rteEditorMap[id];
    var bodyRange = editor.GetDocument().body.createTextRange();
    if (bodyRange.inRange(editor.selectionRange)) {
	editor.selectionRange.pasteHTML(imgTag);
	editor.Focus();
    }
    else {
	editor.GetDocument().body.innerHTML += imgTag;
	editor.selectionRange.collapse(false);
	editor.selectionRange.select();
    }
}

function RTEEditorOnFont(id, select)
{
	RTEEditorFormat(id, "fontname", select);
}

function RTEEditorOnSize(id, select)
{
	RTEEditorFormat(id, "fontsize", select);
}

function RTEEditorOnFontDropDown(id,element)
{
	if(!RTEEditorValidateMode(id)) return;
    RTEEditorToggleDropDown(id, RTE_EDITOR_FONT_PREFIX, element);
}

function RTEEditorOnSizeDropDown(id,element)
{
    if (!RTEEditorValidateMode(id)) {
	    return;
    }
    RTEEditorToggleDropDown(id, RTE_EDITOR_SIZE_PREFIX, element);
}

function RTEEditorOnForegroundTextColor(id,element)
{
	if (!RTEEditorValidateMode(id)) {
		return;
	}
	RTEEditorToggleDropDown(id, RTE_EDITOR_FORE_PREFIX, element);
}

function RTEEditorOnBackgroundTextColor(id,element)
{
	if (!RTEEditorValidateMode(id)) {
		return;
	}
	RTEEditorToggleDropDown(id, RTE_EDITOR_BACK_PREFIX,element);
}

function RTEEditorOnAlignment(id, element)
{
    if (!RTEEditorValidateMode(id)) {
	    return;
    }
    RTEEditorToggleDropDown(id, RTE_EDITOR_ALIGN_PREFIX, element);
}

function RTEEditorOnList(id,element)
{
    if (!RTEEditorValidateMode(id)) {
	    return;
    }
    RTEEditorToggleDropDown(id, RTE_EDITOR_LIST_PREFIX,element);
}

function RTEEditorOnViewHTMLSource(id, textMode)
{
	var editor = rteEditorMap[id];
	editor.ViewHTMLSource(textMode);
}

function RTEEditorOnClick(id)
{
	RTEEditorHideAllDropDowns(id);
}

function RTEEditorValidateMode(id)
{
	var editor = rteEditorMap[id];
	if (!editor.textMode) {
		return true;
	}
	alert("Please uncheck the \"View HTML Source\" checkbox to use the toolbars.");
	editor.Focus();
	return false;
}

function RTEEditorFormat(id, what, opt)
{
	if (!RTEEditorValidateMode(id)) {
		return;
	}
	if (opt == "removeFormat") {
		what = opt;
		opt = null;
	}
	RTEEditorHideAllDropDowns(id);
	var editor = rteEditorMap[id];
	editor.Focus();
	editor.Exec(what, opt);
}

function RTEEditorCleanHTML(id)
{
	var editor = rteEditorMap[id];
	var fonts = editor.GetDocument().body.all.tags("FONT");
	for (var i = fonts.length - 1; i >= 0; i--) {
		var font = fonts[i];
		if (font.style.backgroundColor == "#ffffff") {
			font.outerHTML = font.innerHTML;
		}
	}
}

function RTEEditorGetElement(tagName, start)
{
	while (start && start.tagName != tagName) {
		start = start.parentElement;
	}
	return start;
}

function RTEEditorSetBackgroundColor(color)
{
    this.GetDocument().body.style.backgroundColor = color;
    this.backgroundColor = color;
}

function RTEEditorGetBackgroundColor()
{
    return this.backgroundColor;
}

function RTEEditorRemoveBackgroundColor(color)
{
    this.GetDocument().body.style.backgroundColor = "";
    this.backgroundColor = "";
}

function RTEEditorSetBackgroundImage(url)
{
    if(this.GetDocument() && this.GetDocument().body)
        this.GetDocument().body.style.backgroundImage = 'url(' + url + ')';
    this.backgroundImage = url;
}

function RTEEditorGetBackgroundImage()
{
    return this.backgroundImage;
}

function RTEEditorRemoveBackgroundImage(url)
{
    this.GetDocument().body.style.backgroundImage = "none";
    this.backgroundImage = "";
}

function RTEEditorSetForegroundColor(color)
{
    this.GetDocument().body.style.color = color;
    this.foregroundColor = color;
}

function RTEEditorGetForegroundColor()
{
    return this.foregroundColor;
}

function RTEEditorRemoveForegroundColor(color)
{
    this.GetDocument().body.style.color = "";
    this.foregroundColor = "";
}

function RTEEditorSetFontFamily(fontFamily)
{
    if (fontFamily == "") {
	fontFamily = RTE_EDITOR_DEFAULT_FONT_FAMILY;
    }
    this.GetDocument().body.style.fontFamily = fontFamily;
    this.fontFamily = fontFamily;
}

function RTEEditorGetFontFamily()
{
    return this.fontFamily;
}

function RTEEditorRemoveFontFamily(font)
{
    this.GetDocument().body.style.fontFamily = RTE_EDITOR_DEFAULT_FONT_FAMILY;
    this.fontFamily = RTE_EDITOR_DEFAULT_FONT_FAMILY;
}

function RTEEditorSetFontSize(fontSize)
{
    if (fontSize == "") {
	fontSize = RTE_EDITOR_DEFAULT_FONT_SIZE;
    }
    this.GetDocument().body.style.fontSize = fontSize;
    this.fontSize = fontSize;
}

function RTEEditorGetFontSize()
{
    return this.fontSize;
}

function RTEEditorRemoveFontSize(font)
{
    this.GetDocument().body.style.fontSize = RTE_EDITOR_DEFAULT_FONT_SIZE;
    this.fontSize = RTE_EDITOR_DEFAULT_FONT_SIZE;
}

function RTEEditorSetStationeryButton(on)
{
    this.stationeryButton = on;
}

function RTEEditorSetStationeryEnabled(on)
{
    this.stationeryEnabled = on;
}

function RTEEditorSetSeasonalStationery(on)
{
    this.seasonalStationery = on;
}

function RTEEditorSetSpellCheck(on)
{
    this.spellCheck = on;
}

function RTEEditorSetUseAX(on)
{
    this.useAX = on;
}

function RTEEditorSetEditPhotoCB(cb)
{
    if(this.photoToolbar)
	this.photoToolbar.editPhotoCB = cb;
    else
	this.editPhotoCB = cb;
}

function RTEEditorSetDownloadBorderCB(cb)
{
    if(this.photoToolbar) this.photoToolbar.downloadBorderCB = cb;
    else this.downloadBorderCB = cb;
}

function RTEEditorSetEditBorderCB(cb)
{
    if(this.photoToolbar)
	this.photoToolbar.editBorderCB = cb;
    else
	this.editBorderCB = cb;
}

function RTESetResetBorderCB(cb)
{
    if(this.photoToolbar) this.photoToolbar.resetBorderCB = cb;
    else this.resetBorderCB = cb;
}

function RTEPTSetEditLayoutCB(cb)
{
	this.editLayoutCB = cb;
}

function RTEEditorSetEditOptimizeCB(cb)
{
    if(this.photoToolbar)
	this.photoToolbar.editOptimizeCB = cb;
    else
	this.editOptimizeCB = cb;
}

function RTEEditorSetEditPhotoFrameCB(cb)
{
    if(this.photoToolbar)
	this.photoToolbar.editPhotoFrameCB = cb;
    else
	this.editPhotoFrameCB = cb;
}

function RTEEditorSetThumbnailCB(selectCB, deselectCB)
{
	this.ThumbnailManager.SetFirstSelectionCB(selectCB);
	this.ThumbnailManager.SetLastDeselectionCB(deselectCB);
}

function RTEEditorGetPhotoAlbumCB(cb)
{
	this.photoAlbumCB = cb;
}

function RTEEditorEnablePhotoToolbar(enablePT)
{
    if(this.photoToolbar)
	this.photoToolbar.EnableButtons(enablePT);
    else
	this.enablePT = enablePT;
}

function RTEEditorEnableOptimize(enable)
{
    if(this.photoToolbar)
        this.photoToolbar.EnableOptimize(enable);
}

function RTEEditorShowPhotoToolbar(show)
{
	this.showPT = show;
	document.getElementById("RTEPTBtn1"+this.id).style.display = show ? "block" : "none";

	if(!show) document.getElementById("RTEPTRow"+this.id).style.display = "none";
}

function RTEEditorShowPhotoToolbarButtons(show)
{
  	this.photoToolbar.ShowButtons(show);
}

function RTEEditorExpandPhotoToolbar(expandPT)
{
	if(this.photoToolbar)
	{
		this.expandPT = expandPT;

		var oTd = document.all("RTEPTBtn1"+this.id);
		
		if(this.expandPT)
		{
			oTd.style.backgroundColor = "#C7C7C7";
	
			var oTable = oTd.children(0);
			oTable.cells(0).style.backgroundImage = "url(tb_close_l_bg_1.gif)";
			oTable.cells(0).style.backgroundColor = "#E6E6E6";
	
			document.getElementById("RTEPTSpace1"+this.id).style.borderLeft = "solid 1px #C7C7C7";
			document.getElementById("RTEPTSpace1"+this.id).style.borderRight = "solid 1px #C7C7C7";
			document.getElementById("RTEPTSpace1"+this.id).style.backgroundColor = "#E6E6E6";
			document.getElementById("RTEPTSpace2"+this.id).style.borderLeft = "solid 1px #fff";
		}
		else
		{
			oTd.style.backgroundColor = "#B3B3B3";

			var oTable = oTd.children(0);
			oTable.cells(0).style.backgroundImage = "url(tb_open_l_bg_1.gif)";
			oTable.cells(0).style.backgroundColor = "#D7D7D7";
	
			document.getElementById("RTEPTSpace1"+this.id).style.borderLeft = "";
			document.getElementById("RTEPTSpace1"+this.id).style.borderRight = "";
			document.getElementById("RTEPTSpace1"+this.id).style.backgroundColor = "#B3B3B3";
			document.getElementById("RTEPTSpace2"+this.id).style.borderLeft = "";
		}

		document.getElementById("RTEPTRow2"+this.id).style.display = this.expandPT ? "block" : "none";
		document.getElementById("RTEPTRow3"+this.id).style.display = this.expandPT ? "block" : "none";
		document.getElementById("RTEPTRow4"+this.id).style.display = this.expandPT ? "block" : "none";

		this.photoToolbar.Show(this.expandPT);
	}

	if(this.photoToolbar && this.photoToolbar.GoodAlbumFetch()) eval(this.photoAlbumCB)();
}

function RTEEditorIsPhotoToolbarExpanded()
{
	return this.expandPT;
}

function RTEEditorGetNumSelectedThumbnail()
{
	return this.ThumbnailManager.Selected.length;
}

function RTEEditorGetNumThumbnailsFromLocalDisk()
{
	return this.ThumbnailManager.ThumbnailsFromLocalDisk;
}

function RTEEditorGetNumThumbnail()
{
	var num = this.ThumbnailManager.Thumbnails.length;
	return typeof num == "undefined" ? 0 : num;
}

function RTEEditorSetPhotoOptimize(optimize)
{
    if(this.photoToolbar)
	this.photoToolbar.SetOptimize(optimize);
    else
	this.optimize = optimize;
}

function RTEEditorRefreshPhotoOptimize()
{
    if(this.photoToolbar)
        this.photoToolbar.RefreshOptimize();
}

function RTEEditorSetSavePhotosToYahoo(saveToYahoo)
{
    if(this.photoToolbar)
	this.photoToolbar.saveToYahoo = saveToYahoo;
    else
	this.saveToYahoo = saveToYahoo;
}

function RTEEditorSetPhotoFrame(photoFrame)
{
    this.photoFrame = photoFrame;
}

function RTEEditorSetPhotoAlbums(albums, defAlbumIndex)
{
    if(this.photoToolbar)
	this.photoToolbar.SetPhotoAlbums(albums, defAlbumIndex);
}

function RTEEditorGetToolbarState()
{
    if(this.photoToolbar)
        return this.photoToolbar.GetToolbarState();
    else
	return null;
}

function RTEEditorGetPhotoMailFlags()
{
	var flags = 0;

	if(this.photoToolbar) flags = this.photoToolbar.GetPhotoMailFlags();

	if(this.ThumbnailManager.CaptionEdited) flags = flags|0x100;
	
	return flags;
}

function RTEEditorRestoreToolbarState(state)
{
    this.ExpandPhotoToolbar(state.expanded);
    if(this.photoToolbar) this.photoToolbar.RestoreToolbarState(state);
	this.imageSize = state.layout;
}

function RTEEditorGetSaveToAlbumInfo()
{
    if(this.photoToolbar)
	return this.photoToolbar.GetSaveToAlbumInfo();
    else
	return null;
}

function RTEEditorSetSpellCheckCB(cb)
{
    this.spellCheckCB = cb;
}

function RTEEditorSetPhotoToolbar(id, toolbar)
{
	var editor = rteEditorMap[id];
	editor.photoToolbar = toolbar
	toolbar.setEditor(editor);

	if(typeof editor.editPhotoCB != "undefined")
	    editor.photoToolbar.editPhotoCB = editor.editPhotoCB;		

	if(typeof editor.editBorderCB != "undefined")
	    editor.photoToolbar.editBorderCB = editor.editBorderCB;		

	if(typeof editor.resetBorderCB != "undefined")
	    editor.photoToolbar.resetBorderCB = editor.resetBorderCB;				
		
	if(typeof editor.downloadBorderCB != "undefined")
	    editor.photoToolbar.downloadBorderCB = editor.downloadBorderCB;		

	if(typeof editor.editOptimizeCB != "undefined")
	    editor.photoToolbar.editOptimizeCB = editor.editOptimizeCB;
	if(typeof editor.editPhotoFrameCB != "undefined")
	    editor.photoToolbar.editPhotoFrameCB = editor.editPhotoFrameCB;

	if(typeof editor.optimize != "undefined")
	    editor.photoToolbar.SetOptimize(editor.optimize);		
	if(typeof editor.saveToYahoo != "undefined")
	    editor.photoToolbar.SetSaveToYahoo(editor.saveToYahoo);		
	if(typeof this.enablePT != "undefined")
	    editor.photoToolbar.EnableButtons(enablePT);		
}

function RTEEditorSetDeleteThumbnailCB(cb)
{
    this.ThumbnailManager.SetDeleteThumbnailCB(cb);
}

function RTEEditorInsertImage(image)
{
    var imgTag = '<img src="/ym/Upload?Data=' + image + '">';
    this.GetDocument().body.innerHTML += imgTag;
}

function RTEEditorViewHTMLSource(textMode)
{
    this.textMode = textMode;
    if (this.textMode) {
	    this.GetDocument().body.innerText = this.GetDocument().body.innerHTML;
    }
    else {
	    this.GetDocument().body.innerHTML = this.GetDocument().body.innerText;
    }
    this.Focus();
}

function RTEEditorUnload()
{
    if (this.stationeryWindow != null) {
	this.stationeryWindow.close();
    }
}

function RTEEditorShowDropDown(id, prefix, element)
{
	HideMenu();
	
    rteEditorActive = id;
    RTEEditorHideAllDropDowns(id);
    RTEEditorPrepareDropDownContents(id, prefix);
    eval(prefix + id).document.body.style.border = "#737373 solid 1px";
	
	var oMenu = d.all[prefix + id];
	oMenu.style.display = "block";
	oMenu.style.left = element.offsetLeft + "px";

	g_oMenu = oMenu;
	g_oMenu.Hide = function() {

		this.style.display = "none";

	}
}

function RTEEditorHideDropDown(id, prefix)
{
    d.all[prefix + id].style.display = "none";
}

function RTEEditorToggleDropDown(id, prefix, element)
{
    if (d.all[prefix + id].style.display == "none") {
	RTEEditorShowDropDown(id, prefix, element);
    }
    else {
	RTEEditorHideDropDown(id, prefix);
    }
}

function RTEEditorHideAllDropDowns(id)
{
    var editor = rteEditorMap[id];
    for (var i in editor.dropDownMap) {
	RTEEditorHideDropDown(id, i);
    }
    eval(RTE_EDITOR_IMAGE_CHOOSER_PREFIX + id).Hide();
}

function RTEEditorPrepareDropDownContents(id, prefix)
{
    var editor = rteEditorMap[id];
    var dropDown = editor.dropDownMap[prefix];
    if (dropDown.external) {
	if (d.all[prefix + id].src == "") {
	    d.all[prefix + id].src = dropDown.content;
	}
    }
    else {
	if (eval(prefix + id).document.body.innerHTML == "") {
	    eval(prefix + id).document.body.innerHTML = dropDown.content;
	}
    }
}

function RTEEditorInitDropDowns(id)
{
    var editor = rteEditorMap[id];
    editor.dropDownMap = new Object();
    editor.dropDownMap[RTE_EDITOR_FONT_PREFIX] = {
	external: false,
	content: (
	    "<div onclick=\"parent.RTEEditorHideDropDown(" + id + ", '" + RTE_EDITOR_FONT_PREFIX + "')\">"
	    +
	    "<table width=100% cellpadding=5 cellspacing=0 border=0>" 
	    +
	    (editor.location == "gb" || editor.location == "cn" ?
		"<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_CNFont1 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_CNFont1 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_CNFont1 + "</a></font></td></tr>"
		+
		"<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_CNFont2 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_CNFont2 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_CNFont2 + "</a></font></td></tr>"
		+
		"<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_CNFont3 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_CNFont3 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_CNFont3 + "</a></font></td></tr>"
		+
		"<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_CNFont4 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_CNFont4 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_CNFont4 + "</a></font></td></tr>"
		+
		"<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_CNFont5 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_CNFont5 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_CNFont5 + "</a></font></td></tr>"
		:
		"")
		+
		(editor.location == "kr" ?
    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_KRFont1 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_KRFont1 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_KRFont1 + "</a></font></td></tr>"
	    +
    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_KRFont2 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_KRFont2 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_KRFont2 + "</a></font></td></tr>"
    +
    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_KRFont3 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_KRFont3 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_KRFont3 + "</a></font></td></tr>"
    +
    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_KRFont4 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_KRFont4 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_KRFont4 + "</a></font></td></tr>"
    +
    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='" + rte_i18n_KRFont5 + "' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'" + rte_i18n_KRFont5 + "');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_KRFont5 + "</a></font></td></tr>"
	:
	"")
    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'arial');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Arial</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial narrow' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'arial narrow');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Arial Narrow</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial black' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'arial black');void(0);\" style=\"text-decoration:none;color:black;width:100%;width:100%;\">Arial Black</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='comic sans ms' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'comic sans ms');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Comic Sans MS</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='courier' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'courier');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Courier</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='system' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'system');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">System</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='times new roman' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'times new roman');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Times New Roman</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='verdana' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'verdana');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Verdana</a></font></td></tr>" 
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='wingdings' size=-1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnFont(" + id + ",'wingdings');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">Wingdings</a></font></td></tr>" 
	    +
	    "</table>"
	    +
	    "</div>"
	)
    };
    editor.dropDownMap[RTE_EDITOR_SIZE_PREFIX] = {
	external: false,
	content: (
	    "<div onclick=\"parent.RTEEditorHideDropDown(" + id + ", '" + RTE_EDITOR_SIZE_PREFIX + "')\">"
	    +
	    "<table width=100% cellpadding=5 cellspacing=0 border=0>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=1><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'1');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size1 + "</a></font></td></tr>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=2><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'2');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size2 + "</a></font></td></tr>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=3><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'3');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size3 + "</a></font></td></tr>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=4><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'4');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size4 + "</a></font></td></tr>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=5><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'5');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size5 + "</a></font></td></tr>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=6><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'6');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size6 + "</a></font></td></tr>"
	    +
	    "<tr><td onmouseover=\"this.style.backgroundColor='#dddddd';window.status='';return true;\" onMouseOut=\"this.style.backgroundColor='white';\"><font face='arial' size=7><a class=RTESelectItem href=\"javascript:parent.RTEEditorOnSize(" + id + ",'7');void(0);\" style=\"text-decoration:none;color:black;width:100%;\">" + rte_i18n_Size7 + "</a></font></td></tr>"
	    +
	    "</table>"
	    +
	    "</div>"
	)
    };
    editor.dropDownMap[RTE_EDITOR_ALIGN_PREFIX] = {
	external: false,
	content: (
	    "<div onclick=\"parent.RTEEditorHideDropDown(" + id + ", '" + RTE_EDITOR_ALIGN_PREFIX + "')\">"
	    +
	    "<table width=100% border=0 cellspacing=0 cellpadding=2>"
	    +
	    "<tr><td><a href=javascript:parent.RTEEditorOnAlignLeft(0);void(0); style=\"text-decoration:none;color:black;\"><img src=tb_justleft_1.gif style=\"border:1px solid white;\" onmouseover='this.style.border=\"1px solid black\";window.status=\"\";return true;' onmouseout='this.style.border=\"1px solid white\";\'></a></td><td style='font-family:Verdana;font-size:11px;'>" + rte_i18n_FlushLeft + "</td></tr>"
	    +
	    "<tr><td><a href=javascript:parent.RTEEditorOnCenter(0);void(0); style=\"text-decoration:none;color:black;\"><img src=tb_justctr_1.gif style=\"border:1px solid white;\" onmouseover='this.style.border=\"1px solid  black\";window.status=\"\";return true;' onmouseout='this.style.border=\"1px solid white\";\'></td><td style='font-family:Verdana;font-size:11px;'>" + rte_i18n_Centered + "</td></tr>"
	    +
	    "<tr><td><a href=javascript:parent.RTEEditorOnAlignRight(0);void(0); style=\"text-decoration:none;color:black;\"><img src=tb_justright_1.gif style=\"border:1px solid white;\" onmouseover='this.style.border=\"1px solid black\";window.status=\"\";return true;' onmouseout='this.style.border=\"1px solid white\";\'></td><td style='font-family:Verdana;font-size:11px;'>" + rte_i18n_FlushRight + "</td></tr>"
	    +
	    "</table>"
	    +
	    "</div>"
	)
    };
    editor.dropDownMap[RTE_EDITOR_LIST_PREFIX] = {
	external: false,
	content: (
	    "<div onclick=\"parent.RTEEditorHideDropDown(" + id + ", '" + RTE_EDITOR_LIST_PREFIX + "')\">"
	    +
	    "<table width=100% border=0 cellspacing=0 cellpadding=2>"
	    +
	    "<tr><td><a href=javascript:parent.RTEEditorOnNumberedList(0);void(0); style=\"text-decoration:none;color:black;\"><img src=tb_listnum_1.gif style=\"border:1px solid white;\" onmouseover='this.style.border=\"1px solid black\";window.status=\"\";return true;' onmouseout='this.style.border=\"1px solid white\";\'></a></td><td style='font-family:Verdana;font-size:11px;'>" + rte_i18n_NumberedList + "</td></tr>"
	    +
	    "<tr><td><a href=javascript:parent.RTEEditorOnBulletedList(0);void(0); style=\"text-decoration:none;color:black;\"><img src=tb_listblt_1.gif style=\"border:1px solid white;\" onmouseover='this.style.border=\"1px solid  black\";window.status=\"\";return true;' onmouseout='this.style.border=\"1px solid white\";\'></td><td style='font-family:Verdana;font-size:11px;'>" + rte_i18n_BulletedList + "</td></tr>"
	    +
	    "</table>"
	    +
	    "</div>"
	)
    };
    editor.dropDownMap[RTE_EDITOR_FORE_PREFIX] = {
	external: true,
	content: editor.FarmPath + "/Static?file=RTEForeColor.html&.rand=" + Math.random()
    };
    editor.dropDownMap[RTE_EDITOR_BACK_PREFIX] = {
	external: true,
	content: editor.FarmPath + "/Static?file=RTEBackColor.html&.rand=" + Math.random()
    };
}

function RTEEditorGetComposition()
{
    return this.useAX ? document.all[RTE_EDITOR_COMPOSITION_PREFIX + this.id] : eval(RTE_EDITOR_COMPOSITION_PREFIX + this.id);
}

function RTEEditorGetDocument()
{
    return this.useAX ? document.all[RTE_EDITOR_COMPOSITION_PREFIX + this.id].GetDocument() : eval(RTE_EDITOR_COMPOSITION_PREFIX + this.id).document;
}

function RTEEditorExec(what, opt)
{
    if (this.useAX) {
	document.all[RTE_EDITOR_COMPOSITION_PREFIX + this.id].Exec(
	    what, false, opt
	);
    }
    else {
	eval(RTE_EDITOR_COMPOSITION_PREFIX + this.id).document.execCommand(
	    what, false, opt
	);
    }
}

function RTEEditorShowStationery() 
{
	RTEEditorOnStationery( this.id );
}

function RTEEditorEvents(id, method, dispid, event, handled)
{
    if (event.type == "click") {
	RTEEditorOnClick(id);
    }
}

function RTEEditorRefreshThumbnail(p_sRealPath, p_sThumbnailPath, p_sWidth, p_sHeight)
{
	this.ThumbnailManager.RefreshThumbnail(p_sRealPath, p_sThumbnailPath, p_sWidth, p_sHeight);
}

function RTEEditorInsertThumbnail(thumbnailpath, realpath, caption, marker, origin, p_nCurrentFile, p_nTotalFiles)
{
	if(this.ComposeControl)
	{
		// Show the Wrapper
		if(!this.Wrapper.Visible && this.UseWrapper) this.Wrapper.Show();

		// Create the insertion point
		this.SetThumbnailInsertionNode();

		// Clear the contents of the insertion node if this is the first thumbnail
		// Doing so helps preserve the grid-like appearance
		if(this.ThumbnailManager.Thumbnails.length == 0 && this.ThumbnailInsertionNode.innerHTML.length != 0) 
		{
			this.ThumbnailInsertionNode.innerHTML = "";
		}
		
		// Create the thumbnail
		var oThumbnail = new RTEThumbnail(thumbnailpath, realpath, caption, marker, this, origin);

		// Insert the thumbnail into the body of the message
		this.ThumbnailInsertionNode.appendChild(oThumbnail);

		if(oThumbnail.Caption.offsetWidth > this.imageSize) oThumbnail.Caption.Resize();
		
		var sThumbnailId = oThumbnail.id;
		var sOrigin = oThumbnail.Origin;
		
		// Bring the thumbnail into view
		oThumbnail.scrollIntoView(false);

		oThumbnail = null;

		this.ThumbnailManager.Thumbnails.push(new Array(sThumbnailId,realpath,marker,origin));
		this.ThumbnailManager.ThumbnailCount++;

		if(sOrigin == "S") this.ThumbnailManager.ThumbnailsFromSearch++;
		if(sOrigin == "L") this.ThumbnailManager.ThumbnailsFromLocalDisk++;
		
		this.Wrapper.ToggleSearch((this.ThumbnailManager.ThumbnailsFromSearch == this.ThumbnailManager.Thumbnails.length));
		
		// Callbacks

		// Inserted
		if(this.InsertThumbnailCB) for(var i in this.InsertThumbnailCB) this.InsertThumbnailCB[i](realpath, width, height, caption, marker, this.ThumbnailManager);

		// First inserted
		if(this.ThumbnailManager.Thumbnails.length == 1) if(this.ThumbnailManager.FirstThumbnailInsertedCB) for(var i in this.ThumbnailManager.FirstThumbnailInsertedCB) this.ThumbnailManager.FirstThumbnailInsertedCB[i]();
		
		// Group inserted
		if(p_nCurrentFile == p_nTotalFiles && this.ThumbnailManager.BatchInsertionCB)
		{
			for(var i in this.ThumbnailManager.BatchInsertionCB) this.ThumbnailManager.BatchInsertionCB[i]();
		}

		return true;
	}
	else return false;
}

function RTEEditorDeleteThumbnail(path)
{
    this.ThumbnailManager.DeleteThumbnail(path,null,null,true);
}

function RTEEditorGetSelectedImages(selected)
{
	var images = selected == true ? this.ThumbnailManager.Selected : this.ThumbnailManager.Thumbnails;
	var imagesPath = new Array();
	
	for(var i in images) imagesPath.push(images[i][1]);
	
	return imagesPath;
}

function RTEEditorRefreshSelectedImages(srcArray, index, type)
{
	var selImages = this.GetNumSelectedThumbnail() > 0 ? this.ThumbnailManager.Selected : this.ThumbnailManager.Thumbnails;

	if(typeof index == "undefined" || index == null)
	{
		var j = 0;
		var sImageSrc = null;
		var oThumbnail = null;
		
		for(var i in selImages)
		{
			sImageSrc = srcArray[j++];

			if(sImageSrc.length > 0)
			{
				oThumbnail = this.ComposeControlDocument.getElementById(selImages[i][0]);
				oThumbnail.Image.src = sImageSrc;
	
				if(typeof type != "undefined" && type =="rotate")
				{	
					var w = oThumbnail.Image.width;
					var h = oThumbnail.Image.height;
					oThumbnail.Image.width = h;
					oThumbnail.Image.height = w;
				}
			}
		}
	}
	else if(srcArray.length > 0)
	{
		var oThumbnail = this.ComposeControlDocument.getElementById(selImages[index][0]);
		oThumbnail.Image.src = srcArray;
	}
}

function RTEEditorResizeSelectedImages(size, images)
{
	this.imageSize = parseInt(size);
	if(this.editLayoutCB) eval(this.editLayoutCB)(this.imageSize);
}

function RTEEditorRefreshThumbnails()
{
	var oThumbnail = null;
	var oImage = null;

	var aThumbnails = this.ThumbnailManager.Thumbnails;
	var i = aThumbnails.length-1;
	
	do
	{
		oThumbnail = this.ComposeControlDocument.getElementById(aThumbnails[i][0]);
	
		oImage = new Image();
		oImage.src = oThumbnail.Image.src;
	
	    oThumbnail.Image.src = oImage.src;
		oThumbnail.Image.width = oImage.width;
		oThumbnail.Image.height = oImage.height;

		oThumbnail = null;
		oImage = null;		
	}
	while(i--);
}

function RTEEditorSetLocation(location)
{
    this.location = location;
}

function RTEEditorSetIconVersion(iconVersion)
{
    this.iconVersion = iconVersion;
}

function RTEEditorGetThumbnails()
{
    return this.ThumbnailManager.GetDisplayOrder();
}
	function RTEIDGenerator(nextID)
	{
		this.nextID = nextID;
		this.GenerateID = RTEIDGeneratorGenerateID;
	}

	function RTEIDGeneratorGenerateID()
	{
		return this.nextID++;
	}



    var RTE_IMAGE_CHOOSER_FRAME_PREFIX = "rteImageChooserFrame";
    var RTE_IMAGE_CHOOSER_CONTENT_PREFIX = "rteImageChooserContent";
    var RTE_IMAGE_CHOOSER_IMG_PREFIX = "rteImageChooserImg";
    var RTE_IMAGE_CHOOSER_ICON_PREFIX = "rteImageChooserIcon";
    var rteImageChooserMap = new Object();

    function RTEImageChooser
    (
	    idGenerator,
	    numRows,
	    numCols,
	    imageWidth,
	    imageHeight,
	    images,
	    callback
    )
    {
	    this.idGenerator = idGenerator;
	    this.numRows = numRows;
	    this.numCols = numCols;
	    this.imageWidth = imageWidth;
	    this.imageHeight = imageHeight;
	    this.images = images;
	    this.callback = callback;
	    this.Instantiate = RTEImageChooserInstantiate;
	    this.Show = RTEImageChooserShow;
	    this.Hide = RTEImageChooserHide;
	    this.IsShowing = RTEImageChooserIsShowing;
	    this.SetUserData = RTEImageChooserSetUserData;
    }

    function RTEImageChooserInstantiate()
    {
	    this.id = this.idGenerator.GenerateID();
	    rteImageChooserMap[this.id] = this;
	    var width = (this.imageWidth + 4) * this.numCols + 2;
	    var height = (this.imageHeight + 4) * this.numRows + 2;
	    document.write(
		'<iframe id="' + RTE_IMAGE_CHOOSER_FRAME_PREFIX + this.id + '" class="RTESelector" marginwidth=0 marginheight=0 frameborder=0 scrolling=no width=' + width + ' height=' + height + ' style="display:none"></iframe>'
	    );
	    RTEImageChooserInitContent(this.id);
    }

    function RTEImageChooserShow(x, y)
    {
	    var f = eval(RTE_IMAGE_CHOOSER_FRAME_PREFIX + this.id);
	    if(f.document.body.innerHTML == "")
		{
			f.document.body.innerHTML = this.content;
	    }
	    f.document.body.style.border = "#737373 solid 1px";

		var oMenu = d.all[RTE_IMAGE_CHOOSER_FRAME_PREFIX + this.id];
		
	    oMenu.style.left = x + "px";
	    oMenu.style.top = y + "px";
	    oMenu.style.display = "block";
		
		g_oMenu = oMenu;
		g_oMenu.Hide = function() {
			
			this.style.display = "none";
			
		}
    }

    function RTEImageChooserHide()
    {
	    d.all[RTE_IMAGE_CHOOSER_FRAME_PREFIX + this.id].style.display = "none";
    }

    function RTEImageChooserIsShowing()
    {
	    return d.all[RTE_IMAGE_CHOOSER_FRAME_PREFIX + this.id].style.display == "block";
    }

    function RTEImageChooserSetUserData(userData)
    {
	this.userData = userData;
    }

    function RTEImageChooserOnMouseOver(id)
    {
	    var f = eval(RTE_IMAGE_CHOOSER_FRAME_PREFIX + id);
	    if (f.event.srcElement.tagName == "IMG") {
		    var underscore = f.event.srcElement.id.indexOf("_");
		    if (underscore != -1) {
			    var id = f.event.srcElement.id.substring(RTE_IMAGE_CHOOSER_IMG_PREFIX.length, underscore);
			    var index = f.event.srcElement.id.substring(underscore + 1);
			    f[RTE_IMAGE_CHOOSER_ICON_PREFIX + id + "_" + index].style.borderColor = "black";
		    }
	    }
    }

    function RTEImageChooserOnMouseOut(id)
    {
	    var f = eval(RTE_IMAGE_CHOOSER_FRAME_PREFIX + id);
	    if (f.event.srcElement.tagName == "IMG") {
		    var underscore = f.event.srcElement.id.indexOf("_");
		    if (underscore != -1) {
			    var id = f.event.srcElement.id.substring(RTE_IMAGE_CHOOSER_IMG_PREFIX.length, underscore);
			    var index = f.event.srcElement.id.substring(underscore + 1);
			    f[RTE_IMAGE_CHOOSER_ICON_PREFIX + id + "_" + index].style.borderColor = "white";
		    }
	    }
    }

    function RTEImageChooserOnClick(id)
    {
	    var f = eval(RTE_IMAGE_CHOOSER_FRAME_PREFIX + id);
	    if (f.event.srcElement.tagName == "IMG") {
		    var underscore = f.event.srcElement.id.indexOf("_");
		    if (underscore != -1) {
			    var id = f.event.srcElement.id.substring(RTE_IMAGE_CHOOSER_IMG_PREFIX.length, underscore);
			    var imageChooser = rteImageChooserMap[id];
			    imageChooser.Hide();
			    var index = f.event.srcElement.id.substring(underscore + 1);
			    if (imageChooser.callback) {
				    imageChooser.callback(imageChooser.images[index], imageChooser.userData);
			    }
		    }
	    }
    }

    function RTEImageChooserInitContent(id)
    {
	imageChooser = rteImageChooserMap[id];
	imageChooser.content = "";
	imageChooser.content += '<table id="' + RTE_IMAGE_CHOOSER_CONTENT_PREFIX + imageChooser.id + '" cellpadding=1 cellspacing=0 border=0>';
	for (var i = 0; i < imageChooser.numRows; i++) {
		imageChooser.content += '<tr>';
		for (var j = 0; j < imageChooser.numCols; j++) {
			imageChooser.content += '<td>';
			var k = i * imageChooser.numCols + j;
			imageChooser.content += '<div id="' + RTE_IMAGE_CHOOSER_ICON_PREFIX + imageChooser.id + '_' + k + '" style="border:white solid 1px;cursor:hand">';
			imageChooser.content += '<img src="' + imageChooser.images[k] + '" id="' + RTE_IMAGE_CHOOSER_IMG_PREFIX + imageChooser.id + '_' + k + '" width=' + imageChooser.imageWidth + ' height=' + imageChooser.imageHeight + ' onmouseover="parent.RTEImageChooserOnMouseOver(' + imageChooser.id + ')" onmouseout="parent.RTEImageChooserOnMouseOut(' + imageChooser.id + ')" onclick="parent.RTEImageChooserOnClick(' + imageChooser.id + ')">';
			imageChooser.content += '</div>';
			imageChooser.content += '</td>';
		}
		imageChooser.content += '</tr>';
	}
	imageChooser.content += '</table>';
    }



	var RTE_IMG_BUTTON_IMAGE_PREFIX = "rteImgButtonImage";
	var RTE_IMG_BUTTON_DIV_PREFIX = "rteImgButtonDiv";
	var rteImgButtonMap = new Object();

	function RTEImgButton
	(
		idGenerator,
		caption,
		action,
		reg,
		hov,
		psh,
		off
	)
	{
		this.idGenerator = idGenerator;
		this.caption = caption;
		this.action = action;
		this.reg = reg;
		this.hov = hov;
		this.psh = psh;
		this.off = off;
		this.enabled = true;
		this.instantiated = false;
		this.Instantiate = RTEImgButtonInstantiate;
		this.Enable = RTEImgButtonEnable;
	}

	function RTEImgButtonInstantiate()
	{
		this.id = this.idGenerator.GenerateID();
		rteImgButtonMap[this.id] = this;
		var html = "";
		html += '<div id="';
		html += RTE_IMG_BUTTON_DIV_PREFIX;
		html += this.id;
		html += '" class="RTEImgButtonNormal"';
		html += ' onselectstart="RTEImgButtonOnSelectStart()"';
		html += ' ondragstart="RTEImgButtonOnDragStart()"';
		html += ' onmousedown="RTEImgButtonOnMouseDown(this)"';
		html += ' onmouseup="RTEImgButtonOnMouseUp(this)"';
		html += ' onmouseout="RTEImgButtonOnMouseOut(this)"';
		html += ' onmouseover="RTEImgButtonOnMouseOver(this)"';
		html += ' onclick="RTEImgButtonOnClick(this)"';
		html += ' ondblclick="RTEImgButtonOnDblClick(this)"';
		html += '>';
		html += '<a href="javascript:void(\'\');" style="cursor:hand" onmouseover="window.status=\'' + this.caption + '\';return true;" onmouseout="window.status=window.defaultStatus;return true;">';
		html += '<img id="';
		html += RTE_IMG_BUTTON_IMAGE_PREFIX;
		html += this.id;
		html += '" src="';
		html += this.reg;
		html += '" title="';
		html += this.caption;
		html += '" border=0>';
		html += '</a>';
		html += '</div>';
		document.write(html);
		this.instantiated = true;
	}

	function RTEImgButtonEnable(enabled)
	{
		this.enabled = enabled;
		if (this.instantiated) {
			if (this.enabled) {
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + this.id].src = this.reg;
			}
			else if (this.off && this.off != "") {
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + this.id].src = this.off;
			}
		}
	}

	function RTEImgButtonOnSelectStart()
	{
		window.event.returnValue = false;
	}

	function RTEImgButtonOnDragStart()
	{
		window.event.returnValue = false;
	}

	function RTEImgButtonOnMouseDown(element)
	{
		if (event.button == 1)
		{
			var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
			var button = rteImgButtonMap[id];
			if (button.enabled)
			{
				RTEImgButtonPushButton(id);
			}
		}
	}

	function RTEImgButtonOnMouseUp(element)
	{
		if (event.button == 1)
		{
			var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
			var button = rteImgButtonMap[id];
			if (button.enabled)
			{
				RTEImgButtonReleaseButton(id);
			}
		}
	}

	function RTEImgButtonOnMouseOut(element)
	{
		var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteImgButtonMap[id];
		if (button.enabled)
		{
			RTEImgButtonReleaseButton(id);
		}
	}

	function RTEImgButtonOnMouseOver(element)
	{
		var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteImgButtonMap[id];
		if (button.enabled)
		{
			RTEImgButtonReleaseButton(id);
			if (button.hov && button.hov != "") {
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.hov;
			}
		}
	}

	function RTEImgButtonOnClick(element)
	{
		var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteImgButtonMap[id];
		if (button.enabled)
		{
			eval(button.action);
		}
	}

	function RTEImgButtonOnDblClick(element)
	{
		RTEImgButtonOnClick(element);
	}

	function RTEImgButtonPushButton(id)
	{
		var button = rteImgButtonMap[id];
		if (button.psh && button.psh != "") {
			document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.psh;
		}
	}

	function RTEImgButtonReleaseButton(id)
	{
		var button = rteImgButtonMap[id];
		document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.reg;
	}





function EatWord(s)
{
	for (var i = 0; i < s.length; i++) {
	    if (s.charAt(i) == " ") {
		return { word: s.substring(0, i + 1), rest: s.substring(i + 1) }
	    }
	}
	return { word: s, rest: "" }
}

function Flow(src,linelength)
{
	var max = linelength;
	var dst = "";
	var line = "";
	while (src.length) {
		var r = EatWord(src);
		if (line.length + r.word.length <= max) {
			line += r.word;
		}
		else {
			if (line != "") {
				dst += line;
				dst += "\n";
			}
			while (r.word.length > max) {
				dst += r.word.substring(0, max);
				dst += "\n";
				r.word = r.word.substring(max);
			}
			line = r.word;
		}
		src = r.rest;
	}
	if (line != "") {
		dst += line;
	}
	return dst;
}

var scrollID = 0;
var g_oComposeWindow = null;

function StopScroll()
{
    g_oComposeWindow = null;
    window.clearInterval(scrollID);
}

function ScrollComposeWindow(p_nDirection)
{
    var nY = (p_nDirection == 0) ? 50 : -50;
    g_oComposeWindow.scrollBy(0, nY);
}

function ResizeCaption(p_oCaption, p_nImageWidth, p_nLineLength)
{
	// Decrement the line length
	p_nLineLength--;

	// Remove any existing line breaks from the caption
	var sCaption = p_oCaption.innerText; //.replace(/[\n\r]/gi,'');
	
	// Reflow the text with the new line length
	p_oCaption.innerText = Flow(sCaption, p_nLineLength);
	
	// Check to see it fits, if not - reflow the caption text again
	if(p_oCaption.offsetWidth > p_nImageWidth) ResizeCaption(p_oCaption, p_nImageWidth, p_nLineLength);
}

function ReplaceSpecialChars(p_sString)
{
    var sString = p_sString;

    var regex = null;
	try {
		regex = new RegExp( "&(?!#)", "gi" );
		sString = sString.replace( regex, '&#38;' );
	} catch( e ) {
		sString = sString.replace( /&/gi, '&#38;' );
		sString = sString.replace( /&#38;(#\d+;)/gi, '&$1' );
	}
	
	sString = p_sString.replace(/</gi, '&#60;');
    sString = sString.replace(/>/gi, '&#62;');
    sString = sString.replace(/'/gi, '&#39;');
    sString = sString.replace(/"/gi, '&#34;');
    
    return sString;
}
function RTEPhotoMailWrapper(p_oEditor)
{
	// Private member variables
	
	var m_oEditor = p_oEditor;
	var m_sWrapperPrefix = "rtepmwrapper";
	var m_nId = 1;
	var m_sContentId = "rtewrappercontent" + m_oEditor.id;
	
	// Private methods

	function GenerateElementId() {
	
		return (m_sWrapperPrefix + (m_nId++) + "_" + m_oEditor.id);
	
	};

	var m_oWrapper = m_oEditor.ComposeControlDocument.createElement("div");
	m_oWrapper.id = GenerateElementId();
    m_oWrapper.style.width = "100%";    
    m_oWrapper.style.border = "solid 1px #93939B";
    m_oWrapper.style.float = "left"; 
	m_oWrapper.contentEditable = "false";

    // Header
    var sHTML = "<div id=\"" + GenerateElementId() + "\" style=\"width:100%; border-bottom:solid 1px #93939B; float:left; background-color:#F4F4F2;\">";
    sHTML += "<span id=\"" + GenerateElementId() + "\" style=\"width:auto; padding:5px; float:left;\">";

    sHTML += "<img id=\"" + GenerateElementId() + "\" src=\"" + rte_i18n_WrapperImageBranding + "\" style=\"border:0;\">";
    sHTML += "</span>";
    sHTML += "<span id=\"" + GenerateElementId() + "\" style=\"width:auto; padding:5px; float:right;\">";
    sHTML += "<font id=\"" + GenerateElementId() + "\" color=\"#000000\" face=\"Arial\" size=\"-2\">";
    sHTML += rte_i18n_WrapperText2 + rte_i18n_WrapperText3 + rte_i18n_WrapperText4 + rte_i18n_WrapperText5;
    sHTML += "</font>";    
    sHTML += "</span>";
    sHTML += "</div>";
    
    // Instructional text
    sHTML += "<div id=\"" + GenerateElementId() + "\" style=\"clear:both; border-bottom:solid 1px #D6D6CF; padding:5px; background-color:#f6f6f6;\">";
    sHTML += "<font id=\"" + GenerateElementId() + "\" color=\"#000000\" face=\"Arial\" size=\"-2\">";
    sHTML += rte_i18n_WrapperText6;
    sHTML += "</font>";
    sHTML += "</div>";
    
    // Main content area
    sHTML += "<div id=\"" + m_sContentId + "\" contenteditable=\"true\" style=\"font:" + RTE_EDITOR_DEFAULT_FONT_SIZE + " " + RTE_EDITOR_DEFAULT_FONT_FAMILY + "; padding:5px; background:url(phmail/wmbf_2.gif) top left repeat-x;\">";
    sHTML += "</div>";
    
    // Expiration information
    sHTML += "<div id=\"" + GenerateElementId() + "\" style=\"border-top:solid 1px #D6D6CF; padding:5px; background-color:#f6f6f6;\">";            
    sHTML += "<font id=\"" + GenerateElementId() + "\" color=\"#000000\" face=\"Arial\" size=\"-2\">";
    sHTML += rte_i18n_WrapperText7 + " " + m_oEditor.PhotoMailExpiration;
    sHTML += "</font>";    
    sHTML += "</div>";
    
    // Footer
    sHTML += "<div id=\"" + GenerateElementId() + "\" style=\"width:100%; border-top:solid 1px #93939B; float:left; background-color:#F4F4F2;\">";
    sHTML += "<span id=\"" + GenerateElementId() + "\" style=\"width:auto; padding:5px; float:left;\">";
    sHTML += "<font id=\"" + GenerateElementId() + "\" color=\"#000000\" face=\"Arial\" size=\"-2\">";
    sHTML += rte_i18n_WrapperText8;
    sHTML += "</font>";    
    sHTML += "</span>";
    sHTML += "<span id=\"" + GenerateElementId() + "\" style=\"width:auto; padding:5px; float:right;\">";
    sHTML += "<font id=\"" + GenerateElementId() + "\" color=\"#000000\" face=\"Arial\" size=\"-2\">";
    sHTML += rte_i18n_WrapperText9;
    sHTML += "</font>";    
    sHTML += "</span>";
    sHTML += "</div>";
	
	m_oWrapper.innerHTML = sHTML;

	// Public properties

	m_oWrapper.IdPrefix = m_sWrapperPrefix;
	m_oWrapper.Visible = false;
	m_oWrapper.Content = new RTEPhotoMailWrapperContent(m_oWrapper, m_sContentId, m_oEditor);
	m_oWrapper.Search = false;
	
	// Public methods

	m_oWrapper.Show = function() {
	
		this.Content.innerHTML = m_oEditor.ComposeControlDocument.body.innerHTML;
		m_oEditor.ComposeControlDocument.body.innerHTML = "";
		m_oEditor.ComposeControlDocument.body.appendChild(this);

		if(m_oEditor.ThumbnailManager.Thumbnails.length > 0) m_oEditor.ThumbnailManager.RestoreThumbnails();
		this.Visible = true;
		var oTextRange = m_oEditor.ComposeControlDocument.body.createTextRange();
		oTextRange.moveToElementText(this.Content);
		oTextRange.collapse();
		oTextRange.select();
		this.Content.focus();
		
	};

	m_oWrapper.ToggleSearch = function(p_bState) {

		if(p_bState)
		{
			if(!this.Search)
			{
                m_oWrapper.children(1).firstChild.innerText = rte_i18n_WrapperText10;  
                m_oWrapper.children(3).style.display = "none";
                m_oWrapper.children(0).children(1).firstChild.style.display = "none";

				this.Search = true;
			}
			else return;
		}
		else
		{
			if(this.Search)
			{
                m_oWrapper.children(1).firstChild.innerText = rte_i18n_WrapperText6;  
                m_oWrapper.children(3).style.display = "block";
                m_oWrapper.children(0).children(1).firstChild.style.display = "block";
				
				this.Search = false;
			}
			else return;
		}
	
	};
	
	m_oWrapper.Hide = function() {
		
		this.removeNode(true);
		m_oEditor.ComposeControlDocument.body.innerHTML = this.Content.innerHTML;
		this.Content.innerHTML = "";
		if(m_oEditor.ThumbnailManager.Thumbnails.length > 0) m_oEditor.ThumbnailManager.RestoreThumbnails();
		this.Visible = false;
		
	};
	
	m_oWrapper.HandleDesignEvent = function(p_oEvent, p_oElement) {

		switch(p_oEvent.type)
		{
			case "mousemove":

                StopScroll();
				if(m_oEditor.ThumbnailManager.Drag && p_oEvent.button == 1) 
                {
                    m_oEditor.ThumbnailManager.ScrollMessageBody(p_oEvent);                
                    m_oEditor.ComposeControl.SetCursor("IDC_NO");
                }
				else m_oEditor.ComposeControl.SetCursor("IDC_ARROW");
				m_oEditor.ComposeControl.EventHandled(true);

			break;
			
			case "mouseout":
			
				m_oEditor.ComposeControl.SetCursor("IDC_ARROW");

			break;

			case "mousedown":
				
                StopScroll();
				HideMenu();
				alert(rte_i18n_WrapperText1);
				this.Content.focus();
				m_oEditor.ComposeControl.EventHandled(true);

			break;
			
			case "mouseup":

				var oThumbnailManager = m_oEditor.ThumbnailManager;
				if(oThumbnailManager.Drag) oThumbnailManager.ClearSelected();
				m_oEditor.ComposeControl.EventHandled(true);

			break;
			
		}
		
	};
	
	return m_oWrapper;
}function RTEPhotoMailWrapperContent(p_oWrapper, p_sWrapperId, p_oEditor) {

	// Private member variables

	var m_oEditor = p_oEditor;
	var m_oContent = p_oWrapper.all(p_sWrapperId);

	// Public methods
	
	m_oContent.HandleDesignEvent = function(p_oEvent, p_oElement) {

		var bScrollbar = (p_oEvent.srcElement && p_oEvent.srcElement.tagName == "BODY" && (p_oEvent.clientX > p_oEvent.srcElement.clientWidth || p_oEvent.clientY > p_oEvent.srcElement.clientHeight)) ? true : false;

		switch(p_oEvent.type)
		{
			case "mousedown":
			
                StopScroll();
				HideMenu();
				
				this.HaveInsertionPoint = true;

				if(!bScrollbar && p_oEvent.srcElement && p_oEvent.srcElement.tagName == "BODY")
				{
					this.focus();
					p_oEditor.ComposeControl.EventHandled(true);
				}
			
			break;

			case "mousemove":
				
                StopScroll();

				if(bScrollbar) m_oEditor.ComposeControl.SetCursor("IDC_ARROW");
				else
				{
					if(m_oEditor.ThumbnailManager.Drag && p_oEvent.button == 1)
					{
                        m_oEditor.ThumbnailManager.ScrollMessageBody(p_oEvent);
                        
                        var oElement = m_oEditor.ComposeControlDocument.elementFromPoint(p_oEvent.clientX, p_oEvent.clientY);
						
						if(oElement)
						{
							if(oElement.id) 
							{
								if(oElement.id.indexOf(m_oEditor.ThumbnailManager.ThumbnailIdPrefix) != -1 || oElement.id.indexOf(m_oEditor.Wrapper.IdPrefix) != -1)
								{
									m_oEditor.ComposeControl.SetCursor("IDC_NO");
									return;
								}
							}
							
							if(oElement.tagName == "BODY" && m_oEditor.Wrapper.Visible)
							{
								m_oEditor.ComposeControl.SetCursor("IDC_NO");
								return;
							}
						}						

						m_oEditor.ComposeControl.SetCursor("IDC_DRAGDROP");

						var oTextRange = m_oEditor.ComposeControlSelection.createRange();
	
						if(oTextRange && oTextRange.moveToPoint)
						{
							oTextRange.moveToPoint(p_oEvent.clientX, p_oEvent.clientY);
							oTextRange.select();
						}
					}
					else
					{
						if(p_oEvent.srcElement.tagName == "BODY") m_oEditor.ComposeControl.SetCursor("IDC_ARROW");
						else m_oEditor.ComposeControl.SetCursor("IDC_IBEAM");
					}
				}
				
			break;

			case "mouseout":

				m_oEditor.ComposeControl.SetCursor("IDC_ARROW");

			break;

			case "mouseup":

				if(m_oEditor.ThumbnailManager.Drag)
				{
                    this.focus();

					var oElement = m_oEditor.ComposeControlDocument.elementFromPoint(p_oEvent.clientX, p_oEvent.clientY);
					
					if(oElement)
					{
						if(oElement.id) if(oElement.id.indexOf(m_oEditor.ThumbnailManager.ThumbnailIdPrefix) != -1 || oElement.id.indexOf(m_oEditor.Wrapper.IdPrefix) != -1) return;
						if(oElement.tagName == "BODY" && m_oEditor.Wrapper.Visible) return;
					}

					var i = 0;
					var oTextRange = m_oEditor.ComposeControlSelection.createRange();
					var aSelectedThumbnails = m_oEditor.ThumbnailManager.GetSelectedDisplayOrder();
					var nSelectedThumbs = aSelectedThumbnails.length-1;
					var sThumbPlaceholders = "";
					
					do
					{
						sThumbPlaceholders += "<span id=\"thumbplaceholder"+i+"\"></span>";
						i++;
					}
					while(i<=nSelectedThumbs);
				
					oTextRange.pasteHTML(sThumbPlaceholders);

					i = 0;

					do
					{
						m_oEditor.ComposeControlDocument.getElementById("thumbplaceholder"+i).replaceNode(m_oEditor.ComposeControlDocument.getElementById(aSelectedThumbnails[i]).removeNode(true));
						i++;
					}
					while(i<=nSelectedThumbs);

					m_oEditor.ThumbnailManager.ClearSelected();
					m_oEditor.ComposeControl.SetCursor("IDC_IBEAM");
				}
				
				if(!p_oEvent.ctrlKey && m_oEditor.ThumbnailManager.Selected.length != 0) m_oEditor.ThumbnailManager.ClearSelected();
				
			break;
			
			case "keyup":
				
				if(m_oEditor.ThumbnailManager.Thumbnails.length > 0)
				{
					var oRegEx = new RegExp(m_oEditor.ThumbnailManager.ThumbnailIdPrefix+"1_[0-9]+", "g");
					var aMessageThumbnailIds = m_oEditor.ComposeControlDocument.body.innerHTML.match(oRegEx);
					
					if(aMessageThumbnailIds)
					{
						if(aMessageThumbnailIds.length < m_oEditor.ThumbnailManager.Thumbnails.length)
						{
							var sMessageThumbnailIds = aMessageThumbnailIds.toString();
							
							var aThumbnailsToDelete = null;
							
							for(var i in m_oEditor.ThumbnailManager.Thumbnails)
							{
								if(sMessageThumbnailIds.indexOf(m_oEditor.ThumbnailManager.Thumbnails[i][0]) == -1)
								{
									if(!aThumbnailsToDelete) aThumbnailsToDelete = new Array();
									aThumbnailsToDelete.push(m_oEditor.ThumbnailManager.Thumbnails[i][0]);
								}
							}
							
							if(aThumbnailsToDelete)
							{
								for(var i in aThumbnailsToDelete)
								{
									m_oEditor.ThumbnailManager.DeleteThumbnail(
										aThumbnailsToDelete[i],
										(parseInt(i)+1),
										aThumbnailsToDelete.length
									);
								}
							}
						}
					}
					else
					{
						if(m_oEditor.ThumbnailManager.length == 1) m_oEditor.ThumbnailManager.DeleteThumbnail();
						else m_oEditor.ThumbnailManager.DeleteAllThumbnails();
					}
				}
				
			break;								

		}

	};
	
	return m_oContent;
}	function EditPhoto_Click(action, type, imagesPath)
	{
	    if(imagesPath == null || imagesPath.length == 0) return;
	    var browse = document.all.browse;
	    var newPath = new Array();
	    for(var i=0; i<imagesPath.length; i++)
    	{	
			var newImgPath = browse.rotate(imagesPath[i], type);    
	    	newPath.push(newImgPath);
      	}
	    editor.RefreshSelectedImages(newPath, null, "rotate");
	}

	function ResetBorder_Click(imagesPath)
	{
		if(imagesPath == null || imagesPath.length == 0) return;
	    var browse = document.all.browse;
	    var newPath = new Array();
	    var sPath = "";

		for(var i in imagesPath)
		{
			sPath = browse.ResetOverlay(imagesPath[i]);
			newPath.push(sPath);
		}
		
		editor.RefreshSelectedImages(newPath);
	}

	function EditLayout_Click(p_nSize)
	{
		var nSize = parseInt(p_nSize);
		var oBrowse = document.getElementById("browse");
  	    
		if(oBrowse)
		{
			oBrowse.SetParam("mailthumbsize",nSize);
			
			var aThumbnails = editor.ThumbnailManager.Thumbnails;
			
			var i = aThumbnails.length - 1;
			var oThumbnail = null;
			var sDimensions = "";
			var aDimensions = null;
			var sNewPath = "";
			
			do
			{
				// Get the new path for the thumbnail
				sNewPath = oBrowse.Rethumb(aThumbnails[i][1]);
				
				if(sNewPath.length)
				{
					// Get the new height and width
					sDimensions = oBrowse.ComputeAspectFile(sNewPath, nSize);
					
					aDimensions = sDimensions.split("|");
					
					oThumbnail = editor.ComposeControlDocument.getElementById(aThumbnails[i][0]);
					
					// Setup the thumbnail
					if(oThumbnail && aDimensions.length)
					{
						oThumbnail.ImageContainer.width = p_nSize;
						oThumbnail.ImageContainer.height = p_nSize;
						oThumbnail.Image.src = sNewPath;
						oThumbnail.Image.width = aDimensions[0];
						oThumbnail.Image.height = aDimensions[1];
						oThumbnail.Caption.Resize();
					}
				}
			}
			while(i--);
		}
	}

	function EditOptimize_Click(optimize)
	{   //0-no optimize, 1-med optimize, 2-high 
 	    optimize = parseInt(optimize); 	
	    var browse = document.all.browse;
	    if(typeof browse == "undefined" || browse == null) return;
	    browse.SetParam("optimize", optimize == 0 ? "n" : "y");
	    browse.SetParam("optsize", optimize == 0 ? 1 : optimize == 2 ? 360 : 480);
	}

	function EditPhotoFrame_Click(photoFrame)
	{
	    var browse = document.all.browse;
	    if (photoFrame) {
		editor.ShowWrapper();
		document.Compose.PhotoFrame.value = 1;
	    }
	    else {
		editor.HideWrapper();
		document.Compose.PhotoFrame.value = 0;
	    }
	}
	
	function EditBorder_Click(overlayFile, imagesPath)
	{
	    if(imagesPath == null || imagesPath.length == 0) return;
	    var browse = document.all.browse;
	    var newPath = new Array();
	    var sPath = "";

		for(var i in imagesPath)
		{
			sPath = browse.overlay(imagesPath[i], overlayFile);
			newPath.push(sPath);
		}
		
		editor.RefreshSelectedImages(newPath);
	}

	function ThumbnailProperties_Click(p_sFileName)
	{
		 var oBrowse = document.all.browse;

		 if(p_sFileName && p_sFileName.length > 0 && oBrowse)
		 {
		 	oBrowse.ShowProperties(p_sFileName);
		 }
		 else return;
	}

	function DownloadBorder(p_nIndex)
	{
	    var oBrowse = document.all.browse;

		if(oBrowse)
		{
			var aBorderInfo = rtePhotoMailBorders[p_nIndex];
			var sFileName = aBorderInfo[2];
			var sFiles = sFileName + ".png|" + sFileName + ".xml";
			var nKB = (parseInt(aBorderInfo[3])+1); // Add 1 to account for the size of the XML file
			
			if(aBorderInfo.length > 4)
			{
				sFileName = aBorderInfo[4];
				sFiles += "|" + sFileName + ".png|" + sFileName + ".xml";
				nKB += (parseInt(aBorderInfo[5])+1);
			}
			
			var bSuccess = oBrowse.DownloadBorders("http://us.i1.yimg.com/us.yimg.com/i/us/pim/r/photomail/borders", sFiles, nKB);
			
			return bSuccess;
		}
		else return false;
	}
	
	//Implemented this interface for phototoolbar
	function GetOverlayFiles()
	{
	    var browse = document.all.browse;
	    var files = browse.GetOverlayFiles();
	    files = files.split("|");
	    return files;
	}

	function GetPhotoAlbums()
	{
	    if (GoodBrowse())
	    {
	        var browse = document.all.browse;
	        var albums = browse.GetAlbums(true);
	        //albums="A*6932|B*6889|C*1b06|D*541e";
		//albums += "|PhotoMail Upload 2*6932|PhotoMail Upload 3*6889";
	        albums = albums.split("\01");
		var defAlbumIndex = GetDefaultAlbumIndex(albums);
		editor.SetPhotoAlbums(albums, defAlbumIndex);
	    }
	}

	function GetDefaultAlbumInfo()
	{
		var albumObj = null;
		if (GoodBrowse())
		{
			albumObj  = new Object();
			albumObj.save = true;
			var browse = document.all.browse;
			var albums = browse.GetAlbums(true);
			//albums="A*6932|B*6889|C*1b06|D*541e";
			//albums += "|PhotoMail Upload 2*6932|PhotoMail Upload 3*6889";
			albums = albums.split("\01");
			var index = GetDefaultAlbumIndex(albums);
			if(index == -1)
			{
				albumObj.name = rte_i18n_PhotoMailDefAlbum;
				albumObj.path = "";
				albumObj.isNew = true;
				albumObj.caption = rte_i18n_PhotoMailDefAlbum;		
			}
			else
			{
				var elem = albums[index].split("\02");
				albumObj.name = elem[0]; 
				albumObj.path = elem[1];
				albumObj.caption = elem[0];
				albumObj.isNew = false;
			}
		}
		return albumObj;
	}

        function GetDefaultAlbumIndex(albums)
        {
                var index = -1
                if(typeof albums == "undefined" || albums == "") return index;
            
                var num = 0;
                var prevNum = 0;
                var defAlbumfound = false;
                var noMoreDefalbum = false;
                var defaultAlbumName = rte_i18n_PhotoMailDefAlbum;
                
                for(var i=0; i<albums.length; i++)
                {
                    var elem = albums[i].split("\02");
                    if(!defAlbumfound && elem[0] == defaultAlbumName)
                    {
                        num = 0;
                        index = i;
                        defAlbumfound = true;
                    }
                    else 
		    {		
			if(defAlbumfound)
			{
			    var prefix = new RegExp("^"+rte_i18n_PhotoMailPrefix+"\\d{1,3}$","g");	
			    if(prefix.test(elem[0]))
			    {
				num = parseInt(elem[0].match(/\d{1,3}/g)[0]);
				if(num == prevNum+1) 
				    index = i;
				else
				    noMoreDefalbum = true;
			    }
			    else
				noMoreDefalbum = true;
			}
		    } 	
                    
                    if(defAlbumfound && noMoreDefalbum) break;
                    
                    if(defAlbumfound) prevNum = num;
                }
                return index;
        }       

	function SetSaveToYahooBrowseParam(save, path, caption, isNew)
	{
	    //alert("save="+save+"  path="+path+" caption="+caption+"  isNew="+isNew)
	    var browse = document.all.browse;
	    browse.SetParam ("phpermcap", "" );
	    browse.SetParam ("phpermpath", "" );
	    if(save)
	    {
		if(isNew)
		    browse.SetParam ("phpermcap", caption);
		else
		{
		    browse.SetParam ("phpermpath", path);
		    browse.SetParam ("phpermcap", caption);	
		}
	    }
	}

	//When first thumbnail is selected
	function FirstSelection_Click()
	{
	    //editor.EnablePhotoToolbar(true);
	}

	//When last thumbnail is unselected
	function LastUnSelection_Click()
	{
	    //editor.EnablePhotoToolbar(false);
	}

	function FirstThumbnailInserted()
	{
		editor.ExpandPhotoToolbar(true);
		editor.ShowPhotoToolbarButtons(true);
	}

	function LastThumbnailDeleted()
	{
		editor.ExpandPhotoToolbar(false);
		editor.ShowPhotoToolbarButtons(false);
	}

	function GetUploadSize()
	{
		var browse = document.all.browse;
		if(typeof browse == "undefined" || browse == null) return 0;
		var size = browse.EstimateUploadSize();
		return size;
	}

	function GetUploadTime()
	{
		var browse = document.all.browse;
		if(typeof browse == "undefined" || browse == null) return 0;
		var time = browse.EstimateUpload(56); 
		return time;
	}

	function BatchThumbnailInserted()
	{
		var num = editor.GetNumThumbnailsFromLocalDisk();
		editor.EnableOptimize(num == 0 ? false : true);
		if(num == 0)
		    editor.SetPhotoOptimize(-1);
		else
		    editor.RefreshPhotoOptimize();
	}	

	function BatchThumbnailDeleted()
	{
		var num = editor.GetNumThumbnailsFromLocalDisk();
		editor.EnableOptimize(num == 0 ? false : true);		    
		if(num == 0)
		    editor.SetPhotoOptimize(-1);
		else
		    editor.RefreshPhotoOptimize();
	}

	function ComposeReady()
	{
		document.getElementById("attachfiles").disabled = false;
		document.getElementById("insertphotos").disabled = false;	
	}

	function GetPhotomailHelpURL()
	{
		var browse = document.all.browse;
		return browse.GetParam("helpurl");
	}
var RTE_EDITOR_PT_TOOLBAR_PREFIX = "rtePhotoToolbar";
var rtePTMap = new Object();
var rtePTIDGenerator = null;

function RTEPhotoToolbar(idGenerator)
{
	this.editor  = null;
	this.overlay = false;
	this.optimize = -1;
	this.imageSize = 120;
	this.photoFrame = false;
	this.saveToYahoo = false;
	this.instantiated = false;
	this.albumsFetched = false;
	this.overlayFiles = new Array();
	this.idGenerator = idGenerator;
	this.editPhotoCB = null;
	this.editBorderCB = null;
	this.resetBorderCB = null;
	this.editOptimizeCB = null;
	this.editPhotoFrameCB = null;
	this.saveToYahooCB = null;
	this.RotatePhoto = RTEPTRotatePhoto;
	this.RestoreToolbarState = RTEPTRestoreToolbarState;
	this.GetToolbarState = RTEPTGetToolbarState
	this.GetPhotoMailFlags = RTEPTGetPhotoMailFlags;
	this.GetSaveToAlbumInfo = RTEPTGetSaveToAlbumInfo;
	this.SetPhotoAlbums = RTEPTSetPhotoAlbums;
	this.SetOptimize = RTEPTSetOptimize;
	this.SetLayout = RTEPTSetLayout;
	this.RefreshOptimize = RTEPTRefreshOptimize;
	this.SetSaveToYahoo = RTEPTSetSaveToYahoo;
	this.EnableButtons = RTEPTEnableButtons;
	this.EnableOptimize = RTEPTEnableOptimize;
	this.Show = RTEPTShow;
	this.ShowButtons = RTEPTShowButtons;
	this.setEditor = RTEPTSetEditor;
	this.GoodAlbumFetch = RTEPTGoodAlbumFetch;
	this.Instantiate = RTEPTInstantiate;
}

function RTEPTInstantiate()
{
	if(this.instantiated) return;
	
	this.id = this.idGenerator.GenerateID();
	rtePTMap[this.id] = this;
	rtePTIDGenerator = this.idGenerator;
	
	var divider = "<td align=center><div style=\"width:1px;height:30px;background-image:url(http://us.i1.yimg.com/us.yimg.com/i/us/pim/r/daredevil/v1/pt/sep_line_1.gif);\"><spacer type=\"block\" width=\"1\" height=\"30\"></div></td>";

	var html = "";
	
	html += "<table id=\"RTEPT"+this.id+"\" id=\"" + RTE_EDITOR_PT_TOOLBAR_PREFIX + this.id + "\" cellpadding=\"6\" cellspacing=\"0\" border=\"0\" width=100% style=\"border-left:1px solid #fff;background-color:#E6E6E6\">";
	html += "<tr>";
	html += "<td>";

		html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">";
		html += "<tr>";
		html += "<td colspan=\"2\">";

			// Begin panels

			html += "<table width=100% cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
			html += "<tr id=\"RTEPTEdit"+this.id+"\" style=\"display:block;\">";

			    html += "<td id='RTEPTUserMsg"+this.id+"' align=\"center\" style=\"padding:6px 0;display:block;font:bold 10px verdana;\">";
			    html += rte_i18n_PTUserMsg + " "+"<a href=\"javascript:RTEPTGetStarted(\'"+this.id+"\');\" style=\"text-decoration:underline;\">"+ rte_i18n_PTUserMsg2+"</a>";
			    html += "</td>";
			    html += "<td id='RTEPTButtons"+this.id+"' align=\"center\" style=\"padding:6px 0;display:none;\">";

			        html += "<table width=100% cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
			        html += "<tr>";

				// Begin layout
				
				html += "<td align=\"center\" >";
				html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				html += "<tr>";
				html += "<td colspan=3 align=center style=\"font:10px Verdana;\">" + rte_i18n_Layout + "</td>";
				html += "</tr>";
				html += "<tr>";
				
				// Layout small
				
				html += "<td align=right>";
				html += RTEUtilBeginScript();
				html += "var buttonRS = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_ResizeSmall + "\","; 
				html += "\"RTEPTResize(" + this.id + ",90)\","; 
				html += "\"phmail/tb_layout_a_up_1.gif\",";
				html += "\"phmail/tb_layout_a_dn_1.gif\",";
				html += "\"phmail/tb_layout_a_dis_1.gif\",";
				html += "\"phmail/tb_layout_a_dis_1.gif\",";
				html += "\"phmail/tb_layout_a_hov_1.gif\",";
				html += "\"\"";
				html += ");";
				html += "buttonRS.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				
				// Layout medium
				
				html += "<td align=center style=\"padding:0;\">";
				html += RTEUtilBeginScript();
				html += "var buttonRM = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_ResizeMedium + "\","; 
				html += "\"RTEPTResize(" + this.id + ",120)\","; 
				html += "\"phmail/tb_layout_b_up_1.gif\",";
				html += "\"phmail/tb_layout_b_dn_1.gif\",";
				html += "\"phmail/tb_layout_b_dis_1.gif\",";
				html += "\"phmail/tb_layout_b_dis_1.gif\",";
				html += "\"phmail/tb_layout_b_hov_1.gif\",";
				html += "\"\"";
				html += ");";
				html += "buttonRM.Instantiate();";
				html += "buttonRM.Toggle();";
				html += RTEUtilEndScript();
				html += "</td>";
				
				// Resize large
				
				html += "<td align=left>";
				html += RTEUtilBeginScript();
				html += "var buttonRLg = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_ResizeLarge + "\","; 
				html += "\"RTEPTResize(" + this.id + ",180)\","; 
				html += "\"phmail/tb_layout_c_up_1.gif\",";
				html += "\"phmail/tb_layout_c_dn_1.gif\",";
				html += "\"phmail/tb_layout_c_dis_1.gif\",";
				html += "\"phmail/tb_layout_c_dis_1.gif\",";
				html += "\"phmail/tb_layout_c_hov_1.gif\",";
				html += "\"\"";
				html += ");";
				html += "buttonRLg.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				html += "</tr>";
				html += "</table>";
				html += "</td>";		
				
				// End layout

				html += "<td width=6>&nbsp;</td>";

				//start border

				html += "<td align=\"center\" >";
				html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				html += "<tr>";
				html += "<td align=center nowrap style=\"font:10px Verdana;\">";
				html += "<span id='RTEPTBorder"+this.id+"' style=\"display:block;\">" + rte_i18n_BordersLabel + "</span>";
				html += "</td>";
				html += "</tr>";
				html += "<tr>";
				html += "<td align=center>";
				html += RTEUtilBeginScript();
				html += "var buttonB = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_BordersTooltip + "\","; 
				html += "\"RTEPTBorder(" + this.id + ")\","; 
 				html += "\"phmail/tb_borders_up_1.gif\",";
				html += "\"phmail/tb_borders_open_1.gif\",";
				html += "\"phmail/tb_borders_dis_1.gif\",";
				html += "\"phmail/tb_borders_dis_1.gif\",";
				html += "\"phmail/tb_borders_hov_1.gif\",";
				html += "\"phmail/tb_borders_open_hov_1.gif\"";								
				html += ");";
				html += "buttonB.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				html += "</tr>";
				html += "</table>";
				html += "</td>";
				
				//End border

				html += divider;

				// Begin Rotation
				
				html += "<td align=\"center\" >";
				html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				html += "<tr>";
				html += "<td colspan=2 align=center style=\"font:10px Verdana;\">" + rte_i18n_Rotate + "</td>";
				html += "</tr>";
				html += "<tr>";
		
				// Rotate CWW
				
				html += "<td align=right style=\"padding-right:3px;\">";
				html += RTEUtilBeginScript();
				html += "var buttonRL = new RTEImgButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_RotateLeft + "\","; 
				html += "\"RTEPTRotatePhoto('CCW'," + this.id + ")\","; 
				html += "\"phmail/tb_rotate_l_up_1.gif\",";
				html += "\"phmail/tb_rotate_l_hov_1.gif\",";
				html += "\"phmail/tb_rotate_l_dn_1.gif\",";
				html += "\"phmail/tb_rotate_l_dis_1.gif\"";
				html += ");";
				html += "buttonRL.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
		
				// Rotate CW
				
				html += "<td align=left style=\"padding-left:3px;\">";
				html += RTEUtilBeginScript();
				html += "var buttonRR = new RTEImgButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_RotateRight + "\","; 
				html += "\"RTEPTRotatePhoto('CW'," + this.id + ")\","; 
				html += "\"phmail/tb_rotate_r_up_1.gif\",";
				html += "\"phmail/tb_rotate_r_hov_1.gif\",";
				html += "\"phmail/tb_rotate_r_dn_1.gif\",";
				html += "\"phmail/tb_rotate_r_dis_1.gif\"";
				html += ");";
				html += "buttonRR.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				html += "</tr>";
				html += "</table>";
				html += "</td>";

				// End Rotation
				
				html += divider;


				// Begin Optimize
				html += "<td align=\"center\" >";
				html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				html += "<tr>";
				html += "<td colspan=3 align=center style=\"font:10px Verdana;\">" + rte_i18n_Optimize + "</td>";
				html += "</tr>";
				html += "<tr>";
				
				// Optimize none
				
				html += "<td align=right>";
				html += RTEUtilBeginScript();
				html += "var buttonON = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_OptimizeNone + "\","; 
				html += "\"RTEPTOptimize(" + this.id + ",'None')\","; 
				html += "\"phmail/tb_optimize_a_up_1.gif\",";
				html += "\"phmail/tb_optimize_a_dn_1.gif\",";
				html += "\"phmail/tb_optimize_a_dis_1.gif\",";
				html += "\"phmail/tb_optimize_a_dis_1.gif\",";
				html += "\"phmail/tb_optimize_a_hov_1.gif\",";
				html += "\"\"";
				html += ");";
				html += "buttonON.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";


				// Optimize medium
				
				html += "<td align=center style=\"padding:0;\">";
				html += RTEUtilBeginScript();
				html += "var buttonOM = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_OptimizeMedium + "\","; 
				html += "\"RTEPTOptimize(" + this.id + ",'Med')\","; 
				html += "\"phmail/tb_optimize_b_up_1.gif\",";
				html += "\"phmail/tb_optimize_b_dn_1.gif\",";
				html += "\"phmail/tb_optimize_b_dis_1.gif\",";
				html += "\"phmail/tb_optimize_b_dis_1.gif\",";
				html += "\"phmail/tb_optimize_b_hov_1.gif\",";
				html += "\"\"";
				html += ");";
				html += "buttonOM.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				
				// Optimize high
				
				html += "<td align=left>";
				html += RTEUtilBeginScript();
				html += "var buttonOH = new RTEToggleButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_OptimizeHigh + "\","; 
				html += "\"RTEPTOptimize(" + this.id + ",'High')\","; 
				html += "\"phmail/tb_optimize_c_up_1.gif\",";
				html += "\"phmail/tb_optimize_c_dn_1.gif\",";
				html += "\"phmail/tb_optimize_c_dis_1.gif\",";
				html += "\"phmail/tb_optimize_c_dis_1.gif\",";
				html += "\"phmail/tb_optimize_c_hov_1.gif\",";
				html += "\"\"";
				html += ");";
				html += "buttonOH.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				html += "</tr>";
				html += "</table>";
				html += "</td>";		
				
				// End optimize

				html += "<td width=\"6\">&nbsp;</td>";
					
				//start optimize text
				html += "<td style=\"font:10px verdana;\">";
				html += "<b><div id='RTEPTOptTextHeader"+this.id+"'>"+rte_i18n_OptTextMedHeader+"</div></b>";   
				html += "<div id='RTEPTOptTextSize"+this.id+"'>"+rte_i18n_OptTextSize+"</div>";   
				html += "<div id='RTEPTOptTextTime"+this.id+"'>"+rte_i18n_OptTextTime+"</div>";   
				html += "</td>";
				//end optimize text

				html += "</tr></table>";
				html += "</td>";

	
				html += divider;
				
				//start help
				html += "<td width=\"6\">&nbsp;</td>";
				html += "<td align=\"center\" style=\"padding:6px 0\">";
				html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
				html += "<tr>";
				html += "<td align=center nowrap style=\"font:10px Verdana;\">";
				html += "<span id='RTEPTHelp"+this.id+"' style=\"display:block;\">" + rte_i18n_Help + "</span>";
				html += "</td>";
				html += "</tr>";
				html += "<tr>";
				html += "<td align=center>";
				html += RTEUtilBeginScript();
				html += "var buttonH = new RTEImgButton(";
				html += "rtePTIDGenerator , ";
				html += "\"" + rte_i18n_Help + "\","; 
				html += "\"RTEPTHelp(" + this.id + ")\","; 
				html += "\"phmail/tb_help_up_1.gif\",";
				html += "\"phmail/tb_help_hov_1.gif\",";
				html += "\"phmail/tb_help_dn_1.gif\",";
				html += "\"phmail/tb_help_dis_1.gif\"";
				html += ");";
				html += "buttonH.Instantiate();";
				html += RTEUtilEndScript();
				html += "</td>";
				html += "</tr>";
				html += "</table>";
				html += "</td>";
				
				//end help
				
			html += "</tr>";
			html += "</table>";

			// End panels
							
		html += "</td>";
		html += "</tr>";
		html += "<tr><td colspan=\"2\" height=\"6\"></td></tr>"; // Spacer
		html += "<tr id='RTEPTAlbum"+this.id+"' style=\"display:none;\">";
		html += "<td colspan=\"2\">";
			
			// Begin album controls
			
			html += "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
			html += "<tr>";		
			
			html += "<td id=\"saveToYahooTd1"+this.id+"\" nowrap>";
			html += "<input type=checkbox name=PhotoSave id=\"saveToYahoo"+this.id+"\" onclick=\"RTEPTSaveToYahoo("+this.id+")\" " + (this.saveToYahoo ? "checked" : "") +  ">";
			html += "</td>";

			html += "<td id=\"saveToYahooTd2"+this.id+"\" nowrap>";
			html += "<label for=\"saveToYahoo"+this.id+"\" style=\"font:10px Verdana; font-weight:normal; vertical-align: middle;padding-right:10px;\"> " + rte_i18n_SaveInserted + "</label>";
			html += "</td>";

			html += "<td>";
			html += "<select style=\"font:10px Verdana;\" name=\"photoAlbum\" id=\"photoAlbum"+this.id+"\" onchange=\"RTEPTChangePhotoAlbum("+this.id+")\">"; 
			html += "<option value=\"-2\">" + rte_i18n_NewAlbum; 
			html += "<option value=\"-1\" selected>" + rte_i18n_PhotoMailDefAlbum; 
			html += "</select>"; 
			html += "</td>";

			html += "<td id=\"newAlbumNameTd1"+this.id+"\" style=\"display:none;font:10px Verdana;\" nowrap>";
			html += "<span style=\"font:10px Verdana; vertical-align: middle;\">" + rte_i18n_NewAlbumName + "</span>"; 
			html += "</td>";		

			html += "<td id=\"newAlbumNameTd2"+this.id+"\" style=\"display:none;font:10px Verdana;\" nowrap>";
			html += "<input style=\"font:10px Verdana;\" type=text size=20 maxlength=40 id=\"newAlbumName"+this.id+"\" value=\"\" onchange=\"RTEPTSaveToYahoo("+this.id+")\">"; 
			html += "</td>";

			html += "</tr>";
			html += "</table>";	

			// End album controls
				
		html += "</td>";
		html += "</tr>";
		html += "</table>";

	html += "</td>";
	html += "</tr>";
	html += "</table>";
	document.write(html);
	//this.EnableButtons(false);
}

function RTEPTGetStarted(id)
{
    if(typeof GetStartedNow == "function")
	GetStartedNow();
}

function RTEPTShow(show)
{
	document.getElementById("RTEPT"+this.id).style.display = show ? "block" : "none";
}

function RTEPTShowButtons(show)
{
	document.getElementById("RTEPTUserMsg"+this.id).style.display = show ? "none" : "block";
	document.getElementById("RTEPTButtons"+this.id).style.display = show ? "block" : "none";
	document.getElementById("RTEPTAlbum"+this.id).style.display = show && this.saveToYahoo == 1 ? "block" : "none";
}

/*Rotation can be - CW or CCW*/
function RTEPTRotatePhoto(rotation, id)
{
	var toolbar = typeof id == "undefined" ? this : rtePTMap[id];
	var selImages = toolbar.editor ? (toolbar.editor.GetNumSelectedThumbnail() > 0 ? toolbar.editor.GetSelectedImages(true) : toolbar.editor.GetSelectedImages(false)) : null;
	if(toolbar.editPhotoCB)
	    eval(toolbar.editPhotoCB)("rotate", rotation, selImages);
	if(typeof toolbar.rotationApplied == "undefined") toolbar.rotationApplied = true;
}


function RTEPTOptimize(id, optimize)
{
	var toolbar = rtePTMap[id];
	toolbar.SetOptimize(optimize=="None" ? 0 : optimize=="High" ? 2 : 1, true);
}

function RTEPTSetEditor(editor)
{
	this.editor = editor;
}

function RTEPTGoodAlbumFetch()
{
	return (!this.albumsFetched && this.saveToYahoo == 1); 
 
}

function RTEPTShowOptText(id, optimize)
{
	var textHeader = optimize == "NA" ? rte_i18n_OptTextNoneHeader : eval("rte_i18n_OptText"+optimize+"Header");
	document.getElementById("RTEPTOptTextHeader"+id).innerText = textHeader; 

	RTEPTUpdateOptTimeAndSize(id, optimize);
}

function RTEPTUpdateOptTimeAndSize(id, optimize)
{
        var size = 0, time=0, isMB=false, isMin=false;
        if(optimize != "NA")
        {
            if(typeof GetUploadSize == "function")
	    {	
                size = parseInt(GetUploadSize());
		if(!isNaN(size) && size >= 1024)
		{
		    size = size/1024;
		    size = size.toFixed(1);
		    isMB = true;
		}
 	    }
            if(typeof GetUploadTime == "function")
	    {	
                time = parseInt(GetUploadTime());
		if(!isNaN(time) && time >= 60)
		{
		    time = time/60;
		    time = time.toFixed(1);
		    isMin = true;	
		}
	    }
        }

        size = optimize == "NA" ? rte_i18n_OptTextNA : size + (isMB ? rte_i18n_OptSizeUnit2 : rte_i18n_OptSizeUnit);
        time = optimize == "NA" ? rte_i18n_OptTextNA : time + (isMin ? rte_i18n_OptTimeUnit2 : rte_i18n_OptTimeUnit);
 
 	document.getElementById("RTEPTOptTextSize"+id).innerText = rte_i18n_OptTextSize + size;
    	document.getElementById("RTEPTOptTextTime"+id).innerText = rte_i18n_OptTextTime + time;
}


function RTEPTResize(id, size, focusOnly)
{
	var toolbar = rtePTMap[id];
	focusOnly = typeof focusOnly == "undefined" ? false : focusOnly;
	//Remove prev selection or set in case click happens on selected one
	var prevButton = toolbar.imageSize == 90 ? "buttonRS" : toolbar.imageSize == 120 ? "buttonRM" : "buttonRLg";
	prevButton = eval(prevButton);

	if(prevButton.IsToggled() || toolbar.imageSize == size)
	    prevButton.Toggle();
	toolbar.imageSize = size;
	
	if(focusOnly != true && toolbar.editor) toolbar.editor.ResizeSelectedImages(size);
	if(toolbar.editor.GetNumThumbnailsFromLocalDisk() != 0)
	    RTEPTUpdateOptTimeAndSize(id, "RESIZE");
}

function RTEPTSetLayout(layout, focusOnly)
{
	var button = layout == 90 ? "buttonRS" : layout == 120 ? "buttonRM" : "buttonRLg";
	button = eval(button);
	if(!button.IsToggled())
	    button.Toggle();

	if(this.imageSize == layout) return;
	RTEPTResize(this.id, layout, focusOnly)
}

function RTEPTSetOptimize(optimize, userClicked)
{
        var prevButton = this.optimize=="0" ? "buttonON" : this.optimize=="2" ? "buttonOH" : 
			 this.optimize=="1" ? "buttonOM" : null; 
	if(prevButton)
	{
	    prevButton = eval(prevButton);
	    if(prevButton.IsToggled() || this.optimize == optimize)
		prevButton.Toggle();
	}

	this.optimize = optimize == -1 ? this.optimize : optimize;

	//Toggled current button when call is made through API, clicking anyway toggle it
	if((typeof userClicked == "undefined" || !userClicked) && optimize != -1)
	{
		var selButton = optimize=="0" ? "buttonON" : optimize=="2" ? "buttonOH" : "buttonOM";
		eval(selButton).Toggle();
	}

	if(this.editOptimizeCB)
	{
	    eval(this.editOptimizeCB)(optimize == -1 ? 0 : this.optimize);
	    RTEPTShowOptText(this.id, optimize == 0 ? "None" : optimize == "2" ? "High" : optimize == "1" ? "Med" : "NA");
	}
}

function RTEPTRefreshOptimize()
{
    if(this.optimize != -1)
    {
        var button = this.optimize=="0" ? "buttonON" : this.optimize=="2" ? "buttonOH" :
                         this.optimize=="1" ? "buttonOM" : null;
        if(button)
        {
            button = eval(button);
            if(!button.IsToggled())
                button.Toggle();
        }
	eval(this.editOptimizeCB)(this.optimize);
    }

    RTEPTShowOptText(this.id, this.optimize == 0 ? "None" : this.optimize == "2" ? "High" : this.optimize == "1" ? "Med" : "NA");
}

function RTEPTEnableOptimize(enable)
{
	buttonON.Enable(enable);
	buttonOM.Enable(enable);
	buttonOH.Enable(enable);
}

function RTEPTSetSaveToYahoo(saveToYahoo)
{
	this.saveToYahoo = saveToYahoo;
}

function RTEBorderButton(p_nId, p_sImagePath, p_sImageName, p_nPhotoToolbarId)
{
	var oBorderButton = document.createElement("table");
	
	oBorderButton.id = p_nId;
	oBorderButton.PhotoToolbarId = p_nPhotoToolbarId;
	oBorderButton.className = "rteborderbutton";
	oBorderButton.cellPadding = "0";
	oBorderButton.cellSpacing = "0";

	oBorderButton.insertRow();
	oBorderButton.rows[0].insertCell();
	var oImage = new Image();
	oImage.src = RTE_EDITOR_PHOTOS_AKAMI_BASEPATH + p_sImagePath + ".gif";
	oBorderButton.rows[0].cells[0].appendChild(oImage);

	oBorderButton.insertRow();
	var oCaption = oBorderButton.rows[1].insertCell();
	oCaption.className = "rteborderbuttoncaption";
	oCaption.innerText = p_sImageName;

	oBorderButton.Selected = false;

	oBorderButton.onmouseover = function() {

		window.event.cancelBubble = true;		

		this.style.cursor = "hand";
		this.style.borderColor = "#A7BBE8";
		this.style.backgroundColor = "#CCEEFF";

	};
	
	oBorderButton.onmouseout = function() {

		window.event.cancelBubble = true;

		this.style.cursor = "auto";
		this.style.borderColor = "#fff";
		this.style.backgroundColor = "#fff";

	};
	
	oBorderButton.onmousedown = function() {
	
		document.onclick = null;
		this.style.backgroundColor = "#B2CAF0";
		
	};

	oBorderButton.onmouseup = function() {

		if(parseInt(this.id) == 0) RTEResetBorder(this.PhotoToolbarId);
		else
		{
			// Check to see if the user has the selected border installed
	
			// Get the names of the currently installed borders
			var sInstalledBorders = rtePTMap[this.PhotoToolbarId].overlayFiles.toString();
	
			// Get the name of the selected border
			var sSelectedBorder = rtePhotoMailBorders[this.id][2];
	
			if(sInstalledBorders.indexOf(sSelectedBorder) == -1) RTEDownloadBorder(this.id, this.PhotoToolbarId);
	
			RTEBorderSelect(this.id, this.PhotoToolbarId);
	
			this.style.backgroundColor = "#CCEEFF";	
		}

	};
	
	return oBorderButton;
}

function RTEBorderMenu(p_nPhotoToolbarId)
{
	var sMenuHTML = "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";
	sMenuHTML += "<tr valign=\"bottom\">";
	sMenuHTML += "<td width=\"43\">";
	sMenuHTML += "<img src=\"phmail/tb_borders_open_crnr_1.gif\" width=\"43\" height=\"5\" alt=\"\" border=\"0\">";
	sMenuHTML += "</td><td>";
	sMenuHTML += "<img src=\"phmail/tb_borders_open_dkpx_1.gif\" width=\"438\" height=\"1\" alt=\"\" border=\"0\">";
	sMenuHTML += "</td></tr></table>";
	sMenuHTML += "<div><div></div></div>";

	var oMenu = document.createElement("div");
	oMenu.className = "RTEPhotoMailBordersMenu";
	oMenu.innerHTML = sMenuHTML;
	oMenu.Borders = oMenu.children(1).children(0);

	var oToolbar = rtePTMap[p_nPhotoToolbarId];	

	if(!oToolbar.overlay)
	{   
		oToolbar.overlay = true;   
		if(typeof GetOverlayFiles != "function") return;   
		var aFiles = GetOverlayFiles();
		oToolbar.overlayFiles = aFiles;
	}

	var oBorderButton = null;
	
	for(var i in rtePhotoMailBorders)
	{
		oBorderButton = new RTEBorderButton(i, rtePhotoMailBorders[i][0], rtePhotoMailBorders[i][1], p_nPhotoToolbarId);
		oMenu.Borders.appendChild(oBorderButton);
		oBorderButton = null;
	}

	document.body.appendChild(oMenu);

	oMenu.Iframe = document.createElement("iframe");
	oMenu.Iframe.height = (oMenu.offsetHeight-5);
	oMenu.Iframe.width = oMenu.offsetWidth;
	oMenu.Iframe.className = "rteborderbuttoniframe";
	
	document.body.appendChild(oMenu.Iframe);
	
	var oButton = window.event.srcElement;

	oButton.onmouseover = function() {
	
		document.onclick = null;

	};
	
	oButton.onmouseout = function() {
	
		document.onclick = HideMenu;

	};

	oMenu.style.display = "block";
	oMenu.style.left = (ylib_getPageX(oButton)+1) + "px";
	oMenu.style.top = (ylib_getPageY(oButton) + oButton.offsetHeight) + "px";

	oMenu.Iframe.style.display = "block";	
	oMenu.Iframe.style.left = (ylib_getPageX(oButton)+1) + "px";
	oMenu.Iframe.style.top = (ylib_getPageY(oButton) + oButton.offsetHeight + 5) + "px";

	oMenu.Visible = false;
	oMenu.Button = oButton;
	
	oMenu.Show = function(){
		
		var oPhotoMailToolbar= rtePTMap[p_nPhotoToolbarId];
		var aThumbnails = oPhotoMailToolbar.editor.ThumbnailManager.Thumbnails;
		
		if(oPhotoMailToolbar.editor.ThumbnailManager.Selected.length == 0)
		{
			var oThumbnail = null;
		
			for(var i in aThumbnails)
			{
				oThumbnail = oPhotoMailToolbar.editor.ComposeControlDocument.getElementById(aThumbnails[i][0]);
				oThumbnail.Select();
			}
		}

		this.Iframe.style.visibility = "visible";
		this.style.visibility = "visible";
		this.Visible = true;

		var nStart = RTE_IMG_BUTTON_DIV_PREFIX.length;
		var nEnd = this.Button.parentNode.id.length;
		var nIndex = this.Button.parentNode.id.substring(nStart,nEnd);
		var oToggleButton = rteToggleButtonMap[nIndex];

		oToggleButton.toggled = true;
		
	};
	
	oMenu.Hide = function(){

		var oPhotoMailToolbar= rtePTMap[p_nPhotoToolbarId];
		var aThumbnails = oPhotoMailToolbar.editor.ThumbnailManager.Thumbnails;
		
		if(oPhotoMailToolbar.editor.ThumbnailManager.Selected.length == oPhotoMailToolbar.editor.ThumbnailManager.Thumbnails.length)
		{
			var oThumbnail = null;
			
			for(var i in aThumbnails)
			{
				oThumbnail = oPhotoMailToolbar.editor.ComposeControlDocument.getElementById(aThumbnails[i][0]);
				oThumbnail.Deselect();
			}
		}

		this.Iframe.style.visibility = "hidden";
		this.style.visibility = "hidden";
		this.Visible = false;

		this.Button.src = "phmail/tb_borders_up_1.gif";

		var nStart = RTE_IMG_BUTTON_DIV_PREFIX.length;
		var nEnd = this.Button.parentNode.id.length;
		var nIndex = this.Button.parentNode.id.substring(nStart,nEnd);
		var oToggleButton = rteToggleButtonMap[nIndex];

		oToggleButton.toggled = false;
	};

	oMenu.onmouseover = function() {
	
		document.onclick = null;

	};
	
	oMenu.onmouseout = function() {
	
		document.onclick = HideMenu;

	};
	
	return oMenu;
}

function RTEPTBorder(p_nPhotoToolbarId)
{
	if(typeof g_oMenu == 'undefined' || !g_oMenu)
	{
		document.onclick = null;
		g_oMenu = new RTEBorderMenu(p_nPhotoToolbarId);
	}
	else if(g_oMenu && !g_oMenu.Iframe)
	{
		HideMenu();
		g_oMenu = new RTEBorderMenu(p_nPhotoToolbarId);
	}
	
	if(g_oMenu.Visible) g_oMenu.Hide();
	else g_oMenu.Show();

	var toolbar = rtePTMap[p_nPhotoToolbarId];
	if(typeof toolbar.borderApplied == "undefined") toolbar.borderApplied = true;
}

function RTEDownloadBorder(p_nIndex, p_sPhotoToolbarId)
{
	var oToolbar = rtePTMap[p_sPhotoToolbarId];

	if(oToolbar.downloadBorderCB)
	{
		// Download the border
		var bSuccess = oToolbar.downloadBorderCB(p_nIndex);

		if(bSuccess)
		{
			var aBorderInfo = rtePhotoMailBorders[p_nIndex];
			var sFileName = aBorderInfo[2]+".png";

			// Append the new border to the array
			oToolbar.overlayFiles.push(sFileName);
			
			if(aBorderInfo.length > 4)
			{
				sFileName = aBorderInfo[4]+".png";
				oToolbar.overlayFiles.push(sFileName);
			}
			
			return true;
		}
		else return;
	}
}

function RTEResetBorder(id)
{
	var toolbar = rtePTMap[id]; 
	if(toolbar.resetBorderCB)
	{
		var selImages = toolbar.editor ? toolbar.editor.GetSelectedImages(true) : null;
		eval(toolbar.resetBorderCB)(selImages);
	} 
}

//This method will be called once the border is selected
function RTEBorderSelect(nOverlayFileIndex, id)
{
	var toolbar = rtePTMap[id]; 
	if(toolbar.editBorderCB)   
	{   
		var selImages = toolbar.editor ? toolbar.editor.GetSelectedImages(true) : null;   
		var aFileInfo = rtePhotoMailBorders[nOverlayFileIndex];
		var sFile = aFileInfo[2]+".png";
		eval(toolbar.editBorderCB)(sFile,selImages);   
	} 
}

function RTEPTEnableButtons(enable)
{
	buttonRL.Enable(enable);
	buttonRR.Enable(enable);
	buttonRS.Enable(enable);
	buttonB.Enable(enable);
	buttonRM.Enable(enable);
	buttonRLg.Enable(enable);

	var numThumbnail = this.editor ? this.editor.GetNumThumbnail() : 0;
    	document.getElementById("photoAlbum"+this.id).disabled = numThumbnail > 0 ? false : true;	

	document.getElementById("newAlbumNameTd1"+this.id).disabled = numThumbnail > 0 ? false : true;
	document.getElementById("newAlbumNameTd2"+this.id).disabled = numThumbnail > 0 ? false : true;
	
	document.getElementById("saveToYahooTd1"+this.id).disabled = numThumbnail > 0 ? false : true;
	document.getElementById("saveToYahooTd2"+this.id).disabled = numThumbnail > 0 ? false : true;
}

function RTEPTHelp(id)
{
	var helpURL = "about:blank";
	if(typeof GetPhotomailHelpURL == "function")
	    helpURL = GetPhotomailHelpURL();
	var help = window.open(helpURL, "_Help", 'width=625,height=600,left=100,top=40,scrollbars=yes,resizable=yes');
	if(help && !help.closed)
	    help.focus();
}

function RTEPTSaveToYahoo(id)
{

}

function RTEPTSetPhotoAlbums(albums, defAlbumIndex)
{
        if(this.albumsFetched) return;
        this.albumsFetched = true;
                
        var albumElement = document.getElementById("photoAlbum"+this.id);
        var len = albumElement.options.length;
        for(var i=0; i<albums.length; i++)
        {
            var elem = albums[i].split("\02");
            albumElement.options[len+i] = new Option(elem[0],elem[1]);
        }
	if(typeof defAlbumIndex != "undefined" && defAlbumIndex >= 0)
	{
		albumElement.options.selectedIndex = defAlbumIndex + 2;
		albumElement.remove(1);
		document.getElementById("saveToYahoo"+this.id).checked = true;
	}
}

function RTEPTChangePhotoAlbum(id)
{
	var toolbar = rtePTMap[id];

	var albumElement = document.getElementById("photoAlbum"+id);
	var value = albumElement.options[albumElement.selectedIndex].value

	var sDisplay = (value == -2) ? "block" : "none";
    	document.getElementById("newAlbumNameTd1"+id).style.display = sDisplay;
    	document.getElementById("newAlbumNameTd2"+id).style.display = sDisplay;
	document.getElementById("saveToYahoo"+id).checked = true;

	RTEPTSaveToYahoo(id);
}

function RTEPTRestoreToolbarState(state)
{
    if(!state || state == "") return;

    this.SetOptimize(state.optimize);
    this.SetLayout(state.layout, true);

    if(state.save)
        document.getElementById("saveToYahoo"+this.id).checked = true;

    if(state.isNew)
    {
	document.getElementById("newAlbumName"+this.id).value = state.caption;
	document.getElementById("newAlbumNameTd1"+this.id).style.display = "block";
	document.getElementById("newAlbumNameTd2"+this.id).style.display = "block";
    }
    document.getElementById("photoAlbum"+this.id).selectedIndex = state.si;
}

function RTEPTGetToolbarState()
{
	var ret = this.GetSaveToAlbumInfo();
	ret.optimize = this.optimize;
	ret.layout = this.imageSize;
	var albumElement = document.getElementById("photoAlbum"+this.id);
	ret.si = albumElement.selectedIndex;
	return ret;	
}

//Flags   : Caption-rotate-border-layout90-layout120-layout180-optimizeLow-optimizeMed-optimizeHigh
//Bit(val): 9(256)  8(128) 7(64)   6(32)   5(16)     4(8)      3(4)        2(2)        1(1) 
function RTEPTGetPhotoMailFlags()
{
	var flags = 0;
	if(this.optimize != -1)
	    flags = this.optimize == 0 ? flags|0x004:this.optimize == 1 ? flags|0x002:flags|0x001;

	flags = this.imageSize == 90 ? flags|0x020:this.imageSize == 120 ? flags|0x010:flags|0x008;

	if(typeof this.borderApplied != "undefined")
	    flags = flags|0x040;
	    
	if(typeof this.rotationApplied != "undefined")
	    flags = flags|0x080;

	return flags;
}

function RTEPTGetSaveToAlbumInfo()
{
	var ret = new Object();
	ret.save = false;
	ret.isNew = false;
	ret.caption = "";
	ret.path = "";

	if(document.getElementById("saveToYahoo"+this.id).checked)
	{
	    ret.save = true;
	    var  newAlbumNameTd = document.getElementById("newAlbumNameTd1"+this.id);
		
	    if(newAlbumNameTd.style.display != "none")
	    {
		var newAlbumName = document.getElementById("newAlbumName"+this.id);
		ret.caption = newAlbumName.value;
		ret.isNew = true; 
	    }
	    else
	    {
		var albumElement = document.getElementById("photoAlbum"+this.id);
		var value = albumElement.options[albumElement.selectedIndex].value;
		if(value == -1)
		{
		    ret.isNew = true; 
		    ret.caption = albumElement.options[albumElement.selectedIndex].text
		}
		else
		{
		    ret.path = value
		    ret.caption = albumElement.options[albumElement.selectedIndex].text;	
		}
	    }	
	}
	return ret;
}



function RTEThumbnail()
{
	// Private member variables
	
	var m_oThumbnail = null;
	var m_oEditor = null;

	// Private functions
	
	function CreateThumbnailFromDOMObject(p_oThumbnail, p_oEditor) {

		m_oEditor = p_oEditor;
		var sIdPrefix = m_oEditor.ThumbnailManager.ThumbnailIdPrefix;

		var idMatch = new RegExp( '(id="?' + sIdPrefix + '\d+_)\d+("?)', 'g' );

		var oThumbnail = p_oThumbnail.cloneNode(true);
		var nId = m_oEditor.ThumbnailManager.ThumbnailCount;
		var newText = '$1' + nId + '$2';
		var sOuterHTML = oThumbnail.outerHTML.replace( idMatch, newText );
		var sInnerHTML = oThumbnail.innerHTML.replace( idMatch, newText );
		var sIdPrefix = m_oEditor.ThumbnailManager.ThumbnailIdPrefix;

		oThumbnail.outerHTML = sOuterHTML;
		oThumbnail.innerHTML = sInnerHTML;
		
		// Thumbnail properties
        oThumbnail.style.margin = "1px";
		oThumbnail.Manager = m_oEditor.ThumbnailManager;
		oThumbnail.Index = nId;
		oThumbnail.Selected = false;
		oThumbnail.Image = new RTEThumbnailImage(oThumbnail,sIdPrefix,nId,m_oEditor);
		oThumbnail.ImageContainer = oThumbnail.all(sIdPrefix + "5_" + nId);
		oThumbnail.Caption = new RTEThumbnailCaption(oThumbnail,sIdPrefix,nId,m_oEditor);
		
		return oThumbnail;			
	};

	function CreateThumbnailFromString(p_sThumbnailPath, p_sImagePath, p_sImageCaption, p_sMarker, p_oEditor, p_sOrigin) {
		
		m_oEditor = p_oEditor;
		
		var nId = m_oEditor.ThumbnailManager.ThumbnailCount;
		var sIdPrefix = m_oEditor.ThumbnailManager.ThumbnailIdPrefix;

		var oThumbnail = m_oEditor.ComposeControlDocument.createElement("span");
		oThumbnail.id = sIdPrefix + "1_" + nId;
		oThumbnail.style.margin = "1px";
        oThumbnail.contentEditable = "false";

		var sHTML = "<span id=\"" + sIdPrefix + "2_" + nId + "\" contenteditable=\"false\">";
		sHTML += "<table id=\"" + sIdPrefix + "3_" + nId + "\" style=\"display:inline;\" cellpadding=\"8\" cellspacing=\"0\" border=\"0\">";
		sHTML += "<tr id=\"" + sIdPrefix + "4_" + nId + "\"  align=\"center\">";
		sHTML += "<td id=\"" + sIdPrefix + "5_" + nId + "\" width=\"" + m_oEditor.imageSize + "\" height=\"" + m_oEditor.imageSize + "\">";

		var oImg = new Image();
		oImg.src = p_sThumbnailPath;
		oImg.id = sIdPrefix + "6_" + nId;
		oImg.RealPath = p_sImagePath;
		oImg.marker = p_sMarker;
		sHTML += oImg.outerHTML;

		var caption = p_sImageCaption.toLowerCase();
		var capLen = caption.length;
		if (caption.substring(capLen - 4) == ".jpg") {
		    capLen -= 4;
		}
		else if (caption.substring(capLen - 4) == ".jpe") {
		    capLen -= 4;
		}
		else if (caption.substring(capLen - 5) == ".jpeg") {
		    capLen -= 5;
		}
		
		sHTML += "<div id=\"" + sIdPrefix + "7_" + nId + "\" style=\"width:" + m_oEditor.imageSize + "px;text-align:center;\">" + p_sImageCaption.substring(0, capLen).substr(0,m_oEditor.ThumbnailManager.ThumbnailCaptionLength) + "</div>";
		sHTML += "</td>";
		sHTML += "</tr>";
		sHTML += "</table>";
		sHTML += "</span>";

		oThumbnail.innerHTML = sHTML;
		
		// Thumbnail properties

		oThumbnail.Manager = m_oEditor.ThumbnailManager;
		oThumbnail.Index = nId;
		oThumbnail.Origin = p_sOrigin;
		oThumbnail.Selected = false;
		oThumbnail.Image = new RTEThumbnailImage(oThumbnail,sIdPrefix,nId,m_oEditor);
		oThumbnail.ImageContainer = oThumbnail.all(sIdPrefix + "5_" + nId);
		oThumbnail.Caption = new RTEThumbnailCaption(oThumbnail,sIdPrefix,nId,m_oEditor);

		return oThumbnail;
	};

	if(arguments.length == 6) m_oThumbnail = CreateThumbnailFromString(arguments[0],arguments[1],arguments[2],arguments[3],arguments[4],arguments[5],arguments[6],arguments[7]);
	else m_oThumbnail = CreateThumbnailFromDOMObject(arguments[0],arguments[1]);

	// Public methods

	m_oThumbnail.HandleDesignEvent = function(p_oEvent, p_oElement) {
		
		switch(p_oEvent.type)
		{
			case "mouseover":

				this.Highlight();
				m_oEditor.ComposeControl.EventHandled(true);

			break;

			case "mouseout":

				if(!this.Selected) this.UnHighlight();
				m_oEditor.ComposeControl.EventHandled(true);

			break;
			
			case "mousemove":
				
                StopScroll();

				if(p_oEvent.srcElement != this.Caption)
				{
					if(p_oEvent.button == 1 && m_oEditor.ThumbnailManager.Selected.length > 0) m_oEditor.ThumbnailManager.Drag = m_oEditor.ThumbnailManager.CurrentSelection;
					else m_oEditor.ThumbnailManager.Drag = false;
					m_oEditor.ComposeControl.EventHandled(true);
				}

			break;

			case "mousedown":
			
                StopScroll();
				HideMenu();

				if(p_oEvent.button != 1)
				{
					var bEnable = (m_oEditor.ThumbnailManager.Selected.length <= 1 );
					
			    	m_oEditor.ComposeControl.EnableMenuItem(1,bEnable); // Open in a new window
			    	m_oEditor.ComposeControl.EnableMenuItem(4,bEnable);	// Properties
					
					var nId = parseInt(m_oEditor.ComposeControl.DisplayMenu());
					
					switch(nId)
					{
						case 1:
						
							if(m_oEditor.ThumbnailManager.DoubleClickCB) for(var i in m_oEditor.ThumbnailManager.DoubleClickCB) m_oEditor.ThumbnailManager.DoubleClickCB[i](this.Image.RealPath);
							m_oEditor.ComposeControl.SetCursor("IDC_ARROW");
										
						break;
						
						case 2:
						
							if(!this.Selected) this.Select();
							m_oEditor.photoToolbar.RotatePhoto("CW");
						
						break;
						
						case 3:

							if(m_oEditor.ThumbnailManager.Selected.length > 1)
							{
								if(window.confirm(rte_i18n_DeleteAllThumbnailsConfirmation))
								{
									var nCurrentThumbnail = 1;
									var nTotalThumbnails = m_oEditor.ThumbnailManager.Selected.length;
									
									var aThumbnailsToDelete = new Array();
									var i = m_oEditor.ThumbnailManager.Selected.length-1;
									
									do aThumbnailsToDelete.push(m_oEditor.ThumbnailManager.Selected[i][0]);
									while(i--);
									
									var i = aThumbnailsToDelete.length -1;
									
									do
									{
										m_oEditor.ThumbnailManager.DeleteThumbnail(
											aThumbnailsToDelete[i],
											nCurrentThumbnail,
											nTotalThumbnails
										);
										nCurrentThumbnail++;										
									}
									while(i--);
								}
							}
							else if(window.confirm(rte_i18n_DeleteThumbnailConfirmation)) m_oEditor.ThumbnailManager.DeleteThumbnail(this.id);

						break;
						
						case 4:
							
							if(m_oEditor.DisplayThumbnailPropertiesCB) for(var i in m_oEditor.DisplayThumbnailPropertiesCB) m_oEditor.DisplayThumbnailPropertiesCB[i](this.Image.RealPath);

						break;
					}

					m_oEditor.ComposeControl.EventHandled(true);
				}
				else if(p_oEvent.srcElement == this.Caption)
				{
					if(!this.Selected) this.Select(p_oEvent);
					
					if(!this.Caption.EditMode)
					{
						if(this.Caption.disabled) this.Caption.disabled = false;
						this.Caption.Edit();
						m_oEditor.ComposeControl.EventHandled(true);
					}
					else
					{
						var oTextRange = m_oEditor.ComposeControlSelection.createRange();

						if(oTextRange && oTextRange.moveToPoint)
						{
							oTextRange.moveToPoint(p_oEvent.clientX, p_oEvent.clientY);
							oTextRange.select();
							m_oEditor.ComposeControl.SetCursor("IDC_IBEAM");
						}
						else return;
					}
				}
				else
				{
					if(!this.Selected) // THE THUMBNAIL IS NOT SELECTED
					{
						this.Select(p_oEvent); // The thumbnail is not selected - select it
						
						// Check to see if another thumbnail is currently selected and (if so) deselect it
						if(m_oEditor.ThumbnailManager.LastSelection != this && !p_oEvent.ctrlKey && !p_oEvent.shiftKey) m_oEditor.ThumbnailManager.LastSelection.Deselect();
						
						// If the user is holding down the shift key, select a range of thumbs using the current thumbnail as the endpoint
						if(p_oEvent.shiftKey) m_oEditor.ThumbnailManager.MakeSelection(this);
					}
					else // THE THUMBNAIL IS SELECTED
					{
						if(p_oEvent.ctrlKey) this.Deselect(); // If the user is holding down the control key, deselect the selected thumbnail
						else if(p_oEvent.shiftKey)
						{
							// Clear whatever is currently selected
							if(m_oEditor.ThumbnailManager.Selected.length > 1) m_oEditor.ThumbnailManager.ClearSelected();
							else m_oEditor.ThumbnailManager.LastSelection.Deselect();

							m_oEditor.ThumbnailManager.MakeSelection(this); // Select the range of thumbnails
						}
					}
					
					m_oEditor.ComposeControl.EventHandled(true);
				}

			break;
			
			case "mouseup":

				if(m_oEditor.ThumbnailManager.Drag && this != m_oEditor.ThumbnailManager.Drag)
				{
					if(m_oEditor.ThumbnailManager.Selected.length > 1)
					{
						var aSelectedThumbnails = m_oEditor.ThumbnailManager.GetSelectedDisplayOrder();
						var oInsertMarkerThumbnail = this;
						var oSelectedThumbnail = null;
						
						for(var i in aSelectedThumbnails)
						{
							oSelectedThumbnail = m_oEditor.ComposeControlDocument.getElementById(aSelectedThumbnails[i]);
							oInsertMarkerThumbnail.insertAdjacentElement("afterEnd", oSelectedThumbnail);
							oInsertMarkerThumbnail = oSelectedThumbnail;
						}
						
						this.Deselect();
					}
					else this.insertAdjacentElement("afterEnd", m_oEditor.ThumbnailManager.Drag);
					
					m_oEditor.ThumbnailManager.ClearSelected();
					m_oEditor.ComposeControl.SetCursor("IDC_ARROW");
					m_oEditor.ComposeControl.EventHandled(true);
				}
				else
				{
					if(!p_oEvent.ctrlKey && !p_oEvent.shiftKey && m_oEditor.ThumbnailManager.Selected.length > 1)
					{
						m_oEditor.ThumbnailManager.ClearSelected();
						this.Select(p_oEvent);

						m_oEditor.ComposeControl.SetCursor("IDC_ARROW");
						m_oEditor.ComposeControl.EventHandled(true);
					}							
				}

			break;
			
            case "keydown":

                if(p_oEvent.keyCode == 46)	// Did they hit the delete key?
                {
        			if(m_oEditor.ThumbnailManager.Selected.length > 1)
        			{
        				if(window.confirm(rte_i18n_DeleteAllThumbnailsConfirmation))
        				{
        					var nCurrentThumbnail = 1;
        					var nTotalThumbnails = m_oEditor.ThumbnailManager.Selected.length;
        					
        					var aThumbnailsToDelete = new Array();
        					var i = m_oEditor.ThumbnailManager.Selected.length-1;
        					
        					do aThumbnailsToDelete.push(m_oEditor.ThumbnailManager.Selected[i][0]);
        					while(i--);
        					
        					var i = aThumbnailsToDelete.length -1;
        					
        					do
        					{
        						m_oEditor.ThumbnailManager.DeleteThumbnail(
        							aThumbnailsToDelete[i],
        							nCurrentThumbnail,
        							nTotalThumbnails
        						);
        						nCurrentThumbnail++;										
        					}
        					while(i--);
        				}
        			} else {
						if(p_oEvent.srcElement != this.Caption) {
							if(window.confirm(rte_i18n_DeleteThumbnailConfirmation)) m_oEditor.ThumbnailManager.DeleteThumbnail(this.id);
                		}
					}
				}

            break;

			case "keypress":

				if(this.innerText.length > (m_oEditor.ThumbnailManager.ThumbnailCaptionLength-1) && (p_oEvent.keyCode != 37 || p_oEvent.keyCode != 38 || p_oEvent.keyCode != 39 || p_oEvent.keyCode != 40) && p_oEvent.keyCode != 8)
				{
                    m_oEditor.ComposeControl.EventHandled(true);
					return;
				}
			
			break;
		}
	};
	
    m_oThumbnail.Select = function(p_oEvent) {
		
		if(!this.Selected)
		{
			var bFirstSelection = m_oEditor.ThumbnailManager.Selected.length == 0 ? true : false;

			m_oEditor.ThumbnailManager.Selected.push(new Array(this.id,this.Image.RealPath,this.Image.marker,this.Origin));
			
			if(p_oEvent && !p_oEvent.shiftKey) m_oEditor.ThumbnailManager.StartRange.moveToElementText(this);
			this.Highlight();
			this.Selected = true;
			if(m_oEditor.ThumbnailManager.CurrentSelection) m_oEditor.ThumbnailManager.LastSelection = m_oEditor.ThumbnailManager.CurrentSelection;
			else m_oEditor.ThumbnailManager.LastSelection = this;
			m_oEditor.ThumbnailManager.CurrentSelection = this;
			
			if(m_oEditor.ThumbnailManager.SelectThumbnailCB) for(var i in m_oEditor.ThumbnailManager.SelectThumbnailCB) m_oEditor.ThumbnailManager.SelectThumbnailCB[i](this.id);
			if(bFirstSelection) for(var i in m_oEditor.ThumbnailManager.FirstSelectionCB) m_oEditor.ThumbnailManager.FirstSelectionCB[i]();
		}

    };

    m_oThumbnail.Deselect = function() {

		if(this.Selected)
		{
			if(this.Caption.EditMode)
			{
				var nMaxLength = m_oEditor.ThumbnailManager.ThumbnailCaptionLength;
				var sCaption = this.Caption.innerText;

				this.Caption.innerText = sCaption.length > nMaxLength ? sCaption.substring(0,nMaxLength) : sCaption;
				
				if(sCaption.length == 0)
				{
					this.Caption.innerText = rte_i18n_EmptyCaptionText;
					this.Caption.disabled = true;
				}
				else
				{
					if(this.Caption.offsetWidth > m_oEditor.imageSize) this.Caption.Resize();
					sCaption = this.Caption.innerText;
				}

				this.Caption.EditMode = false;
			}

			var i = m_oEditor.ThumbnailManager.Selected.length-1;
			
			do
			{
				if(this.id == m_oEditor.ThumbnailManager.Selected[i][0])
				{
					m_oEditor.ThumbnailManager.Selected.splice(i,1);
					break;
				}
			}
			while(i--);
			
			this.UnHighlight();
			this.Selected = false;

			if(m_oEditor.ThumbnailManager.DeselectThumbnailCB) for(var i in m_oEditor.ThumbnailManager.DeselectThumbnailCB) m_oEditor.ThumbnailManager.DeselectThumbnailCB[i](this.id);
			if(m_oEditor.ThumbnailManager.Selected.length == 0) for(var i in m_oEditor.ThumbnailManager.LastDeselectionCB) m_oEditor.ThumbnailManager.LastDeselectionCB[i]();
		}
    };

	m_oThumbnail.Highlight = function() {

		if(m_oEditor.ThumbnailManager.Drag && m_oEditor.ThumbnailManager.Drag != this)
		{
			this.style.backgroundColor = "#CCEEFF";
			this.style.borderColor = "#A7BBE8 #000 #A7BBE8 #A7BBE8";
			this.style.borderWidth = "1px 5px 1px 1px";
            this.style.borderStyle = "solid";
            this.style.margin = "0";
		}
		else
		{
			this.style.backgroundColor = "#CCEEFF";
			this.style.borderColor = "#A7BBE8";
            this.style.borderWidth = "1px";
            this.style.borderStyle = "solid";
            this.style.margin = "0";
            
			if(this.Caption.disabled && this.Caption.innerText.length > 0) this.Caption.innerText = rte_i18n_EmptyCaptionText;
			if(!this.Caption.disabled && this.Caption.innerText.length == 0)
			{
				this.Caption.innerText = rte_i18n_EmptyCaptionText;
				this.Caption.disabled = true;
			}
		}				

	};
	
	m_oThumbnail.UnHighlight = function() {

		this.style.backgroundColor = "transparent";
        this.style.borderWidth = "0";
        this.style.margin = "1px";
		this.Caption.style.borderStyle = "dotted";
		this.Caption.style.borderColor = "#ccc";
		this.Caption.style.backgroundColor = "transparent";

	};
	
	return m_oThumbnail ? m_oThumbnail : null;
}

function RTEThumbnailCaption(p_oThumbnail, p_sThumbnailIdPrefix, p_nThumbnailId, p_oEditor)
{
	var m_oEditor = p_oEditor;

	var oCaption = p_oThumbnail.all(p_sThumbnailIdPrefix + "7_" + p_nThumbnailId);
	
	// Empty captions are removed OnSend.
	// Create a new caption if the caption doesn't exist.
	if(!oCaption)
	{
		oCaption = m_oEditor.ComposeControlDocument.createElement("div");
		oCaption.id = p_sThumbnailIdPrefix + "7_" + p_nThumbnailId;
		oCaption.innerHTML = rte_i18n_EmptyCaptionText;
		oCaption.disabled = true;
		p_oThumbnail.all(p_sThumbnailIdPrefix + "5_" + p_nThumbnailId).appendChild(oCaption);
	}

	// Set the style properties on the caption
	oCaption.style.marginTop = "4px";
	oCaption.style.padding = "4px";
	oCaption.style.color = "#039";
	oCaption.style.font = "10px verdana";
	oCaption.style.border = "dotted 1px #ccc";

	// Restore the caption's innerHTML if it was changed by "PrepareThumbnailsForSend"
	if(oCaption.firstChild.tagName == "A")
	{
		var sText = oCaption.innerText;
		oCaption.innerHTML = sText;
	} 

	oCaption.EditMode = false;
	
	oCaption.Edit = function() {

		this.EditMode = true;
		this.contentEditable = true;
		this.style.borderColor = "#000";
		this.style.borderStyle = "solid";
		this.style.backgroundColor = "#fff";
		var oTextRange = m_oEditor.ComposeControlSelection.createRange();
		oTextRange.moveToElementText(this);
		oTextRange.select();
		m_oEditor.ThumbnailManager.CaptionEdited = true;

	};

	oCaption.Resize = function() {

		// Remove any existing line breaks that might be in the caption
		var sCaption = this.innerText.replace(/[\n\r]/gi,'');

		// Get the number of characters allowed per line for this image size
		var nLineLength = m_oEditor.ThumbnailManager.CaptionLineLength[m_oEditor.imageSize];
				
		// Reflow the text in the caption with the new line length
		this.innerText = Flow(sCaption, nLineLength);
		
        this.style.width = m_oEditor.imageSize + "px";

		// Check to see if the caption text fits and reflow again if necessary
		if(this.offsetWidth > m_oEditor.imageSize) ResizeCaption(this, m_oEditor.imageSize, nLineLength);

	};

	
	return oCaption;
}

function RTEThumbnailImage(p_oThumbnail, p_sThumbnailIdPrefix, p_nThumbnailId, p_oEditor)
{
	var oImage = p_oThumbnail.all(p_sThumbnailIdPrefix + "6_" + p_nThumbnailId);
	
	oImage.ondblclick = function(){

		if(p_oEditor.ThumbnailManager.DoubleClickCB) for(var i in p_oEditor.ThumbnailManager.DoubleClickCB) p_oEditor.ThumbnailManager.DoubleClickCB[i](this.RealPath);
		p_oEditor.ComposeControl.SetCursor("IDC_ARROW");
		p_oEditor.ComposeControl.EventHandled(true);
	
	};
	
	return oImage;
}
function RTEThumbnailManager(p_oEditor)
{
	// Private member variables

	var m_oEditor = p_oEditor;

	// Public properties

	this.ThumbnailIdPrefix = "rteThmb"; // The string prefix used to create a new thumbnail
	this.ThumbnailCount = 0;
	this.Thumbnails = new Array();
	this.Selected = new Array();
	this.StartRange = null;
	this.EndRange = null;
	this.LastSelection = null; // A reference to the thumbnail that was previously selected
	this.CurrentSelection = null; // A reference to the thumbnail that is currently selected
	this.Drag = false; // A reference to thumbnail object being dragged
	this.ThumbnailsFromSearch = 0;
	this.ThumbnailsFromLocalDisk = 0;
	this.ThumbnailCaptionLength = 40;
	this.CaptionLineLength = [];
	this.CaptionLineLength[90] = 10;
	this.CaptionLineLength[120] = 15;
	this.CaptionLineLength[180] = 24;
	this.CaptionEdited = false;
	
	this.DeleteThumbnailCB = null;
	this.SelectThumbnailCB = null;
	this.DeselectThumbnailCB = null;
	this.DoubleClickCB = null;
	this.LastThumbnailDeletedCB = null;
	this.FirstThumbnailInsertedCB = null;
	this.FirstSelectionCB = null;
	this.LastDeselectionCB = null;
	this.BatchInsertionCB = null;
	this.BatchDeletetionCB = null;

	
	// Public methods

    this.ScrollMessageBody = function(p_oEvent) {

        if(p_oEvent.clientY > m_oEditor.ComposeControlDocument.body.clientHeight - 10)
        {
            g_oComposeWindow = m_oEditor.ComposeControlDocument.parentWindow;
            scrollID = window.setInterval('ScrollComposeWindow(0);', 100);
        }
        else if(p_oEvent.clientY < 10)
        {
            scrollID = window.setInterval('ScrollComposeWindow(1);', 100);
            g_oComposeWindow = m_oEditor.ComposeControlDocument.parentWindow;                        
        }                        

    };

	this.RefreshThumbnail = function(p_sRealPath, p_sThumbnailPath, p_sWidth, p_sHeight)
	{
		var i = this.Thumbnails.length-1;

		do
		{
			if(this.Thumbnails[i][1] == p_sRealPath)
			{
				var oThumbnail = m_oEditor.ComposeControlDocument.getElementById(this.Thumbnails[i][0]);
				
				if(oThumbnail)
				{
					oThumbnail.Image.src = p_sThumbnailPath;
					oThumbnail.Image.width = p_sWidth;
					oThumbnail.Image.height = p_sHeight;
				}
				break;
			}
		}
		while(i--);
	};
	
	this.RemoveThumbnails = function() {

		var i = this.Thumbnails.length-1;
		
		do m_oEditor.ComposeControlDocument.getElementById(this.Thumbnails[i][0]).removeNode(true);
		while(i--);		
	
		this.Thumbnails = new Array();
		this.Selected = new Array();
		this.LastSelection = null;
		this.CurrentSelection = null;
		this.Drag = false;
		this.ThumbnailCount = 0;
		this.ThumbnailsFromSearch = 0;
		this.ThumbnailsFromLocalDisk = 0;
	
	};

	this.PrepareThumbnailsForSend = function() {
	
		var sCaptionText = null;
		var oThumbnail = null;
		var sCaption = "";
		
		for(var i in this.Thumbnails)
		{
			oThumbnail = m_oEditor.ComposeControlDocument.getElementById(this.Thumbnails[i][0]);
			
			if(oThumbnail.Selected) oThumbnail.Deselect();
			
			if(oThumbnail.Caption.disabled) oThumbnail.Caption.removeNode(true);
			else
			{
                oThumbnail.style.backgroundColor = "transparent";
                oThumbnail.style.border = "medium none";
                oThumbnail.style.margin = "0";

				oThumbnail.Caption.style.border = "medium none";
                oThumbnail.Caption.style.padding = "0";
                
                sCaption = ReplaceSpecialChars(oThumbnail.Caption.innerText);
				sCaption = sCaption.replace(/\n/gi,'<br>');

				oThumbnail.Caption.innerHTML = "<a marker=" + oThumbnail.Image.marker + ">" + sCaption + "</a>";
                oThumbnail.Caption.contentEditable = false;
			}
		}
	
	};

	this.RestoreThumbnails = function() {
	
		if(!m_oEditor.ComposeControlReady) editor.QueueFunctionCall("RestoreThumbnails");
		else
		{
			this.Thumbnails = new Array();
			this.Selected = new Array();
			this.LastSelection = null;
			this.CurrentSelection = null;
			this.Drag = false;
			this.ThumbnailCount = 0;
			this.ThumbnailsFromSearch = 0;
			this.ThumbnailsFromLocalDisk = 0;
		
			var oRegEx = new RegExp(this.ThumbnailIdPrefix+"1_[0-9]+", "g");
			var aMessageThumbnailIds = m_oEditor.ComposeControlDocument.body.innerHTML.match(oRegEx);
			var oThumbnail = null;
			
			if(aMessageThumbnailIds)
			{				
				for(var i=0; i<aMessageThumbnailIds.length; i++) 
				{
					oThumbnail = new RTEThumbnail(m_oEditor.ComposeControlDocument.getElementById(aMessageThumbnailIds[i]),m_oEditor);

					if(oThumbnail)
					{
						m_oEditor.ComposeControlDocument.getElementById(aMessageThumbnailIds[i]).replaceNode(oThumbnail);

						if(oThumbnail.Caption.offsetWidth > m_oEditor.imageSize) oThumbnail.Caption.Resize();
						
						this.Thumbnails.push(new Array(oThumbnail.id,oThumbnail.Image.RealPath,oThumbnail.Image.marker,oThumbnail.Origin));
						this.ThumbnailCount++;

						if(oThumbnail.Origin == "S") this.ThumbnailsFromSearch++;
						if(oThumbnail.Origin == "L") this.ThumbnailsFromLocalDisk++;
	
						m_oEditor.Wrapper.ToggleSearch((this.ThumbnailsFromSearch == this.Thumbnails.length));
					}
				}
			}
			else return;	
		}

	};
	
	this.SetBatchInsertionCB = function(p_oObject)
	{
		if(!this.BatchInsertionCB) this.BatchInsertionCB = new Array();
		this.BatchInsertionCB.push(p_oObject);
	}
	
	this.SetBatchDeletetionCB = function(p_oObject)
	{
		if(!this.BatchDeletetionCB) this.BatchDeletetionCB = new Array();
		this.BatchDeletetionCB.push(p_oObject);
	}

	this.SetFirstSelectionCB = function(p_oObject) {

		if(!this.FirstSelectionCB) this.FirstSelectionCB = new Array();
		this.FirstSelectionCB.push(p_oObject);

	};
	
	this.SetLastDeselectionCB = function(p_oObject) {

		if(!this.LastDeselectionCB) this.LastDeselectionCB = new Array();
		this.LastDeselectionCB.push(p_oObject);

	};

	this.SetFirstThumbnailInsertedCB = function(p_oObject) {

		if(!this.FirstThumbnailInsertedCB) this.FirstThumbnailInsertedCB = new Array();
		this.FirstThumbnailInsertedCB.push(p_oObject);
	
	};

	this.SetLastThumbnailDeletedCB = function(p_oObject) {

		if(!this.LastThumbnailDeletedCB) this.LastThumbnailDeletedCB = new Array();
		this.LastThumbnailDeletedCB.push(p_oObject);
	
	};

	this.SetDoubleClickCB = function(p_oObject) {

		if(!this.DoubleClickCB) this.DoubleClickCB = new Array();
		this.DoubleClickCB.push(p_oObject);
	
	};

	this.SetSelectThumbnailCB = function(p_oObject) {

		if(!this.SelectThumbnailCB) this.SelectThumbnailCB = new Array();
		this.SelectThumbnailCB.push(p_oObject);

	};

	this.SetDeselectThumbnailCB = function(p_oObject) {

		if(!this.DeselectThumbnailCB) this.DeselectThumbnailCB = new Array();
		this.DeselectThumbnailCB.push(p_oObject);

	};
	
	this.SetDeleteThumbnailCB = function(p_oObject) {
	
		if(!this.DeleteThumbnailCB) this.DeleteThumbnailCB = new Array();
		this.DeleteThumbnailCB.push(p_oObject);
	
	};

	this.DeleteAllThumbnails = function() {
	
		var i = this.Thumbnails.length-1;
		var sRealPath = "";
		var sMarker = "";
				
		// Make all of the necessary callbacks
		do
		{
			sRealPath = this.Thumbnails[i][1];
			sMarker = this.Thumbnails[i][2];
			
			if(this.DeleteThumbnailCB)
			{
				for(var n in this.DeleteThumbnailCB) this.DeleteThumbnailCB[n](sRealPath, sMarker);
			}			
		}
		while(i--);

		// Notify anyone listening for batch deletes
		for(var i in this.BatchDeletetionCB) this.BatchDeletetionCB[i]();

		// Notify anyone listening for the deletion of the last thumbnail
		if(this.LastThumbnailDeletedCB) for(var i in this.LastThumbnailDeletedCB) this.LastThumbnailDeletedCB[i]();

		// Reset the wrapper
		m_oEditor.Wrapper.ToggleSearch(false);

		// Hide the wrapper if it is visible
		if(m_oEditor.Wrapper.Visible) m_oEditor.Wrapper.Hide();
		
		// Reset all memembers
		this.Thumbnails = new Array();
		this.Selected = new Array();
		this.LastSelection = null;
		this.CurrentSelection = null;
		this.Drag = false;
		this.ThumbnailCount = 0;
		this.ThumbnailsFromSearch = 0;
		this.ThumbnailsFromLocalDisk = 0;

	};

	this.DeleteThumbnail = function(p_sValue, p_nCurrentFileToDelete, p_nTotalFilesToDelete, p_bSkipCallBack) {
	
		var sThumbnailId = "";
		var sRealPath = "";
		var sMarker = "";
		var sOrigin = "";
	
		// Check to see if the value passed is an id or a path

		if(p_sValue)
		{
			if(p_sValue.indexOf("\\") != -1)
			{
				// Get the id that corresponds to the path
				var i = this.Thumbnails.length - 1;
				
				do
				{
					if(this.Thumbnails[i][1] == p_sValue)
					{
						sThumbnailId = this.Thumbnails[i][0];
						break;
					}
				}
				while(i--);
			}
			else sThumbnailId = p_sValue;
		}
		else
		{
			if(this.Thumbnails.length == 1) sThumbnailId = this.Thumbnails[0][0];
			else return;
		}
		
		// Check to see if the numbnail still exists in the document
		
		var oThumbnail = m_oEditor.ComposeControlDocument.getElementById(sThumbnailId);
		
		if(oThumbnail)
		{
			sRealPath = oThumbnail.Image.RealPath;
			sMarker = oThumbnail.Image.marker;
			sOrigin = oThumbnail.Origin;
			
			// Remove the thumbnail from the body of the document
			oThumbnail.removeNode(true);
			oThumbnail = null;
		}
		else
		{
			// Get the id that corresponds to the path
			var i = this.Thumbnails.length - 1;
			
			do
			{
				if(this.Thumbnails[i][0] == sThumbnailId)
				{
					sRealPath = this.Thumbnails[i][1];
					sMarker = this.Thumbnails[i][2];
					sOrigin = this.Thumbnails[i][3];
					break;
				}
			}
			while(i--);
		}
		
		if(!p_bSkipCallBack && this.DeleteThumbnailCB)
		{
			for(var i in this.DeleteThumbnailCB) this.DeleteThumbnailCB[i](sRealPath, sMarker);
		}

		if(sOrigin == "S") this.ThumbnailsFromSearch--;
		if(sOrigin == "L") this.ThumbnailsFromLocalDisk--;
	
		if(this.Selected.length > 0)
		{
			var i = this.Selected.length-1;
			do
			{
				if(this.Selected[i][0] == sThumbnailId)
				{
					this.Selected.splice(i,1);
					break;		
				}				
			}
			while(i--);
		}
		
		var i = this.Thumbnails.length-1;
		do 
		{
			if(this.Thumbnails[i][0] == sThumbnailId)
			{
				this.Thumbnails.splice(i,1);
				break;		
			}	
		}
		while(i--);
		
		m_oEditor.Wrapper.ToggleSearch((this.ThumbnailsFromSearch == this.Thumbnails.length));
		
		if(this.Thumbnails.length == 0)
		{
			if(this.LastThumbnailDeletedCB) for(var i in this.LastThumbnailDeletedCB) this.LastThumbnailDeletedCB[i]();
			if(m_oEditor.Wrapper.Visible) m_oEditor.Wrapper.Hide();
		}

		if(p_nCurrentFileToDelete == p_nTotalFilesToDelete && this.BatchDeletetionCB)
		{
			for(var i in this.BatchDeletetionCB) this.BatchDeletetionCB[i]();
		}

	};
	
	this.MakeSelection = function(p_oThumb) {
	
		this.EndRange.moveToElementText(p_oThumb);
		this.StartRange.setEndPoint("EndToEnd", this.EndRange);
		
		var oRegEx = new RegExp(this.ThumbnailIdPrefix+"1_[0-9]+", "g");
		var aMatches = this.StartRange.htmlText.match(oRegEx);
		
		if(aMatches)
		{
			var i = aMatches.length-1;
			var oThumbnail = null;
				
			do
			{
				oThumbnail = m_oEditor.ComposeControlDocument.getElementById(aMatches[i]);
				if(oThumbnail && !oThumbnail.Selected) oThumbnail.Select();
			}
			while(i--);
		}

	};

	this.ClearSelected = function() {

		if(this.Selected.length > 0)
		{
			var i = this.Selected.length-1;
			var oThumbnail = null;
			
			do
			{
				oThumbnail = m_oEditor.ComposeControlDocument.getElementById(this.Selected[i][0]);
				if(oThumbnail) oThumbnail.Deselect();
			}
			while(i--);
			
			this.LastSelection = null;
			this.CurrentSelection = null;
			this.Drag = false;
		}

	};

	this.GetSelectedDisplayOrder = function() {
	
		var oRegEx = new RegExp(this.ThumbnailIdPrefix+"1_[0-9]+", "g");
		var aMessageThumbnailIds = m_oEditor.ComposeControlDocument.body.innerHTML.match(oRegEx);										
		var aSelectedThumbnails = new Array();
		
		var oThumbnail = null;
		
		for(var i=0; i<aMessageThumbnailIds.length;i++)
		{
			oThumbnail = m_oEditor.ComposeControlDocument.getElementById(aMessageThumbnailIds[i]);
			if(oThumbnail && oThumbnail.Selected) aSelectedThumbnails.push(aMessageThumbnailIds[i]);
		}
		
		return aSelectedThumbnails;
		
	};
	
	this.GetDisplayOrder = function() {

		var oRegEx = new RegExp(this.ThumbnailIdPrefix+"1_[0-9]+", "g");
		var aThumbnails = new Array();
		
		if(m_oEditor.ComposeControlDocument == null ||  m_oEditor.ComposeControlDocument.body == null ) return aThumbnails;

		var aMessageThumbnailIds = m_oEditor.ComposeControlDocument.body.innerHTML.match(oRegEx);
		
		if(aMessageThumbnailIds)
		{
		    for(var i=0; i<aMessageThumbnailIds.length;i++)
			{
				aThumbnails[i] = m_oEditor.ComposeControlDocument.getElementById(aMessageThumbnailIds[i]).Image.RealPath;
			}
		}
		
		return aThumbnails;

	};

}	var RTE_IMG_BUTTON_IMAGE_PREFIX = "rteToggleButtonImage";
	var RTE_IMG_BUTTON_DIV_PREFIX = "rteToggleButtonDiv";
	var rteToggleButtonMap = new Object();
	
	function RTEToggleButton()
	{
		//extended argument API
		var exApi = arguments.length == 4 ? false : true; 
		this.idGenerator = arguments[0] ? arguments[0] : null;
		this.caption = arguments[1] ? arguments[1] : null;
		this.action = arguments[2] ? arguments[2] : null;
		this.reg = exApi && arguments[3] ? arguments[3] : null;
		this.togg = exApi && arguments[4] ? arguments[4] : null;
		this.offReg = exApi && arguments[5] ? arguments[5] : null;
		this.offTogg = exApi && arguments[6] ? arguments[6] : null;
		this.hovReg = exApi && arguments[7] ? arguments[7] : null;
		this.hovTogg = exApi && arguments[8] ? arguments[8] : null;;
		this.bodyHTML = (exApi || !arguments[3]) ? null : arguments[3];

		this.toggled = false;
		this.enabled = true;
		this.instantiated = false;
		this.Instantiate = RTEToggleButtonInstantiate;
		this.Enable = RTEToggleButtonEnable;
		this.Toggle = RTEToggleButtonToggle;
		this.IsToggled = RTEToggleButtonIsToggled;
		this.IsEnabled = RTEToggleButtonIsEnabled;
	}

	function RTEToggleButtonInstantiate()
	{
		this.id = this.idGenerator.GenerateID();
		rteToggleButtonMap[this.id] = this;
		
		var html = "<div style=\"cursor:hand\" title=\"" + this.caption + "\" id=\"";
		html += RTE_IMG_BUTTON_DIV_PREFIX;
		html += this.id;
		html += "\" class=\"RTEToggleButtonNormal\"";
		html += " onselectstart=\"RTEToggleButtonOnSelectStart()\"";
		html += " ondragstart=\"RTEToggleButtonOnDragStart()\"";
		html += " onmousedown=\"RTEToggleButtonOnMouseDown(this)\"";
		html += " onmouseup=\"RTEToggleButtonOnMouseUp(this)\"";
		html += " onmouseout=\"RTEToggleButtonOnMouseOut(this)\"";
		html += " onmouseover=\"RTEToggleButtonOnMouseOver(this)\"";
		html += " onclick=\"RTEToggleButtonOnClick(this)\"";
		html += " ondblclick=\"RTEToggleButtonOnDblClick(this)\"";
		html += ">";

		if(this.bodyHTML) html += this.bodyHTML;
		else
		{
			html += "<img id=\"";
			html += RTE_IMG_BUTTON_IMAGE_PREFIX;
			html += this.id;
			html += "\" src=\"";
			html += this.reg;
			html += "\" alt=\"";
			html += this.caption;
			html += "\" border=0>";
		}
		
		html += "</div>";
		document.write(html);
		this.instantiated = true;
	}

	function RTEToggleButtonEnable(enabled)
	{
		this.enabled = enabled;
		if (this.instantiated) {
			if (this.enabled) {
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + this.id].src = this.toggled ? this.togg : this.reg;
			}
			else 
			{
			    if (this.toggled && this.offTogg && this.offTogg != "") 
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + this.id].src = this.offTogg;
			    else if(this.offReg && this.offReg != "")
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + this.id].src = this.offReg;
				 
			}
		}
	}
	
	function RTEToggleButtonToggle()
	{
		if (this.enabled)
		{
			this.toggled = !this.toggled;
			document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + this.id].src = this.toggled ? this.togg : this.reg		
		}
	}

	function RTEToggleButtonIsToggled()
	{
		return this.toggled;
	}

	function RTEToggleButtonIsEnabled()
	{
		return this.enabled;
	}

	function RTEToggleButtonOnSelectStart()
	{
		window.event.returnValue = false;
	}

	function RTEToggleButtonOnDragStart()
	{
		window.event.returnValue = false;
	}

	function RTEToggleButtonOnMouseDown(element)
	{
		window.event.returnValue = false;
	}

	function RTEToggleButtonOnMouseUp(element)
	{
		window.event.returnValue = false;
	}

	function RTEToggleButtonOnMouseOut(element)
	{
		window.event.returnValue = false;
		var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteToggleButtonMap[id];
		if (button.enabled)
		{
			if(button.toggled && button.hovTogg && button.hovTogg != "") {
			    document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.togg;
			}
		    	
			if (!button.toggled && button.hovReg && button.hovReg != "") {
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.reg;
			}
		}
		window.status = window.defaultStatus;
	}

	function RTEToggleButtonOnMouseOver(element)
	{
		window.status = element.title;
		var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteToggleButtonMap[id];
		if (button.enabled)
		{
			if(button.toggled && button.hovTogg && button.hovTogg != "") {
			    document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.hovTogg;
			}
		    	
			if (!button.toggled && button.hovReg && button.hovReg != "") {
				document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.hovReg;
			}
		}

		window.event.returnValue = false;
	}

	function RTEToggleButtonOnClick(element)
	{
		var id = element.id.substring(RTE_IMG_BUTTON_DIV_PREFIX.length, element.id.length);
		var button = rteToggleButtonMap[id];
		if(!button.enabled) return;
		button.toggled = !button.toggled;
		if(!button.bodyHTML) document.all[RTE_IMG_BUTTON_IMAGE_PREFIX + id].src = button.toggled ? button.togg : button.reg;
		if(button.enabled) eval(button.action);
	}

	function RTEToggleButtonOnDblClick(element)
	{
		RTEToggleButtonOnClick(element);
	}





