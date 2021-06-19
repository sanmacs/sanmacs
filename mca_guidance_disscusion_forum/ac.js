//--------------------------------------------------

var AC_isIE;
var AC_isGecko;
var AC_isSafari;
var AC_isOther; // safest bet is to try what one would try under Gecko

// in general, the AutoComplete code prefers to make "capability tests"
// instead of browser inspection.  e.g., "if ( event.srcElement != null )"

function AC_DetectBrowser( )
{
	var ua = navigator.userAgent.toLowerCase();

	AC_isGecko = ( navigator.product == 'Gecko' );
	AC_isIE = !AC_isGecko && ( ua.indexOf ( "msie" ) != -1 );
	AC_isSafari = !AC_isGecko && !AC_isIE && ( ua.indexOf ( "safari" ) != -1 );
	AC_isOther = !AC_isGecko && !AC_isIE && !AC_isSafari;
}

AC_DetectBrowser ();


// --------------------------------------------------

// add a class to an element
function AC_AddElementClass ( element, className ) {
	// don't add duplicates
	if ( element && element.className.indexOf (className) == -1 )
		element.className += " " + className;
}


// remove a class from an element
function AC_RemoveElementClass ( element, className )
{
	if ( element == null ) return;

	var loc = element.className.indexOf (className);
	if ( loc == -1 ) return;

	// grab the preceding and following string fragments
	element.className = element.className.substring ( 0, loc ) +
				element.className.substring ( loc + className.length + 1 );
}


// check for a class on an element
function AC_ElementHasClass ( element, className )
{
	return ( element && ( element.className.indexOf (className) != -1 ));
}


// scroll a child's frame into the visible area of a parent
// currently only supports vertical coords.
function AC_ScrollToChild ( parent, indexOrElement )
{
	if ( parent == null || indexOrElement == null ) return;

	var cType = typeof indexOrElement;
	if ( cType == "number" || cType == "string" )
	{
		indexOrElement = parent.childNodes[indexOrElement];
	}

	if ( indexOrElement == null ) return;

	if ( indexOrElement.offsetTop + indexOrElement.offsetHeight > parent.scrollTop + parent.clientHeight ) {
		parent.scrollTop = indexOrElement.offsetTop + indexOrElement.offsetHeight - parent.clientHeight;
		return; // top takes priority over the bottom
	}

	if ( indexOrElement.offsetTop < parent.scrollTop )
	{
		parent.scrollTop = indexOrElement.offsetTop;
	}
}


function AC_CancelEvent ( event )
{
	event.returnValue = false;
	if ( event.preventDefault )
	{
		event.preventDefault();
	}
}


function AC_MakeElementTreeUnselectable ( element )
{
	if ( element.nodeType == 1 ) // Elements, not nodes e.g. Text
	{
		element.unselectable = "on";
	}

	for ( var i=0, n=element.childNodes.length; i<n; ++i )
	{
		AC_MakeElementTreeUnselectable ( element.childNodes [i] );
	}
}


function AC_GetTarget( event )
{
	if ( event == null )
	{
		event = window.event;
	}

	if ( event == null )
	{
		return null;
	}

	if ( event.srcElement != null ) // IE
	{
		return event.srcElement;
	}

	var retVal = event.target;
	while ( retVal && retVal.nodeType != 1 ) // climb up from text nodes on Moz
	{
		retVal = retVal.parentNode;
	}

	return retVal;
}


// --------------------------------------------------

var AC_targetElements;
var AC_insertEmailsOnly;

function AC_OnLoad( )
{
	window.AC_selectedEmails = [];

	if ( typeof AC_nickTokens == "undefined" /* && typeof AC_mostTokens == "undefined" */ )
	{
		return;
	}

	// please leave this uncommented - the guts of this need to be commented out for production
	AC_Debug ( "Debug output is on.\n" );

	// setup these up for display use
	// TODO: need a more-general version of this for other properties (e.g., not directly email-related)

	if ( typeof window.AC_listStr == "undefined" || window.AC_listStr == null || window.AC_listStr.length == 0 )
	{
		window.AC_listDisplayStr = "";
	}
	else
	{
		window.AC_listDisplayStr = " (" + window.AC_listStr + ")";
	}

	if ( typeof window.AC_nickNameStr == "undefined" || window.AC_nickNameStr == null || window.AC_nickNameStr.length == 0 )
	{
		window.AC_nickNameDisplayStr = "";
	}
	else
	{
		window.AC_nickNameDisplayStr = " (" + AC_nickNameStr + ")";
	}

	// IE adds a null array item if a literal ends with a comma; clean this up:
	if ( window.AC_nickTokens != null && AC_nickTokens.length > 0 && AC_nickTokens [AC_nickTokens.length-1] == null )
	{
		AC_nickTokens.length -= 1;
	}
	//if ( window.AC_mostTokens != null && AC_mostTokens.length > 0 && AC_mostTokens [AC_mostTokens.length-1] == null )
	//	AC_mostTokens.length -= 1;
	if ( window.AC_allCanons != null && AC_allCanons.length > 0 && AC_allCanons [AC_allCanons.length-1] == null )
	{
		AC_allCanons.length -= 1;
	}

	if ( !AC_isIE )
	{
		// Moz only respects this on the form level, not for individual inputs
		// (Safari: haven't investigated yet).

		var compForm = window.document.forms.Compose;
		if ( compForm )
		{
			compForm.setAttribute ("autocomplete", "off" );
			// TODO: and Firebird seems to ignore it often, even then
		}
	}
	
	// YMAIL-SPECIFIC
	//
	if ( typeof AC_targetElements == "undefined" && AC_targetElements == null )
	{
		AC_targetElements = [ "tofield", "ccfield", "bccfield" ];
	}
	
	for ( var index = 0, numEls = AC_targetElements.length; index < numEls; ++index )
	{
		var field = window.document.getElementById( AC_targetElements[index] );

		if ( field != null )
		{
			field.autocomplete = "off";
			field.onkeydown = AC_OnKeyDown;
			field.onkeypress = AC_OnKeyPress;
			field.onkeyup = AC_OnKeyUp;
			field.onblur = AC_OnBlur;
			field.onselect = AC_OnSelect;
			field.oncut = AC_OnCut;
			field.onpaste = AC_OnPaste;
			field.onclick = AC_OnClick;
		}
	}

	onResize = AC_OnResize( );

	if ( typeof AC_nickTokens == "undefined" /* && typeof AC_mostTokens == "undefined" */ )
	{
		window.AC_loaded = true;
	}
}

// --------------------------------------------------

// binary search in a token array by token
// tokens are sorted by source text, not stored text
function AC_TokenIndex ( tokenStr, tokenArray, startIndex, endIndex ) {
	if ( tokenArray.length == 0 ) return 0;

	var lo=((startIndex!=null)?startIndex:0), hi=((endIndex!=null)?endIndex:tokenArray.length);
	var mid = hi >> 1;
	var t = null;

	while ( hi > lo ) {
		// int'l lowercase not very robust on the server
		t = AC_DeLatinRot13(tokenArray [mid][0].toLowerCase());

		if ( tokenStr > t )
			lo = mid + 1;
		else
			hi = mid;

		mid = ( hi + lo ) >> 1;
	}

	if ( tokenStr > t )
		return hi;
	return lo;
}

// for use with Array.sort
function AC_CompTokensByToken ( token1, token2 )
{
	if ( token1[2] == null ) // caching these halves the time
	{
		token1[2] = AC_Rot13 (token1[0]);
	}	
	
	if ( token2[2] == null )
	{
		token2[2] = AC_Rot13 (token2[0]);
	}

	return token1[2].localeCompare ( token2[2] );
}

// for use with Array.sort - slightly cruder, and slower
function AC_CompTokensByTokenIE5 ( token1, token2 ) {

	if ( token1[2] == null ) // caching these halves the time
	{
		token1[2] = AC_Rot13 (token1[0].toLowerCase());
	}
	
	if ( token2[2] == null )
	{
		token2[2] = AC_Rot13 (token2[0].toLowerCase());
	}

	var tok1 = token1[2];
	var tok2 = token2[2];
	
	if ( tok1 < tok2 )
	{
		return -1;
	}
	
	if ( tok1 > tok2 )
	{
		return 1;
	}
	
	return 0;
}


// --------------------------------------------------


var AC_TAB = 9;
var AC_DELETE = 46;      // removed the currently hilighted suggestion from the list,
	                     // no change to input text (eat the key)
var AC_BACKSPACE = 8;    // delete the character to the left of the caret
var AC_LEFT_ARROW = 37;  // make the selection, end auto-insert
var AC_RIGHT_ARROW = 39; // make the selection, end auto-insert
var AC_HOME = 36;        // go to first suggestion item
var AC_END = 35;         // go to last suggestion item
var AC_PAGE_UP = 33;     // page up in the suggestion list, if visible
var AC_PAGE_DOWN = 34;   // page down in the suggestion list, if visible
var AC_UP_ARROW = 38;    // move the drop down list selection up by one
var AC_DOWN_ARROW = 40;  // move the drop down list selection down by one
var AC_ESC = 27;         // removed list of suggestions, no change to input or hilight
var AC_ENTER = 13;       // make the selection, end auto-insert, move cursor to end of text (eat the key)
var AC_SPACE = 32;       // space bar
var AC_COMMA_KEY = 188;  // comma is the address delimiter
var AC_SEMI_COLON_KEY = 186; // semi-colon is an alternate delimiter
var AC_NBSP = 160;		// ISO 8859-1 and UNICODE non-breaking space
var AC_COMMA = 44;		// ISO 8859-1 and UNICODE comma ','
var AC_SEMI_COLON = 59;	// ISO 8859-1 and UNICODE semi-colon ';'
var AC_SHIFT_KEY = 16;
var AC_CTRL_KEY = 17;
var AC_ALT_KEY = 18;
var AC_LEFT_MS_WINDOWS_KEY = 91; 
var AC_RIGHT_MS_WINDOWS_KEY = 92;
var AC_MS_MENU_KEY = 93;

// Handle Naoki's jp IME.
//
var AC_handledEnter = false;

function AC_OnKeyDown( event )
{
	if ( event == null ) event = window.event;

	var editCtrl = AC_GetTarget ( event );
	if ( editCtrl == null ) return;

	var keyCode = event.keyCode;

	AC_handledEnter = false;

	//if ( keyCode != 18 )
	//window.document.Compose.Body.value += "DOWN="+keyCode+" " + String.fromCharCode(keyCode) + " ";

	// ALL PRINTABLE CHARACTERS MUST BE HANDLED IN KEYPRESS

	// do not consume navigation keys when Ctrl or Alt is pressed
	if ( event.ctrlKey || event.ctrlLeft || event.altKey || event.altLeft || event.metaKey )
	{
		// kill the drop down for these navigation operations
		// (would be nice to be smarter... e.g. ctrl-end when
		// already at the end doesn't require dimissal).
		switch ( keyCode )
		{
		case AC_HOME:
		case AC_END:
		case AC_PAGE_UP:
		case AC_PAGE_DOWN:
		case AC_UP_ARROW:
		case AC_DOWN_ARROW:
		case AC_RIGHT_ARROW:
			AC_RemoveDropDown();
			break;
		}

		return;
	}

	var op = null;

	switch(keyCode)
	{
	case AC_LEFT_ARROW:
	case AC_ESC:
		if ( AC_IsActive() )
		{
			AC_RemoveDropDown();
			AC_CancelEvent ( event ); // IE nukes edited text on escape; we want to simply remove the dropdown
		}
		break;

	case AC_HOME:
		op = "selectFirst";
		break;
	case AC_END:
		op = "selectLast";
		break;
	case AC_PAGE_UP:
		op = "selectPrevPage";
		break;
	case AC_PAGE_DOWN:
		op = "selectNextPage";
		break;
	case AC_UP_ARROW:
		op = "selectPrev";
		break;
		
	case AC_DOWN_ARROW:
		if ( AC_IsActive() )
		{
			AC_UpdateDropDown ( editCtrl, "selectNext" );
			AC_CancelEvent ( event );
		}
		else  
		{
			AC_NewDropDown ( editCtrl );
			if ( AC_IsActive() )
			{
				AC_CancelEvent ( event );
			}
		}
		break;

	case AC_TAB:
		// have to trap this in keyDown on IE, but we
		// need to cancel it in keyPress for Moz--
		if ( !AC_isIE ) break;
		// FALL-THRU:
	case AC_RIGHT_ARROW:
		if ( AC_IsActive() )
		{
			AC_InsertSuggestion ( editCtrl );
			AC_CancelEvent ( event );
		}
		break;

	default:
		break;
	}

	if ( AC_IsActive() && op != null )
	{
		AC_UpdateDropDown ( editCtrl, op );
		AC_CancelEvent ( event );
	}
}


function AC_OnKeyPress( event )
{
	if ( event == null ) event = window.event;

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null ) return;

	// only onKeyPress receives the UNICODE value of the key
	var keyCode = event.keyCode;
	if ( keyCode == 0 ) // as it might on Moz
	{
		keyCode = event.charCode;
	}
	
	if ( keyCode == 0 ) // unlikely to get here
	{
		keyCode = event.which;
	}
	
	AC_handledEnter = false;

	//window.document.Compose.Body.value += "PRESS="+keyCode+" "+String.fromCharCode(keyCode)+" ";
	
	// Do not skip out when modifiers are pressed (ctrl, alt, etc.).
	// Many latin characters are generated with alt, and we must process them
	// as ordinary printable key presses, because, well, they are.  Note that 
	// the keyCode value -- the printable character -- will prevent us from
	// doing something silly like inserting the current menu selection when
	// alt-comma is pressed to generate a c-cedilla.

	if ( event.charCode != null && event.charCode == 0 )
	{
		// short version: this is how you tell it's a nav key, not an ASCII char (the values overlap)

		switch ( keyCode )
		{
		case AC_ESC:
		case AC_HOME:
		case AC_END:
		case AC_PAGE_UP:
		case AC_PAGE_DOWN:
		case AC_UP_ARROW:
		case AC_DOWN_ARROW:
		case AC_RIGHT_ARROW:
			// IE cancels all these on keyDown.  need to cancel them on 'press' for Moz.

			if ( !event.ctrlKey && !event.altKey && !event.metaKey && AC_IsActive() )
			{
				AC_CancelEvent ( event );
			}

			// stop processing-- otherwise they look like %, (, etc.
			return;
		}
	}

	switch ( keyCode )
	{
	case AC_SEMI_COLON:
	case AC_COMMA:
		if (AC_IsActive() && event.shiftKey == false)
		{
			AC_InsertSuggestion ( editCtrl );
			AC_CancelEvent ( event );
		}
		break;

	case AC_ENTER:
	{
		// always cancel return/enter in TEXTAREAs
		if ( editCtrl.tagName == "TEXTAREA" )
		{
			AC_CancelEvent ( event );
		}

		AC_handledEnter = true;
		
		if ( typeof AC_HandleEnter == "function" )
		{
			if ( AC_HandleEnter( ) == true )
			{
				AC_CancelEvent( event );
				return;
			}
		}
	
		// FALL-THRU:
	}
	case AC_TAB: // we get here on Moz
		if (AC_IsActive())
		{
			AC_InsertSuggestion ( editCtrl );
			AC_CancelEvent ( event );
		}
		// TODO: on TAB, fake a select-all in address field TEXTAREAs?
		break;

  	default:
		// all other printable typing ends up here
		//AC_KickNewDropDown ( editCtrl );
		break;
	}
}

  
function AC_OnKeyUp( event )
{
	if ( event == null ) event = window.event;

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null ) return;

	var keyCode = event.keyCode;

	//window.document.Compose.Body.value += "UP="+keyCode+" " + String.fromCharCode(keyCode) + "\n";;

	switch( keyCode )
	{
	case AC_DELETE:
	case AC_BACKSPACE:
		// on key up so we don't interfere with auto-key, and can see the result after the press
		if (AC_IsActive() && editCtrl.value.length == 0 )
		{
			AC_RemoveDropDown();
		}
		else if ( editCtrl.value.length > 0 )
		{
			AC_KickNewDropDown( editCtrl );
		}
		else if ( editCtrl.value.length == 0 && 
			  typeof AC_useSelect != "undefined" && AC_useSelect == true )
		{
			AC_ShowAll( AC_targetElements[ 0 ] );
		}
		break;
	case AC_ESC:
	case AC_HOME:
	case AC_END:
	case AC_PAGE_UP:
	case AC_PAGE_DOWN:
	case AC_UP_ARROW:
	case AC_DOWN_ARROW:
	case AC_LEFT_ARROW:
	case AC_RIGHT_ARROW:
	case AC_TAB:
	case AC_SEMI_COLON:
	case AC_SEMI_COLON_KEY:
	case AC_COMMA:
	case AC_COMMA_KEY:
	case AC_ENTER:
		break;
	default:
 	 	var isSpecial = false;
		if (typeof event.ctrlLeft != "undefined")
		{
			isSpecial = (event.ctrlLeft == true);
		}
		if (isSpecial == false && typeof event.ctrlKey != "undefined")
		{
			isSpecial = (event.ctrlKey == true);
		}
		if (isSpecial == false && typeof event.metaKey != "undefined")
		{
			isSpecial = (event.metaKey == true);
		}
		//if (isSpecial == false && typeof event.altLeft != "undefined")
		//{
		//	isSpecial = (event.altLeft == true);
		//}
		//if (isSpecial == false && typeof event.altKey != "undefined")
		//{
		//	isSpecial = (event.altKey == true);
		//}
		//if (isSpecial == false && typeof event.shiftKey != "undefined")
		//{
		//	isSpecial = (event.shiftKey == true);
		//}
		
		if ( isSpecial == false )
		//if (isSpecial == false && !AC_IsActive() && editCtrl.value.length != 0 )
		{
			AC_KickNewDropDown( editCtrl );
		}
		break;
	}

	// Handle Naoki's jp IME.
	//
	if ( ! AC_handledEnter && keyCode == AC_ENTER )
	{
		AC_KickNewDropDown( editCtrl );
	}
} 


function AC_OnBlur( event )
{
	//window.document.Compose.Body.value += "AC_OnBlur\n";

	// IE
	//
	if ( event == null )
	{
		event = window.event;
	}

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null )
	{
		return;
	}

	// When the drop-down-list is clicked on, AC_Menu_onClick will get called,
	// and it will call AC_RemoveDropDown()() once the selection has been made.
	var listGetsFocus = editCtrl.getAttribute("listGetsFocus");    
	if (listGetsFocus != null)
	{        
		editCtrl.removeAttribute("listGetsFocus");
		return;
	}
	
	// Loosing edit focus means endAutoInsert
	AC_RemoveDropDown();
}

function AC_OnClick( event )
{
	//window.document.Compose.Body.value += "AC_OnClick\n";

	// IE
	//
	if ( event == null )
	{
		event = window.event;
	}

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null )
	{
		return;
	}

	// A mouse click means endAutoInsert
	AC_RemoveDropDown();
}

function AC_OnSelect( event )
{
	//window.document.Compose.Body.value += "AC_OnSelect\n";

	// IE
	//
	if ( event == null )
	{
		event = window.event;
	}

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null )
	{
		return;
	}

	// Either the control has been tabbed into, Ctrl+A, or a range was selected.
	// In all cases auto-text must be disabled.
	AC_RemoveDropDown();
}

function AC_OnCut( event )
{
	//window.document.Compose.Body.value += "AC_OnCut\n";

	// IE
	//
	if ( event == null )
	{
		event = window.event;
	}

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null )
	{
		return;
	}

	// Text has been deleted from this control.  auto-text must be disabled.
	AC_RemoveDropDown();
}

function AC_OnPaste( event )
{
	//window.document.Compose.Body.value += "AC_OnPaste\n";

	// IE
	//
	if ( event == null )
	{
		event = window.event;
	}

	var editCtrl = AC_GetTarget( event );
	if ( editCtrl == null )
	{
		return;
	}

	// Text has been inserted into this control.  auto-text must be disabled.
	AC_RemoveDropDown();
}

function AC_OnResize( event )
{
	//window.document.Compose.Body.value += "AC_OnResize\n";

	AC_PlaceDropDown ();
}

// --------------------------------------------------

function AC_GetCursorIndex(editCtrl)
{
	if ( editCtrl == null || (editCtrl.type != "text" && editCtrl.type != "textarea") )
	{
		//window.document.Compose.Body.value += "1 returning -1\n";
		
		return -1;
	}
	
	// empty control means the cursor is at 0
	if (editCtrl.value == null || editCtrl.value.length == 0)
	{
		//window.document.Compose.Body.value += "2 returning -1\n";
		
		return -1;
	}
	
	// -1 for unknown
	var cursorIndex = -1;

	// IE
	//
	if ( editCtrl.createTextRange )
	{
		var selection = window.document.selection.createRange( );
		var textRange = editCtrl.createTextRange( );
		
		// if the current selection is within the edit control			
		if (textRange == null || selection == null || (( selection.text != "" ) && textRange.inRange(selection) == false) )
		{
			//window.document.Compose.Body.value += "4 returning -1\n";
			
			return -1;
		}
		
		if (selection.text == "")
		{
			if (textRange.boundingLeft == selection.boundingLeft)
			{
				cursorIndex = 0;
			}
			else
			{
				// Handle inputs.
				//
				if ( editCtrl.tagName == "INPUT" )
				{
					var contents = textRange.text;
					var index = 1;
					while (index < contents.length)
					{
						textRange.findText(contents.substring(index));
						if (textRange.boundingLeft == selection.boundingLeft)
						{
							break;
						}
						
						index++;
					}
				}
				// Handle text areas.
				//
				else if ( editCtrl.tagName == "TEXTAREA" )
				{
					var index = editCtrl.value.length + 1;
					var theCaret = document.selection.createRange().duplicate();
					while ( theCaret.parentElement() == editCtrl &&
						theCaret.move("character",1) == 1 )
					{
						--index;
					}
					
					if ( index == editCtrl.value.length + 1 )
					{
						index = -1;
					}
				}
				
				cursorIndex = index;
			}
		}
		else
		{
			cursorIndex = textRange.text.indexOf(selection.text);
		}
	}
	// Moz
	//
	else if ( window.getSelection && window.document.createRange )
	{
		if ( editCtrl.selectionStart < 0 || editCtrl.selectionStart > editCtrl.length )
		{
			return cursorIndex;
		}
		
		if ( editCtrl.selectionEnd < 0 || editCtrl.selectionEnd > editCtrl.length ||
		     editCtrl.selectionEnd < editCtrl.selectionStart )
		{
			return cursorIndex;
		}
		
		cursorIndex = editCtrl.selectionStart;
	}
	// Safari
	//
	else
	{
	}
	
	//window.document.Compose.Body.value += "5 returning "+cursorIndex+"\n";
	
	return cursorIndex;
}


// --------------------------------------------------

function AC_Menu_DeselectItem ( menuElement, index )
{
	var current = menuElement.childNodes[index];

	if ( current != null )
	{
		AC_RemoveElementClass ( current, "ac_menuitem_selected" );
	}
}

function AC_Menu_SelectItem ( menuElement, index, scrollToIt ) {
	var current = menuElement.getAttribute("selectedIndex");
	if ( current != -1 && current != null )
		AC_Menu_DeselectItem ( menuElement, current );

	if ( index >= 0 && index < menuElement.childNodes.length )
	{
		AC_AddElementClass ( menuElement.childNodes[index], "ac_menuitem_selected" );
	}

	if ( scrollToIt )
	{
		AC_ScrollToChild ( menuElement, index );
	}
}


function AC_Menu_onClick( event )
{
	//window.document.Compose.Body.value += "AC_Menu_onClick\n";

	listCtrl = document.getElementById( "ac_select" );
	if ( listCtrl == null ) return;

	var editCtrl = window.document.getElementById(listCtrl.getAttribute("editCtrlID"));
	if ( editCtrl == null )
	{
		return;
	}

	AC_InsertSuggestion( editCtrl );
}

function AC_Menu_onMouseDown( event )
{
	//window.document.Compose.Body.value += "AC_Menu_onMouseDown\n";

	listCtrl = document.getElementById( "ac_select" );
	if ( listCtrl == null ) return;

	var editCtrl = window.document.getElementById(listCtrl.getAttribute("editCtrlID"));
	if ( editCtrl == null )
	{
		return;
	}

	editCtrl.setAttribute("listGetsFocus", "1");
}


function AC_MenuItem_onMouseDown ( event ) {
	if ( event == null ) event = window.event;
	var target = this; // avoids AC_GetTarget( event ) which returns various children,
					   // but note this and other handlers require JS assignment, not inline 

	var current = target.parentNode.getAttribute("selectedIndex");
	if ( current != -1 && current != null )
	{
		AC_RemoveElementClass ( target.parentNode.childNodes[current], "ac_menuitem_selected" );
	}

	AC_AddElementClass (target, "ac_menuitem_selected");

	var children = target.parentNode.childNodes;

	for ( var i=0, n=children.length; i<n; ++i )
	{
		if ( children[i] == target )
		{
			target.parentNode.setAttribute("selectedIndex", i);
			break;
		}
	}
}

function AC_MenuItem_onMouseOver ( event )
{
	if ( !AC_ElementHasClass ( this, "ac_menuitem_selected" ))
	{
		// selected takes priority; not all browsers support "!" styles
		// which would eliminate this check
		AC_AddElementClass ( this, "ac_menuitem_over" );
	}
}

function AC_MenuItem_onMouseOut ( event )
{
	AC_RemoveElementClass ( this, "ac_menuitem_over" );
}

// --------------------------------------------------

var AC_MaxResultItems 	= 30;
var AC_MaxVisibleItems	= 15;

// --------------------------------------------------


// suggestion list control and the DIV that contains it
var AC_dropDownDiv = null;
var AC_dropDownList = null;
var AC_dropDownIFrame = null;



function AC_IsActive()
{
	if (AC_dropDownDiv != null)
	{
		return (AC_dropDownDiv.style.visibility == "visible");
	}
	
	return false;
}

function AC_ShowAll( controlName )
{
	AC_FindSuggestions( "\u0007" );
	AC_NewDropDown( controlName, "compile" );
}

// build a new drop-down for the current state of the edit field, and show it
function AC_NewDropDown ( editCtrl, state )
{
	if ( state == null )
	{
		state = "new";
	}

	if ( typeof editCtrl == "string" )
	{
		editCtrl = document.getElementById ( editCtrl );
	}

	if ( typeof AC_useSelect == "undefined" || AC_useSelect == null || AC_useSelect == false )
	{
		if ( editCtrl == null || editCtrl.value.length == 0 )
		{
			return;
		}
	}

	// 5 major steps for a New operation.

	// 1. analyze the current state of the edit field, and find the text to match against
	if ( state == "new" )
	{
		var cursorIndex = AC_GetCursorIndex(editCtrl);
		if ( cursorIndex == -1 )
		{
			return;
		}

		//window.document.Compose.Body.value += "cursor="+cursorIndex+"\n";

		// Get the end delimiter ahead of the cursor.
		//
		var endDelim = -1;
		var substr = editCtrl.value.substring( cursorIndex );

		//window.document.Compose.Body.value += "endstr="+substr+"\n";

		var commaDelim = substr.indexOf( ',' );
		var semiColonDelim = substr.indexOf( ';' );

		//window.document.Compose.Body.value += "comma="+commaDelim+" semi="+semiColonDelim+"\n";

		if ( semiColonDelim < commaDelim && semiColonDelim != -1 )
		{
			endDelim = semiColonDelim;
		}
		else if ( commaDelim != -1 )
		{
			endDelim = commaDelim;
		}
		else if ( semiColonDelim != -1 )
		{
			endDelim = semiColonDelim;
		}

		if ( endDelim == -1 )
		{
			endDelim = editCtrl.value.length;
		}
		else
		{
			endDelim += cursorIndex;
		}

		//window.document.Compose.Body.value += "end="+endDelim+"\n";

		// Must be working at the "end" of the current input.
		//
		if ( cursorIndex < endDelim )
		{
			var nonWhiteSpace = editCtrl.value.substring( cursorIndex, endDelim ).search(/\S/);

			//window.document.Compose.Body.value += "nonwhiteStr="+editCtrl.value.substring( cursorIndex, endDelim)+"\n";
			//window.document.Compose.Body.value += "nonwhite="+nonWhiteSpace+"\n";

			if ( nonWhiteSpace != -1 )
			{
				return;
			}
		}

		// Get the start delimiter index behind the cursor.
		//
		var startDelim = -1;
		substr = editCtrl.value.substring( 0, cursorIndex );

		//window.document.Compose.Body.value += "startstr="+substr+"\n";

		commaDelim = substr.lastIndexOf( ',' );
		semiColonDelim = substr.lastIndexOf( ';' );
		if ( semiColonDelim > commaDelim )
		{
			startDelim = semiColonDelim;
		}
		// It's ok if the comma one is -1.
		//
		else
		{
			startDelim = commaDelim;
		}

		//window.document.Compose.Body.value += "star="+startDelim+"\n";

		var currentInput = editCtrl.value.substring( startDelim + 1, cursorIndex );
		var firstChar = currentInput.search( /\S/ );
		if ( firstChar != -1 )
		{
			currentInput = currentInput.substring( firstChar );
		}

		//window.document.Compose.Body.value += "curinpu="+currentInput+"\n";

		state = "find";
	}

	
	// 2. get the suggestions based on the current input
	var t1 = (new Date()).getTime();
	if ( state == "find" )
	{
		AC_FindSuggestions( currentInput );
		state = "compile";
	}


	// 3. compile suggestions into formatted list
	var t2 = (new Date()).getTime();
	if ( state == "compile" )
	{
		AC_CompileSuggestions();
		state = "render";
	}


	var t3 = (new Date()).getTime();

	if ( t3 - t1 > 400 )
	{
		//AC_Debug ( currentInput + ":" + ( AC_currentResults ? ( ((AC_currentResults[0]==-1)?"-1":AC_currentResults[0].length) + "+" + ((AC_currentResults[1]==-1)?"-1":AC_currentResults[1].length)) : "null" ) + "bailing find:" + (t2-t1) + " compile:" + (t3-t2) + "ms\n" );
		AC_KickNewDropDown ( editCtrl, "render" );
		return;
	}

	// 4. create the list with the current suggestions     
	if ( state == "render" )
	{
		if ( AC_currentSuggestions != null && AC_currentSuggestions.length > 0 )
		{
			if ( typeof AC_useSelect != "undefined" && AC_useSelect == true )
			{
				AC_SetInSelect( );
			}
			else
			{
				AC_CreateDropDown ( editCtrl, AC_currentSuggestions );
			}
		}
	}
	
	var t4 = (new Date()).getTime();
	//AC_Debug ( currentInput + ":" + ( AC_currentResults ? ( ((AC_currentResults[0]==-1)?"-1":AC_currentResults[0].length) + "+" + ((AC_currentResults[1]==-1)?"-1":AC_currentResults[1].length)) : "null" ) + " find:" + (t2-t1) + " compile:" + (t3-t2) + " render:" + (t4-t3) + " total:" + (t4-t1) + "ms\n" );

	// split out from part 4 to make the debug output cleaner
	if ( AC_currentSuggestions == null || AC_currentSuggestions.length == 0 )
	{
		if ( typeof AC_useSelect != "undefined" && AC_useSelect == true )
		{
			AC_RemoveFromSelect( );
		}
		else
		{
			AC_RemoveDropDown( editCtrl );
		}
		
		return;
	}


	// 5. place it/show it.
	//
	if ( typeof AC_useSelect == "undefined" || AC_useSelect == null || AC_useSelect == false )
	{
		AC_PlaceDropDown ( editCtrl, true );
	}
}


// create the drop-down element for the given suggestion list
function AC_CreateDropDown ( editCtrl, suggestions )
{
	if ( suggestions == null || suggestions.length == 0 )
	{
		AC_RemoveDropDown( editCtrl );
		return;
	}

	var selectedIndex = 0;

	if ( AC_dropDownDiv == null )
	{
		// the select box is placed in a div so it can have z-index=1 and be hidden
		// TODO: it may be that we can ditch this outer container
		AC_dropDownDiv = window.document.createElement("div");
		AC_dropDownDiv.style.position = "absolute";
		AC_dropDownDiv.style.zIndex = 1;
		AC_dropDownDiv.style.visibility = "hidden";
		AC_dropDownDiv.style.fontSize = "0.9em";
	}

	editCtrl.parentNode.insertBefore ( AC_dropDownDiv, editCtrl.nextSibling );

        if ((typeof editor != "undefined" && editor.useAX)  && AC_dropDownIFrame == null) {
                AC_dropDownIFrame = window.document.createElement("iframe");
                AC_dropDownIFrame.style.position = "absolute";
                AC_dropDownIFrame.style.visibility = "hidden";
                AC_dropDownIFrame.frameborder="0";
                AC_dropDownIFrame.scrolling="no";
                AC_dropDownIFrame.src="javascript:false;"

        }
        if (AC_dropDownIFrame != null) {
                editCtrl.parentNode.insertBefore ( AC_dropDownIFrame, editCtrl.nextSibling);
        }

	if ( AC_dropDownList == null )
	{
		AC_dropDownList = window.document.createElement("div");
		// AC_dropDownList.size = 4;
		AC_dropDownList.className = "ac_menu";
		AC_dropDownList.id = "ac_select";
		AC_dropDownList.onclick = AC_Menu_onClick;
		AC_dropDownList.onmousedown = AC_Menu_onMouseDown;
		AC_dropDownList.unselectable = "on";

		AC_dropDownList.style.width = editCtrl.offsetWidth;

		AC_dropDownDiv.appendChild ( AC_dropDownList );
	}


	AC_dropDownList.style.visibility = "hidden";


	// delete any children in excess of what we need
	for ( var i=suggestions.length, n=AC_dropDownList.childNodes.length; i<n; ++i )
	{
		AC_dropDownList.removeChild ( AC_dropDownList.childNodes[suggestions.length] );
	}


	for( var index = 0; index < suggestions.length; index++ )
	{
		var option = AC_dropDownList.childNodes[index];
		if ( option == null )
		{
			option = window.document.createElement("div");
			option.className = "ac_menuitem";

			option.onmousedown = AC_MenuItem_onMouseDown;
			option.onmouseover = AC_MenuItem_onMouseOver;
			option.onmouseout = AC_MenuItem_onMouseOut;

			AC_dropDownList.appendChild(option);
		}
		else
		{
			// remove hiliting for recycled items
			AC_RemoveElementClass ( option, "ac_menuitem_selected" );
		}

		option.value = suggestions[ index ][ 0 ];
		option.text = suggestions[ index ][ 1 ];

		// force everything onto one line:
		option.innerHTML = "<nobr>" + suggestions[ index ][ 2 ] + "</nobr>";
	}


	// only update the overflow after deleting excess children--
	// else we get a scrollbar flash on moz -- KJ
	if ( suggestions.length <= AC_MaxVisibleItems )
	{
		AC_dropDownList.style.height = "auto";

		if ( AC_isGecko )
		{
			// the counterpart for this statement throws an error on IE,
			// hence the "if gecko"
			AC_dropDownList.style.overflow = "hidden";
		}
		
		AC_dropDownList.style.overflowY = "hidden";
	}
	else
	{
		// set up scrolling display - limited to the number of visible items
		// TODO: this could be smarter about limiting the actual height (say,
		// a couple hundred pixels) so that you don't get a ridiculous display
		// when the text size is set really large. also, limited to the
		// viewport would be nice.

		var option = AC_dropDownList.childNodes[AC_MaxVisibleItems-1];

		AC_dropDownList.style.height = ( option.offsetTop + option.offsetHeight + 2 ) + "px";

		if ( AC_isGecko )
		{
			// this statement must be avoided on IE, which throws an error
			AC_dropDownList.style.overflow = "-moz-scrollbars-vertical";
		}
	
		AC_dropDownList.style.overflowY = "scroll";
	}

	AC_MakeElementTreeUnselectable ( AC_dropDownList );

	AC_dropDownList.setAttribute("selectedIndex", selectedIndex);
	AC_Menu_SelectItem (AC_dropDownList, 0);

	AC_dropDownList.style.visibility = "visible";

	AC_dropDownList.setAttribute("selectedIndex", selectedIndex);

	//window.document.Compose.Body.value += AC_dropDownList.innerHTML;

	AC_PlaceDropDown ( editCtrl, true );
}


// apply a navigation operation (next item, etc.) to an already-open drop-down
function AC_UpdateDropDown ( editCtrl, op )
{
	if ( op == null || op == "" ||
		editCtrl == null || editCtrl.value.length == 0 ||
		AC_dropDownList == null || AC_dropDownList.childNodes.length == 0 )
	{
		AC_RemoveDropDown( editCtrl );
		return;
	}    

	var selectedIndex = AC_dropDownList.getAttribute("selectedIndex");
	if (selectedIndex == null)
	{
		selectedIndex = 0;
	}

	var newSelection = selectedIndex;

	switch ( op )
	{
	case "selectPrev": newSelection--; break;
	case "selectNext": newSelection++; break;
	case "selectNextPage": newSelection += AC_MaxVisibleItems; break;
	case "selectPrevPage": newSelection -= AC_MaxVisibleItems; break;
	case "selectFirst": newSelection = 0; break;
	case "selectLast": newSelection = AC_dropDownList.childNodes.length - 1; break;
	default:
		AC_RemoveDropDown( editCtrl );
		return;
	}

	if (newSelection < 0)
	{
		newSelection = 0;
	}

	if (newSelection > (AC_dropDownList.childNodes.length - 1))
	{
		newSelection = (AC_dropDownList.childNodes.length - 1);
	}

	if ( newSelection != selectedIndex )
	{
		AC_Menu_SelectItem ( AC_dropDownList, newSelection, true );
		AC_dropDownList.setAttribute("selectedIndex", newSelection);
	}

	AC_PlaceDropDown ( editCtrl, true );
}


// position and show the drop down relative to the given edit field
function AC_PlaceDropDown ( editCtrl, forceIt )
{
	if ( editCtrl == null && AC_dropDownList != null )
	{
		editCtrl = window.document.getElementById ( AC_dropDownList.getAttribute ( "editCtrlID" ));
	}

	if ( editCtrl == null || AC_dropDownList == null )
	{
		return;
	}

	if ( AC_dropDownDiv.style.visibility != "visible" && !forceIt )
	{
		return;
	}

	// Place the drop down directly beneath the edit control.
	// Update this regularly, as the TEXTAREA can grow and shrink.

	var left = window.document.body.clientLeft - AC_dropDownList.offsetLeft; // TODO: this actually fails on Moz, but the default layout saves us
	var top = editCtrl.offsetHeight + window.document.body.clientTop - AC_dropDownList.offsetTop;
	var parent = editCtrl;
	do
	{
		left += parent.offsetLeft;
		top += parent.offsetTop;
		parent = parent.offsetParent;
	}
	while (parent != null);

	AC_dropDownDiv.style.left = left; 
	AC_dropDownDiv.style.top = top;  
	AC_dropDownDiv.style.visibility = "visible";

        if (AC_dropDownIFrame != null) {
                AC_dropDownIFrame.style.left = AC_dropDownDiv.style.left;
                AC_dropDownIFrame.style.top = AC_dropDownDiv.style.top;
                AC_dropDownIFrame.width = AC_dropDownDiv.offsetWidth;
                AC_dropDownIFrame.height = AC_dropDownDiv.offsetHeight;
                AC_dropDownIFrame.style.zIndex = editor.ComposeControl.style.zIndex + 1;
                AC_dropDownDiv.style.zIndex = AC_dropDownIFrame.style.zIndex + 1;
                AC_dropDownIFrame.style.visibility = "visible";

        }

	// make the drop down width a function of the editCtrl width
	if (AC_dropDownList.offsetWidth < editCtrl.offsetWidth)
	{
		AC_dropDownList.style.posWidth = editCtrl.offsetWidth;
	}

	AC_dropDownList.setAttribute("editCtrlID",editCtrl.id);
}


function AC_RemoveDropDown()
{
	if ( AC_dropDownDiv != null )
	{
		AC_dropDownDiv.parentNode.removeChild ( AC_dropDownDiv );
		AC_dropDownDiv.style.visibility = "hidden";
		AC_dropDownDiv = null;
	}

        if ( AC_dropDownIFrame != null )
        {
                AC_dropDownIFrame.parentNode.removeChild(AC_dropDownIFrame);
                AC_dropDownIFrame.style.visibility = "hidden";
                AC_dropDownIFrame = null;
        }

	
	AC_dropDownList = null;
}

function AC_InsertSuggestion( editCtrl )
{
	if ( AC_IsActive( ) == false )
	{
		return;
	}
	
	// Get the cursor position.
	//
	var cursorIndex = AC_GetCursorIndex(editCtrl);
	if ( cursorIndex == -1 )
	{
		return;
	}
	
	// Get the stuff before the insert.
	//
	var startDelim = -1;
	substr = editCtrl.value.substring( 0, cursorIndex );
	commaDelim = substr.lastIndexOf( ',' );
	semiColonDelim = substr.lastIndexOf( ';' );
	if ( semiColonDelim > commaDelim )
	{
		startDelim = semiColonDelim;
	}
	// It's ok if the comma one is -1.
	//
	else
	{
		startDelim = commaDelim;
	}
	
	var stuffBeforeInsert = "";
	if ( startDelim != -1 )
	{
		stuffBeforeInsert = editCtrl.value.substring( 0, startDelim + 1 ) + " ";
	}
	
	var stuffAfterInsert = editCtrl.value.substring( cursorIndex );

	//window.document.Compose.Body.value += "cur="+cursorIndex+" star="+startDelim+"\n";
	//window.document.Compose.Body.value += "before="+stuffBeforeInsert+"\n";
	//window.document.Compose.Body.value += "after="+stuffAfterInsert+"\n";
	
	// Put in the stuff before the insert;
	//
	editCtrl.value = stuffBeforeInsert;
	
	// Insert the suggestion.
	//
	var item = AC_dropDownList.childNodes[AC_dropDownList.getAttribute("selectedIndex")];
	editCtrl.value += item.text.replace(/\u00A0/g,"");

	// also remember the email for a send-time check:
	AC_selectedEmails [ AC_selectedEmails.length ] = AC_Rot13 ( AC_allCanons [ item.value+1 ]);
	
	// Put in the stuff after.
	//
	if ( stuffAfterInsert.length == 0 )
	{
		editCtrl.value += ', ';
	}
	else
	{
		editCtrl.value += stuffAfterInsert;
	}
	
	AC_RemoveDropDown();
	editCtrl.focus();
}


var AC_updateTimer = null;
var AC_updateEditCtrl;
var AC_updateState;

function AC_KickNewDropDown( editCtrl, state )
{
	if ( AC_updateTimer != null )
	{
		clearTimeout (AC_updateTimer);
	}

	AC_updateEditCtrl = editCtrl;
	AC_updateState = state;

	AC_updateTimer = setTimeout ( "AC_HandleNewDropDown()", 10 ); // fast typers will kill this
	// TODO: examine breaking the search and popup update into two (or more) interruptable operations
}

function AC_HandleNewDropDown()
{
	var editCtrl = AC_updateEditCtrl, state = AC_updateState;

	AC_ClearUpdate (); // clear first, as another might get created before we're done

	if ( editCtrl != null )
	{
		AC_NewDropDown ( editCtrl, state );
	}
}

function AC_ClearUpdate ()
{
	if ( AC_updateTimer != null )
	{
		clearTimeout (AC_updateTimer);
		AC_updateTimer = null;
	}

	AC_updateEditCtrl = null;
	AC_updateState = null;
}


// --------------------------------------------------

// Create a binary list for email existence in the address book
//
function AC_EmailExists( stringOfEmails )
{
	var retVal = "";
	var listOfEmails = stringOfEmails.split( ',' );

	//window.document.Compose.Body.value += "AC_EmailExists list="+listOfEmails+" len="+listOfEmails.length+"\n";

	var emailExpr1 = new RegExp ( /([^@ ;<>]+@[^@ ;<>]+\.[^@ ;<>]+)/ ); // email alone
	var whiteStrip = new RegExp ( /(\s*)/ ); // white space

	for ( var index = 0; index < listOfEmails.length; index++ )
	{
		var email = listOfEmails[ index ];
		var ematch = email.match ( emailExpr1 );

		if ( ematch == null || ematch[1] == null || ematch[1] == "" )
		{
			var ematch = email.match ( whiteStrip );

			// register non-emails -- which will be rejected by the server --
			// but ignore empty white space at the end.  this will get tripped
			// up by commas in the middle of full names - simple check is for
			// the server to ignore this field if the number of entries does
			// not equal the number of parsed emails.  better yet more robust
			// parsing on the client...

			if ( index < listOfEmails.length-1 || ematch == null || ematch[1] != email )
			{
				//window.document.Compose.Body.value += "email="+email+"\n";
				retVal += "0,";
				//window.document.Compose.Body.value += "retval 0\n";
			}

			continue;
		}

		email = ematch[1];
		var found = false;

		//window.document.Compose.Body.value += "email="+email+"\n";

		// only check against all items that came out of an auto-complete process
		// (a linear search for all items against all addresses could be painful)
		// TODO: perhaps a hybrid approach?
		for ( var j = 0; j < AC_selectedEmails.length; j++ )
		{
			if ( email == AC_selectedEmails [j] )
			{
				found = true;
				break;
			}
		}

		// direct approach: emails will appear in the tokens
	//	var tokenIndex = AC_TokenIndex ( email, AC_mostTokens );
	//	if ( AC_mostTokens [ tokenIndex ] != email )
	// mostTokens going away, most likely...
		if ( !found )
		{
			retVal += "0,";

			//window.document.Compose.Body.value += "retval 0\n";
		}
		else
		{
			// YMAIL-SPECIFIC.
			//
			if ( typeof window.document.Compose != "undefined" &&
			     typeof window.document.Compose.AC_Done != "undefined" &&
			     window.document.Compose.AC_Done != null &&
			     typeof window.document.Compose.AC_Done.value != "undefined" &&
			     window.document.Compose.AC_Done.value != 1 )
			{
				window.document.Compose.AC_Done.value = 1;
			}
			
			//window.document.Compose.Body.value += "retval 1\n";

			retVal += "1,";
		}
	}

	if ( retVal == "" )
	{
		retVal = "0,";
	}

	return retVal;
}

// YMAIL-SPECIFIC
//
function AC_PostProcess( )
{
	if ( typeof window.document.Compose == "undefined" ||
	     typeof window.document.Compose.AC_Done == "undefined" ||
	     typeof window.document.Compose.AC_ToList == "undefined" ||
	     typeof window.document.Compose.AC_CcList == "undefined" ||
	     typeof window.document.Compose.AC_BccList == "undefined" ||
	     typeof AC_selectedEmails == "undefined" )
	{
		return;
	}

	if ( typeof AC_nickTokens == "undefined" /* && typeof AC_mostTokens == "undefined" */ )
	{
		return;
	}

	window.document.Compose.AC_Done.value = "";
	window.document.Compose.AC_ToList.value = "";
	window.document.Compose.AC_CcList.value = "";
	window.document.Compose.AC_BccList.value = "";

	//window.document.Compose.Body.value += "PostProcess\n";

	var toField = window.document.getElementById("tofield");
	
	if ( toField != null && 
	     window.document.Compose.AC_ToList != null &&
	     typeof window.document.Compose.AC_ToList != "undefined" &&
	     toField.value.length > 0 )
	{
		var binaryList = AC_EmailExists( toField.value );
		if ( binaryList != null )
		{
			window.document.Compose.AC_ToList.value = binaryList;
		}
	}
	
	var ccField = window.document.getElementById("ccfield");
	
	if ( ccField != null &&
	     window.document.Compose.AC_CcList != null &&
	     typeof window.document.Compose.AC_CcList != "undefined" &&
	     ccField.value.length > 0 )
	{
		var binaryList = AC_EmailExists( ccField.value );
		if ( binaryList != null )
		{
			window.document.Compose.AC_CcList.value = binaryList;
		}
	}
	
	var bccField = window.document.getElementById("bccfield");
	
	if ( bccField != null &&
	     window.document.Compose.AC_BccList != null &&
	     typeof window.document.Compose.AC_BccList != "undefined" &&
	     bccField.value.length > 0 )
	{
		var binaryList = AC_EmailExists( bccField.value );
		if ( binaryList != null )
		{
			window.document.Compose.AC_BccList.value = binaryList;
		}
	}

	//window.document.Compose.Body.value += "AC_Done="+window.document.Compose.AC_Done.value+"\n";
	//window.document.Compose.Body.value += "AC_ToList="+window.document.Compose.AC_ToList.value+"\n";
	//window.document.Compose.Body.value += "AC_CcList="+window.document.Compose.AC_CcList.value+"\n";
	//window.document.Compose.Body.value += "AC_BccList="+window.document.Compose.AC_BccList.value+"\n";
}

// --------------------------------------------------

AC_RotTable = { };

AC_LatinTable = [ ];

function AC_BuildTables ()
{
	var s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", t = "abcdefghijklmnopqrstuvwxyz";

	// build the rot-13 table
	for ( var i=0; i<26; ++i )
	{
		AC_RotTable [s.charAt(i)] = s.charAt((i+13)%26);
		AC_RotTable [t.charAt(i)] = t.charAt((i+13)%26);
	}

	// build the rot-13 code offset table
// DEAD: see AC_Rot13 for how this is might be used
//  window.AC_RotTable2 = { };
//	for ( var i=97; i<110; ++i )
//		AC_RotTable2[i] = 13;
//	for ( var i=110; i<123; ++i )
//		AC_RotTable2[i] = -13;
//	for ( var i=65; i<78; ++i )
//		AC_RotTable2[i] = 13;
//	for ( var i=78; i<91; ++i )
//		AC_RotTable2[i] = -13;

	AC_LatinTable[ 192 ] = AC_LatinTable[ 193 ] = AC_LatinTable[ 194 ] = AC_LatinTable[ 195 ] = AC_LatinTable[ 196 ] = AC_LatinTable[ 197 ] = "a";
	AC_LatinTable[ 199 ] = "c";
	AC_LatinTable[ 200 ] = AC_LatinTable[ 201 ] = AC_LatinTable[ 202 ] = AC_LatinTable[ 203 ] = "e";
	AC_LatinTable[ 204 ] = AC_LatinTable[ 205 ] = AC_LatinTable[ 206 ] = AC_LatinTable[ 207 ] = "i";
	AC_LatinTable[ 209 ] = "n";
	AC_LatinTable[ 210 ] = AC_LatinTable[ 211 ] = AC_LatinTable[ 212 ] = AC_LatinTable[ 213 ] = AC_LatinTable[ 214 ] = AC_LatinTable[ 216 ] = "o";
	AC_LatinTable[ 217 ] = AC_LatinTable[ 218 ] = AC_LatinTable[ 219 ] = AC_LatinTable[ 220 ] = "u";
	AC_LatinTable[ 221 ] = "y";
	AC_LatinTable[ 224 ] = AC_LatinTable[ 225 ] = AC_LatinTable[ 226 ] = AC_LatinTable[ 227 ] = AC_LatinTable[ 228 ] = AC_LatinTable[ 229 ] = "a";
	AC_LatinTable[ 231 ] = "c";
	AC_LatinTable[ 232 ] = AC_LatinTable[ 233 ] = AC_LatinTable[ 234 ] = AC_LatinTable[ 235 ] = "e";
	AC_LatinTable[ 236 ] = AC_LatinTable[ 237 ] = AC_LatinTable[ 238 ] = AC_LatinTable[ 239 ] = "i";
	AC_LatinTable[ 241 ] = "n";
	AC_LatinTable[ 242 ] = AC_LatinTable[ 243 ] = AC_LatinTable[ 244 ] = AC_LatinTable[ 245 ] = AC_LatinTable[ 246 ] = AC_LatinTable[ 248 ] = "o";
	AC_LatinTable[ 249 ] = AC_LatinTable[ 250 ] = AC_LatinTable[ 251 ] = AC_LatinTable[ 252 ] = "u";
	AC_LatinTable[ 253 ] = AC_LatinTable[ 255 ] = "y";
	
	// TODO: what about these?
	// 198 :� -- 223:� -- 230:�

}

AC_BuildTables();


function AC_Rot13( inputText ) {
	if ( inputText == null ) return "";

	var resultText = [];
	var c, s;
//	var from = String.fromCharCode;

	for ( var i=0, n=inputText.length; i<n; ++i )
	{
		resultText [ i ] = ( s = AC_RotTable [(c = inputText.charAt(i))] ) ? s : c;

// alternate using char codes: no faster
//		c = inputText.charCodeAt(i);
//		s = AC_RotTable2[c];
//		resultText [ i ] = from (c + ( s ? s : 0 ));
	}

	//window.document.Compose.Body.value += "rot13=" + inputText + ":" + resultText.join("") + "\n";

	return resultText.join("");
}


function AC_DeLatin( inputText ) {
	if ( inputText == null ) return "";

	var resultText = [];

	for ( var i=0, n=inputText.length; i<n; ++i )
	{
		var c = inputText.charCodeAt(i);
		var sub = AC_LatinTable [c];
		if ( sub == null ) sub = inputText.charAt(i);
		resultText [ resultText.length ] = sub;
	}

	//window.document.Compose.Body.value += "delatin=" + inputText + ":" + resultText.join("") + "\n";

	return resultText.join("");
}


function AC_DeLatinRot13( inputText ) {
	if ( inputText == null ) return "";

	var resultText = [];

	for ( var i=0, n=inputText.length; i<n; ++i )
	{
		var c = inputText.charCodeAt(i);
		var sub = AC_LatinTable [c];
		if ( sub == null ) {
			c = inputText.charAt(i);
			sub = AC_RotTable [c];
			if ( sub == null ) sub = c;
		}
		resultText [ resultText.length ] = sub;
	}

	//window.document.Compose.Body.value += "delatin=" + inputText + ":" + resultText.join("") + "\n";

	return resultText.join("");
}


// generate a string which represents the next lexical substring
function AC_NextToken ( token ) {
	while ( token.length > 0 ) {
		var c = token.charCodeAt(token.length - 1);

		if ( c < 65535 )
			return token.substring ( 0, token.length - 1 ) + String.fromCharCode( c+1 );

		// lop off this character, try to increment the next one
		token = token.substring ( 0, token.length - 1 );
	}

	return null;
}


// match latin accent variations to non-accented ASCII - LOWER CASE!
function AC_DeLatinString ( input ) {
	input = input.replace ( /[\u00E0\u00E1\u00E2\u00E3\u00E4\u00E5]/gi, "a" );
	input = input.replace ( /[\u00E8\u00E9\u00EA\u00EB]/gi, "e" );
	input = input.replace ( /[\u00E7]/gi, "c" );
	input = input.replace ( /[\u00F1]/gi, "n" );
	input = input.replace ( /[\u00F2\u00F3\u00F4\u00F5\u00F6\u00F8]/gi, "o" );
	input = input.replace ( /[\u00F9\u00FA\u00FB\u00FC]/gi, "u" );
	input = input.replace ( /[\u00FD\u00FF]/gi, "y" );
	input = input.replace ( /[\u00C6]/gi, "\u00E6" ); // �

	// TODO: what about: 223=� ?

	return input;
}


// base string munging for both search and menu highlighting;
// handles latin accent overlays, and knocking out RE meta-characters
function AC_InnerMatchString ( input )
{
	// defang things that look like RE metacharacters
	input = input.replace( /([\\|\[|\]|\(|\)|\{|\}|\+|\.|\^|\$|\?])/g, "\\\$1");

	// match latin accent variations to each other
	input = input.replace ( /[a\u00E0\u00E1\u00E2\u00E3\u00E4\u00E5]/gi, "[a\u00E0\u00E1\u00E2\u00E3\u00E4\u00E5]" );
	input = input.replace ( /[e\u00E8\u00E9\u00EA\u00EB]/gi, "[e\u00E8\u00E9\u00EA\u00EB]" );
	input = input.replace ( /[c\u00E7]/gi, "[c\u00E7]" );
	input = input.replace ( /[n\u00F1]/gi, "[n\u00F1]" );
	input = input.replace ( /[o\u00F2\u00F3\u00F4\u00F5\u00F6\u00F8]/gi, "[o\u00F2\u00F3\u00F4\u00F5\u00F6\u00F8]" );
	input = input.replace ( /[u\u00F9\u00FA\u00FB\u00FC]/gi, "[u\u00F9\u00FA\u00FB\u00FC]" );
	input = input.replace ( /[y\u00FD\u00FF]/gi, "[y\u00FD\u00FF]" );

	// TODO: what about: 223=� ?

	return input;
}


// expression for matching input against the search strings
function AC_OuterSearchExpr ( input )
{
	var isDoubleByte = false;
	for ( var index = 0; index < input.length; ++index )
	{
		if ( input.charCodeAt(index) > 127 )
		{
			isDoubleByte = true;
			break;
		}
	}
	
	if ( isDoubleByte == true )
	{
		var newInput = "";
		for ( var index = 0; index < input.length; ++index )
		{
			if (input.charAt(index) == "\\")
			{
				newInput += "\\";
				index++;
				if (index >= input.length)
				{
					break;
				}
			}
			newInput += input.charAt(index) + "\u00A0{0,1}";
		}
		input = newInput;
	}
	
	// allow match to cross over words (e.g. skip over middle names)
	input = input.replace ( / /, " (\\S+ +<{0,1})*" );

	// matching starts at the beginning or after certain delimiters
	return new RegExp ( "(^|[ <\"]|\u00A0)" + input, "gi" );
}


// expression for inserting highlighting tags (bold) around the matching text in the drop down menu items;
// we can't recycle the search expression because of rot13 and other stuff that differs
function AC_OuterMenuExpr ( input )
{
	var isDoubleByte = false;
	for ( var index = 0; index < input.length; ++index )
	{
		if ( input.charCodeAt(index) > 127 )
		{
			isDoubleByte = true;
			break;
		}
	}

	if ( isDoubleByte == true )
	{
		var newInput = "";
		for ( var index = 0; index < input.length; ++index )
		{
			newInput += input.charAt(index) + "\u00A0{0,1}";
		}
		input = newInput;
	}

	// menu text includes HTML escaped email address
	input = input.replace(/</, "&lt;");

	if ( input.search ( / / ) == -1 )
	{
		// no spaces - add generic matches at the end so we can use $3, $4 in all cases
		input += ")(.*)($";
	}
	else
	{
		// allow match to cross over words (e.g. skip over middle names); we set up 4 clusters
		// so that the stuff before and after the skipped words can be highlighted independently:
		// NOTE: ? operators don't work on IE5.  We lose the menu highlighting once the user types a space.
		input = input.replace(/ /," +)((?:\\S+ +(?:<|&lt;){0,1})*?)(" );
	}

	// matching starts at the beginning or after certain delimiters
	return new RegExp ( "(^|[ <\"]|&lt;|\u00A0)(" + input + ")", "gi" );
}


// --------------------------------------------------

var AC_currentInput = null;
var AC_currentResults = null;
var AC_currentSuggestions = null;

var AC_substringMatches = { };
var AC_substringMatchesLinear = { };


// --------------------------------------------------


// takes the search results, sorts them and formats for disaplay (e.g. highlight the match text)
function AC_CompileSuggestions ()
{
	var inputText = AC_currentInput;
	var searchResults = AC_currentResults;
	if ( searchResults == null )
	{
		searchResults = AC_substringMatchesLinear[ inputText ];
	}
	
	if ( searchResults == null )
	{
		AC_currentSuggestions = null;
		return null;
	}

	var suggestions = new Array( );

	try
	{
		var matchExpr = AC_OuterMenuExpr ( AC_InnerMatchString ( inputText ));
		//window.document.Compose.Body.value += matchExpr+"\n";
	}
	catch(e)
	{
		// this can fail if the text has RegExp-like input (mostly accounted for above)...
		// just bail if so (they are unlikely to match anything anyway)
		var matchExpr = null; 
	}


	var total = 0;
	var seenAddresses = [ ]; // TODO: this is index-based.  make it actual-email-based.

	for ( var j=0; j < 2; ++ j )
	{
		if ( typeof AC_ignoreMaxResultItems == "undefined" ||
			AC_ignoreMaxResultItems == null ||
			AC_ignoreMaxResultItems == false )
		{
			if ( total >= AC_MaxResultItems )
			{
				break;
			}
		}

		var isNick = ( j == 0 );

		// accommodate both index-based and sublist-based results. (testing purposes)
		var matches = searchResults[j];
		if ( matches == null ) continue;

		if ( matches.start == null )
		{
			// this is a sublist
			var fromList = matches;
			indexes = { start: 0, end: fromList.length }
		}
		//else
		//{
		//	// these are indices into the original lists
		//	indexes = matches;
		//	var fromList = isNick ? AC_nickTokens : AC_mostTokens;
		//}

		if ( fromList == null || fromList.length == 0 )
		{
			continue;
		}

		// sort each body of results independently.
		// this is inside the outer loop because we want to skip it
		// for the main group if the nicknames fill the menu

		// cache the sorted results
		// TODO: when using full linear search, this could *replace* the
		// token list, instead of sitting beside it.  then flag it as sorted.
		// NOTE: need to tread carefully (not lose the unsorted part of the
		// array) when the list is longer than the menu; will need to be sorted
		// again for the next descendent string, too, until the results are <30.

		if ( searchResults[j+2] != null )
		{
			fromList = searchResults[j+2];
		}
		else
		{
			// only sort as many items as the menu will hold;
			// while this is lame, we simply get killed on large sorts.
			// the menu is only a subset of visible items, as it is.
			//
			var sortEnd = indexes.start;
			if ( typeof AC_ignoreMaxResultItems == "undefined" ||
				 AC_ignoreMaxResultItems == null ||
				 AC_ignoreMaxResultItems == false )
			{
				sortEnd += AC_MaxResultItems;
			}
			else
			{
				sortEnd += indexes.end;
			}

			if ( indexes.end < sortEnd )
			{
				sortEnd = indexes.end;
			}

			fromList = fromList.slice ( indexes.start, sortEnd );
			fromList.sort (( typeof inputText.localeCompare == "function" ) ? AC_CompTokensByToken : AC_CompTokensByTokenIE5 );
			searchResults[j+2] = fromList;
		}

		// this is now a separate sublist:
		indexes = { start: 0, end: fromList.length };

		for ( var index = indexes.start; index < indexes.end; index++ )
		{
			if ( typeof AC_ignoreMaxResultItems == "undefined" ||
				AC_ignoreMaxResultItems == null ||
				AC_ignoreMaxResultItems == false )
			{
				if ( total >= AC_MaxResultItems )
				{
					break;
				}
			}

			var cIndex = fromList[ index ][1];
			if ( cIndex == null ) continue;

			if ( typeof seenAddresses [ cIndex ] != "undefined" ) // duplicate removal
			{
				continue;
			}
			
			seenAddresses [ cIndex ] = null;

			if ( fromList [ index ][3] == null )
			{
				fromList [ index ][3] = AC_Rot13  ( AC_allCanons[ cIndex ] ).replace ( /"/g, "\\\"" );
			}

			var name = fromList [ index ][3];
			
			// Enclose recipient separators in quotes
			if ( name.search  ( /[,";@]/ ) != -1 )
			{
				name = '"' + name + '"';
			}

			if ( fromList [ index ][4] == null )
			{
				fromList [ index ][4] = AC_Rot13 ( AC_allCanons[ cIndex+1 ] );
			}

			var addr = fromList [ index ][4];
			var isList = ( addr.length == 0 );
			
			var suggestionText; // = name;
			var menuText;

			if ( typeof AC_insertEmailsOnly != "undefined" && AC_insertEmailsOnly == true )
			{
				if ( isList )
				{
					suggestionText = name;
				}
				else
				{
					suggestionText = addr;
				}
				
				addr = addr.replace(/</g,"&lt;");
                                addr = addr.replace(/>/g,"&gt;");
				menuText = name + ( isList ? "" : ( " &lt;" + addr + "&gt;" ));
			}
			// YMAIL-SPECIFIC.
			//
			else
			{
				// TODO: we don't really need the suggestion text until
				// a drop-down item is picked.  This could be built at
				// AC_InsertSuggestion time, simplifying (and slightly
				// speeding up) this loop.
				suggestionText = name + ( isList ? "" : ( " <" + addr + ">" ));
				addr = addr.replace(/</g,"&lt;");
                                addr = addr.replace(/>/g,"&gt;");
				menuText = name + ( isList ? "" : ( " &lt;" + addr + "&gt;" ));
			}

			if ( isNick )
			{
				// replace once (the nickname only)
				var nick = AC_Rot13( fromList[ index ][0] );
				if ( matchExpr )
				{
					nick = nick.replace ( matchExpr, "$1<b>$2</b>$3$4" );
				}
				
				menuText = [ "<i>", nick, AC_nickNameDisplayStr, "</i> - ", menuText ].join("");
			}
			 else if ( isList )
			 {
				// replace once (the list name only)
				if ( matchExpr )
				{
					name = name.replace ( matchExpr, "$1<b>$2</b>$3$4" );
				}
				
				menuText = [ "<i>", name, AC_listDisplayStr, "</i>" ].join("");
			}
			else
			{
				if ( matchExpr )
				{
					menuText = menuText.replace ( matchExpr, "$1<b>$2</b>$3<b>$4</b>" );
					menuText = menuText.replace(/\u00A0/g,"");
				}
			}

			suggestions [ suggestions.length ] = [ cIndex, suggestionText, menuText ];

			total++;
		}
	}
	
	AC_currentSuggestions = suggestions;
	
	if ( suggestions.length == 0 )
	{
		return null;
	}
	
	return suggestions;
}


// --------------------------------------------------


function AC_FindSuggestions( inputText )
{
	//window.document.Compose.Body.value += "FIND="+inputText+"\n";

	if ( inputText != null )
	{
		inputText = AC_DeLatinString ( inputText.toLowerCase() );
	}

	if ( AC_currentInput != inputText )
	{
		AC_currentInput = inputText;
		AC_currentResults = null;
		AC_currentSuggestions = null;
	}

	if ( typeof AC_nickTokens == "undefined" /* && typeof AC_mostTokens == "undefined" */ )
	{
		return ( AC_currentSuggestions = null );
	}

	if ( inputText == null || inputText.length <= 0 || ( AC_nickTokens == null /* && AC_mostTokens == null */ ))
	{
		return ( AC_currentSuggestions = null );
	}

	//if ( typeof AC_mostTokens != "undefined" )
	//{
	//	AC_currentSuggestions = AC_FindBinary( inputText );
	//}
	//else
	{
		AC_currentSuggestions = AC_FindLinear( inputText );
	}
}


/*
function AC_FindBinary( inputText )
{
	if ( AC_substringMatches[ inputText ] == null )
	{

		AC_substringMatches[ inputText ] = [ null, null ];

		if ( inputText.length > 1 && ( window.document.Compose.Narrow == null || window.document.Compose.Narrow.checked ) ) {
			var prefix = inputText.substring ( 0, inputText.length-1 );

			if ( AC_substringMatches[ prefix ] == null )
				AC_FindBinary( prefix ); // fast typing can cause this - recur

			if ( AC_substringMatches[ prefix ][0] != null )
				AC_FindBinaryTokens ( inputText, AC_nickTokens, AC_substringMatches[ prefix ][0], true );

			if ( AC_substringMatches[ prefix ][1] != null && AC_substringMatches[ prefix ][1] != -1 )
				AC_FindBinaryTokens ( inputText, AC_mostTokens, AC_substringMatches[ prefix ][1], false );
			else
				AC_FindBinaryTokens ( inputText, AC_mostTokens, { start: 0, end: AC_mostTokens.length }, false );

		} else {

			AC_FindBinaryTokens( inputText, AC_nickTokens, { start: 0, end: AC_nickTokens.length }, true );
			if ( AC_substringMatches[ inputText ][0] != null && AC_substringMatches[ inputText ][0].length >= AC_MaxResultItems )
				AC_substringMatches[ inputText ][1] = -1; // special value meaning "search not performed"
			else
				AC_FindBinaryTokens( inputText, AC_mostTokens, { start: 0, end: AC_mostTokens.length }, false );

		}
	}

	AC_currentResults = AC_substringMatches[ inputText ];
}


function AC_FindBinaryTokens( inputText, fromList, fromRange, nicknames ) {
	if ( fromRange == null )
	{
		fromRange = { "start": 0, "end": fromList.length };
	}

	var start = AC_TokenIndex ( inputText, fromList, fromRange.start, fromRange.end );
	var end = fromRange.end;

	if ( start >= end )
		return;

	// find the position of the "next" token (lexically speaking), and mark the indicated range
	var nextToken = AC_NextToken ( inputText );

	if ( nextToken == null )
	{
		var newEnd = fromRange.end;
	}
	else
	{
		var newEnd = AC_TokenIndex ( nextToken, fromList, start, fromRange.end );
	}

	if ( newEnd == start )
	{
		AC_substringMatches[ inputText ][ nicknames?0:1 ] = null;
		return;
	}

	if ( newEnd > start ) {
		AC_substringMatches[ inputText ][ nicknames?0:1 ] = { "start": start, "end": newEnd };
		return;
	}

	// AC_substringMatches[ inputText ][ nicknames?0:1 ] = null;
	// fall back to a brute linear search - should never get here,
	// but i'm leaving this in for now

	AC_Debug ( "fallback to linear search in the binary case\n" );

	var encodedInputText = AC_DeLatinRot13 ( inputText );

	for ( var index = start; index < end; index++ )
	{
		if ( fromList[ index ] == null || fromList[ index ][0] == null ||
			fromList[ index ][0].length <= 0 )
		{
			continue;
		}

		var substrSuggestion = null;

		// No substring.
		//
		substrSuggestion = fromList[ index ][0].substring( 0, encodedInputText.length );

		if ( substrSuggestion == null || substrSuggestion.length <= 0 )
		{
			continue;
		}


		substrSuggestion = AC_DeLatin ( substrSuggestion.toLowerCase() );

		if ( substrSuggestion.indexOf( encodedInputText ) != -1 )
		{
			if ( AC_substringMatches[ inputText ][nicknames?0:1] == null )
			{
				AC_substringMatches[ inputText ][nicknames?0:1] = new Array( );
			}

			var suggArr = AC_substringMatches[ inputText ][nicknames?0:1];
			suggArr[ suggArr.length ] = fromList[ index ];
		}
		else
		{
			// no match.  since we're sorted, this is the end of possible matches - break out
			break;
		}
	}
}
*/

function AC_CleanRecipientValue ( fieldID ) {                          
  var field = document.getElementById( fieldID );             
  if ( field == null || field.value == null || field.value.length == 0 )
    return;                                             
  
  // works whether we're using INPUTs or TEXTAREAs:           
  field.value = field.value.replace ( /(\n\r|\r\n|\s)/g, " " ).replace ( /;/g, "," ).replace( /,(,|\s)*,/g,",");
  // this will slam semi-colons inside names
}

// --------------------------------------------------


function AC_FindLinear ( inputText )
{
	if ( AC_substringMatchesLinear[ inputText ] == null )
	{
		AC_substringMatchesLinear[ inputText ] = [ null, null ];
		var matches = AC_substringMatchesLinear[ inputText ];

		// structured so that if there are a lot of nickname matches,
		// we don't bother searching the canons.  and, the next
		// longer descendent string won't have results to narrow from

		if ( inputText.length > 1 /*&& ( window.document.Compose.Narrow == null || window.document.Compose.Narrow.checked )*/ )
		{
			var prefix = inputText.substring ( 0, inputText.length-1 );

			var prefixMatches = AC_substringMatchesLinear[ prefix ];
			if ( prefixMatches == null )
			{
				AC_FindLinear( prefix ); // fast typing can cause this - recur
			}

			prefixMatches = AC_substringMatchesLinear[ prefix ];

			if ( prefixMatches[0] != null )
			{
				if ( prefixMatches[0].length == 0 )
				{
					matches[0] = prefixMatches[0]; // recycle empty result arrays
				}
				else
				{
					matches[0] = AC_FindLinearTokens ( inputText, prefixMatches[0] );
				}
			}

			if ( matches[0] != null && matches[0].length >= AC_MaxResultItems )
			{
				matches[1] = -1;
			}
			else if ( prefixMatches[1] != null && prefixMatches[1] != -1 )
			{
				if ( prefixMatches[1].length == 0 ) // recycle empty arrays
				{
					matches[1] = prefixMatches[1];
				}
				else
				{
					matches[1] = AC_FindLinearTokens ( inputText, prefixMatches[1] );
				}
			}
			// else we'll take the full search path, coming up shortly
		}

		if ( matches[0] == null )
		{
			matches[0] = AC_FindLinearTokens( inputText, AC_nickTokens );
		}

		if ( matches[1] == null )
		{
			if ( matches[0] != null && matches[0].length >= AC_MaxResultItems )
			{
				matches[1] = -1; // special value meaning "search not performed"
			}
			else
			{
				// we only search the canon list once for a given prefix root;
				// all longer child strings will use a token search using these results:
				matches[1] = AC_FindLinearCanons( inputText, AC_allCanons );
			}
		}
	}

	AC_currentResults = AC_substringMatchesLinear[ inputText ];
}


// searches a tokens-format list
function AC_FindLinearTokens ( inputText, fromList )
{
	var results = [ ], token;

	var showAll = false;
	if ( inputText == "\u0007" )
	{
		showAll = true;
	}

	var inputExpr = AC_OuterSearchExpr ( AC_Rot13 ( AC_InnerMatchString ( inputText ) ) );

	// Check if we need to ignore nicknames.
	//
	if ( typeof AC_ignoreNickNames != "undefined" && AC_ignoreNickNames == true )
	{
		return;
	}

	for ( var i=0, n=fromList.length; i < n; i++ )
	{
		//window.document.Compose.Body.value += "input=["+inputExpr+"] nameC=["+AC_DeLatinRot13(fromList[i][0])+"]\n";
		token = fromList[ i ];
		if ( showAll == true || token[0].search( inputExpr ) != -1 )
		{
			results[ results.length ] = token;
		}
	}

	return results;
}


// searches a canons-format list; returns a new list of pseudo-tokens
function AC_FindLinearCanons ( inputText, fromList )
{
	var results = [ ];
	var name, email;

	var showAll = false;
	if ( inputText == "\u0007" )
	{
		showAll = true;
	}

	var inputExpr = AC_OuterSearchExpr ( AC_Rot13 ( AC_InnerMatchString ( inputText ) ) );

	for ( var i=0, n=fromList.length; i<n; i+=2 )  // note increment - this is a canon list
	{
		var name = fromList[ i ];
		var email = fromList[ i+1 ];

		//window.document.Compose.Body.value += "input=["+inputExpr+"] nameC=["+AC_DeLatinRot13(name)+"]\n";
		if ( showAll == true ||
		     name.search ( inputExpr ) != -1 ||
		     email.search ( inputExpr ) != -1 )
		{
			// Check if we need to ignore lists due to unaliasing reasons.
			//
			if ( email.length == 0 &&
			     typeof AC_ignoreLists != "undefined" && AC_ignoreLists == true )
			{
				continue;
			}

			// construct a token-like thing on the fly
			// note how this works: we check for a match against EITHER the name or the email.
			// concatenating all the canons, not just the search matches, is too expensive.
			// after this point, the token constructed here will allow for a match against
			// BOTH name and email as the string gets longer.  we rely on the fact that this
			// almost never happens (all typed values will come through here first, while the
			// text is short, then land in the linear token search as the input gets longer).

			if ( email.length > 0 )
			{
				name = [ name, " <", email, ">"].join("");
			}

			// TODO: escaping (i think this can be done at compile time)
			// TODO: it would be possible to make the pseudo-token only contain the name
			// (avoids this concat here), then match for "<" later in the token search,
			// when the string is longer and there are fewer prefix matches to search.

			results[ results.length ] = [ name, i ];
		}
	}

	return results;
}


// --------------------------------------------------

function AC_Debug () {
	var text = AC_Debug.arguments[0];

	for ( var i=1, n=AC_Debug.arguments.length; i<n; ++i ) {
		text += " " + AC_Debug.arguments[i];
	}

	// comment out this line to disable debug output:
	//window.document.Compose.Body.value += text;
}

// --------------------------------------------------
// create the drop-down element for the given suggestion list
//
function AC_SetInSelect( )
{
	var targetElement = document.getElementById(AC_targetSelect);

	if ( AC_currentSuggestions == null || AC_currentSuggestions.length == 0 )
	{
		return;
	}

	var selectedIndex = 0;

	targetElement.innerHTML="";

	for( var index = 0; index < AC_currentSuggestions.length; index++ )
	{
		//optionValue = AC_currentSuggestions[ index ][ 0 ];
		optionText = AC_currentSuggestions[ index ][ 1 ].replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;");

		optionElement = document.createElement("option");
		optionElement.setAttribute("value",optionText);
		optionElement.setAttribute("title",AC_currentSuggestions[ index ][ 1 ]);
		optionElement.innerHTML = optionText;

		// force everything onto one line:
		//
		targetElement.appendChild(optionElement);
	}
}

function AC_RemoveFromSelect( )
{
	var targetElement = document.getElementById(AC_targetSelect);
	var children = targetElement.childNodes;
	
	for ( var index = 0, numChildren = children.length; index < numChildren; ++index )
	{
		targetElement.removeChild( children[ 0 ] );
	}
}

