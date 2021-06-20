var allChecked=false;

function addImage(fileUrl) {
	findObj('previewImage').src = fileUrl;
	findObj('imageName').value = fileUrl;
}

function addRows(parent, quantity) {
	var qty			= document.getElementById(quantity).value;
	var rowCount	= document.getElementById('rowCount').value;
	var parentNode	= document.getElementById(parent);
	
	qty = (qty >= 1)  ? qty: 1;
	qty = (qty <= 20) ? qty: 20;
	
	for (i=0; i<qty; i++) {
		var newRow		= document.createElement('tr');
		newRow.setAttribute('id', 'orderRow_'+rowCount);
		parentNode.appendChild(newRow);
		newRow.innerHTML = '<td valign="top"><a href="" onclick="return delRow(\'orderRow_'+rowCount+'\')"><img src="admin/images/del.gif" alt="" /></a></td><td valign="top"><input type="hidden" name="id['+rowCount+']" value="" /><input type="text" name="prodName['+rowCount+']" class="textbox" value="" size="40"/></td><td valign="top"><input name="productCode['+rowCount+']" id="product_code'+rowCount+'" type="text" class="textbox" value="" size="15" /></td><td valign="top"><textarea name="product_options['+rowCount+']" cols="20" rows="1" class="textbox"></textarea></td><td valign="top"><input name="eanupcCode['+rowCount+']" type="text" class="textbox" value="" size="15" /></td><td align="center" valign="top"><input name="quantity['+rowCount+']" type="text" class="textbox" style="text-align:center;" value="" size="3" /></td><td align="center" valign="top"><input name="price['+rowCount+']" type="text" class="textbox" style="text-align:right;" value="" size="7" /></td>';
		rowCount++;
	}
	document.getElementById('rowCount').value = rowCount;
	return false;
}

function checkAll(fieldName,val) {
	var checks = findObj(fieldName)
	for (i=0; i<checks.length; i++) {
		if(val == 'true') {
			checks[i].checked = true;
		} else {
			checks[i].checked = false;
		}
	}
}

function checkUncheck(parent, className) {
	var elements = $(parent).getElementsByClassName(className);
	for (i=0;i<elements.length;i++) {
		var ele = elements[i];
		(allChecked==false) ? ele.checked='checked' : ele.checked='';
	}
	(allChecked!=true) ? allChecked=true : allChecked=false;
	return false;
}

function compareInputbox(idNo) {
	if (findObj('custom_'+idNo) != findObj('default_'+idNo)) {
		// show revert buttons
		findObj('revertLink_'+idNo).style.display = '';
		findObj('revAllLink').style.display='';
		var tds = findObj('tr_'+idNo).getElementsByTagName('td');
		for (var i = 0; i <= 2; i++) {
			tds[i].className = 'tdModified';
		}
	}	
}

function decision(message, url) {
	if (confirm(message)) {
		location.href = url;
	} else {
		return false;
	}
}

function delRow(element) {
	var node	= document.getElementById(element);
	var parent	= node.parentNode;
	parent.removeChild(node);
	return false;
}

function disableSubmit(obj,msg) {
	obj.value=msg; 
	obj.disabled=true;
	obj.disabled=true;
	obj.className='submitDisabled';
}

function displayStatusMsg(msgStr) { //v1.0
	status=msgStr;
	document.returnValue = true;
}

function editVal(id,val) {
	findObj(id).value = val;
}

function findObj(n, d) {
	var p,i,x; 
	if (!d) d=document;
	if ((p=n.indexOf("?"))>0&&parent.frames.length){
		d=parent.frames[n.substring(p+1)].document;
		n=n.substring(0,p);
	}
	if (!(x=d[n])&&d.all) x=d.all[n];
	for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for (i=0;!x&&d.layers&&i<d.layers.length;i++) x=findObj(n,d.layers[i].document);
	if (!x && d.getElementById) x=d.getElementById(n);
	return x;
}

function flashBasket(flashes) {
	setTimeout("flash("+flashes+")", 500);
}
		
function flash(flashes) {
	var targetBtn = findObj('flashBasket');
	if (flashes<=0) return;
	if ((flashes%2) == 0) {
		targetBtn.className="flashBasket";
	} else {
 		targetBtn.className="txtviewCart";
	}
	setTimeout("flash("+(flashes-1)+")", 300);
	return;
}

function getImage(imageName) {
	var img	= findObj('img');
	img.src	= img.src.replace(/language\/[a-z\-_]{2,5}\/flag.gif/gi, imageName);
}

function setMainImage(imageName) {
	findObj('img').src = imageName;
}

function goToURL() { //v3.0
  var i, args=goToURL.arguments; document.returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}

function jumpMenu(target, object, restore) { 
	eval(target+".location='"+object.options[object.selectedIndex].value+"'");
	if (restore) object.selectedIndex=0;
}

function menuBlinds() {
	
}

function openPopUp(url, windowName, w, h, scrollbar) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scrollbar+',resizable=1';
	win = window.open(url, windowName, winprops);
	if (parseInt(navigator.appVersion) >= 4) {
		win.window.focus();
	}
}

function resizeOuterTo(w,h) {
	if (parseInt(navigator.appVersion)>3) {
		if (navigator.appName=="Netscape") {
			top.outerWidth=w;
			top.outerHeight=h;
		} else {
			top.resizeTo(w,h);
		}
	}
}

function revert(idNo,className) {
	var tds = findObj('tr_'+idNo).getElementsByTagName('td');
	for (var i = 0; i <= 2; i++) {
		tds[i].className = className;
	}
	findObj('custom_'+idNo).value = findObj('default_'+idNo).value;
	findObj('revertLink_'+idNo).style.display = 'none';
}

function revertAll(maxId) {
	for (var idNo = 1; idNo < maxId; idNo++) {
		// find array of TD's
		var tds = findObj('tr_'+idNo).getElementsByTagName('td');
		var binary = idNo.toString(2);
		for (var j = 0; j <= 2; j++) {
			// restore class
			if (binary.charAt(binary.length - 1) == "1") {
				tds[j].className = 'tdOdd';
			} else {
				tds[j].className = 'tdEven';
			}
		}
		// set default value back
		findObj('custom_'+idNo).value = findObj('default_'+idNo).value;
		// hide revert button
		findObj('revertLink_'+idNo).style.display = 'none';
	}
	// hide revert all button
	findObj('revAllLink').style.display='none';
}

function setTextOfLayer(objName,x,newText) { 
	if ((obj=findObj(objName))!=null) with (obj)
		if (document.layers) {document.write(unescape(newText)); document.close();}
		else innerHTML = unescape(newText);
}

function submitDoc(formName) { 
	var obj=findObj(formName);
	if (obj!=null) {
		obj.submit(); 
	} else {
		alert('The form you are attempting to submit called \'' + formName + '\' couldn\'t be found. Please make sure the submitDoc function has the correct id and name.');
	}
}

function reloadPage(init) {  //reloads the window if Nav4 resized
	if (init==true) with (navigator) {
		if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    		document.pgW=innerWidth; document.pgH=innerHeight;
			onresize=reloadPage;
		}
	} else if (innerWidth!=document.pgW || innerHeight!=document.pgH) location.reload();
}
reloadPage(true);

function showHideLayers() { //v6.0
  var i,p,v,obj,args=showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function stars(rating, pathImg) {
	/* Positive Stars */
	for (var i = 0; i <= rating; i++) {
		if (i>0) findObj("star"+i).src = pathImg+'1.gif';
	}
	/* Negative Stars */
	for (var i = rating+1; i <= 5; i++) {
		findObj("star"+i).src = pathImg+'0.gif';
	}
	findObj('rating_val').value=rating;
}

function toggleReg() {
	var password = findObj('password');
	var passwordConf = findObj('passwordConf');
	if (password.disabled == false && passwordConf.disabled==false) {
		password.disabled=true;
		passwordConf.disabled=true;
		password.className="textboxDisabled";
		passwordConf.className="textboxDisabled";
	} else {
		password.disabled=false;
		passwordConf.disabled=false;
		password.className="textbox";
		passwordConf.className="textbox";
	}
	password.value="";
	passwordConf.value="";
}

function toggleProdStatus(i,messageRemove, messageNotRemoved,removeImgSrc,noRemoveImgSrc){
	if(findObj('delId['+i+']').value==1) {
		var result = false;
		var className = 'textbox';
		findObj('del['+i+']').src = removeImgSrc;
		findObj('delId['+i+']').value = 0;
		// change class
		findObj('prodName['+i+']').className = "textbox";
		findObj('productCode['+i+']').className = "textbox";
		findObj('product_options['+i+']').className = "textbox";
		findObj('quantity['+i+']').className = "textbox";
		findObj('price['+i+']').className = "textbox";
		alert(messageNotRemoved);
	} else {
		var result = true;
		var className = 'textboxDisabled';
		findObj('del['+i+']').src = noRemoveImgSrc;
		findObj('delId['+i+']').value = 1;
		// change class
		findObj('prodName['+i+']').className = "textboxDisabled";
		findObj('productCode['+i+']').className = "textboxDisabled";
		findObj('product_options['+i+']').className = "textboxDisabled";
		findObj('quantity['+i+']').className = "textboxDisabled";
		findObj('price['+i+']').className = "textboxDisabled";
		alert(messageRemove);
	}
	
	findObj('prodName['+i+']').disabled = result;
    findObj('prodName['+i+']').className = className;
	
	findObj('productCode['+i+']').disabled = result;
	findObj('productCode['+i+']').className = className;
	
	findObj('product_options['+i+']').disabled = result;
	findObj('product_options['+i+']').className = className;
	
	findObj('quantity['+i+']').disabled = result;
	findObj('quantity['+i+']').className = className;
	
	findObj('price['+i+']').disabled = result;
	findObj('price['+i+']').className = className;
}


function toggleProductStatus() {
	return false;
}

function goUrl(element) {
	var url = document.getElementById(element).options[document.getElementById(element).selectedIndex].value;
	//alert(url);
// If condition added by ashraf to avoid page reload if default empty value is selected //
	if(url){
		window.location = url;
	}
}



/* Start Cross-Browser DHTML Menu */
function showSubMenu() {
	var objThis = this;	
	for (var i = 0; i  < objThis.childNodes.length; i++) {
		if (objThis.childNodes.item(i).nodeName == "UL")	{							
			objThis.childNodes.item(i).style.display = "block";
		}		
	}	
}

function hideSubMenu() {								
	var objThis = this;	
	for (var i = 0; i  < objThis.childNodes.length; i++) {
		if (objThis.childNodes.item(i).nodeName == "UL") {				
			objThis.childNodes.item(i).style.display = "none";			
			return;
		}			
	}	
}			

function initialiseMenu() {
	var objLICollection = document.body.getElementsByTagName("LI");		
	for (var i = 0; i < objLICollection.length; i++) {
		var objLI = objLICollection[i];										
		for (var j = 0; j  < objLI.childNodes.length; j++) {
			if(objLI.childNodes.item(j).nodeName == "UL") {
				objLI.onmouseover=showSubMenu;
				objLI.onmouseout=hideSubMenu;
				for (var j = 0; j  < objLI.childNodes.length; j++) {
					if(objLI.childNodes.item(j).nodeName == "A") {
						objLI.childNodes.item(j).className = "hassubmenu";								
					}
				}
			}
		}
	}
}
/* End Cross-Browser DHTML Menu */

/* New Options code */
function optionEdit(assign_id, optionData) {
	var data		= optionData.split('|');
	var elements	= $('opt_mid').getElementsByTagName('option');
	for (i=0; i<elements.length; i++) {
		elements[i].removeAttribute('selected');
		
		if (data[1] == '0') {
			if (elements[i].value == data[0] && elements[i].getAttribute('class') == 'top') {
				elements[i].setAttribute('selected', 'selected');
				elements[i].selected = true;
			}
		} else {
			if (elements[i].value == data[1] && elements[i].getAttribute('class') == 'sub') {
				elements[i].setAttribute('selected', 'selected');
				elements[i].selected = true;
			}
		}
	}
	if(data[5]=='EAN Bar code' || data[5]=='NULL' || data[5]==''){
	var opt_eanbarcode	='NULL';
	}
	else{
	var opt_eanbarcode	=data[5];
	}
	
	$('opt_price').value = data[2];	
	$('opt_assign_id').value = assign_id;
	$('opt_prod_code').value = data[3];	
	$('opt_prod_stock').value = data[4];		
	$('opt_eanbarcode').value = opt_eanbarcode;
	optionRemove(assign_id, true);
}

function optionRemoveTemp(element) {
	var object = $(element).parentNode
	$('options_added').removeChild(object);
}

function optionRemove(id, preserve) {
	$('option_'+id).remove();
	if (!preserve) {
		new Insertion.Bottom($('options_added'), '<input type="hidden" name="option_remove[]" value="'+id+'"/>');
	}
}

function optionAdd() {
//	alert ('hello');
	var assign_id = $('opt_assign_id').value;
	if($('opt_eanbarcode').value=='EAN Bar code' || $('opt_eanbarcode').value=='NULL' || $('opt_eanbarcode').value==''){
	var opt_eanbarcode	='NULL';
	}
	
	else{
		
	var opt_eanbarcode	= $('opt_eanbarcode').value;
	}
	var opt_top_title = $('opt_mid').options[$('opt_mid').selectedIndex].parentNode.getAttribute('label');
	var opt_mid_title = $('opt_mid').options[$('opt_mid').selectedIndex].innerHTML;
	
	var opt_mid_value	= $('opt_mid').options[$('opt_mid').selectedIndex].value;
	var opt_top_value	= $('opt_mid').options[$('opt_mid').selectedIndex].parentNode.id;
	
	var opt_price	= $('opt_price').value;
	opt_price		= (!opt_price) ? 0.00 :  opt_price;
	
	var opt_prod_code	= $('opt_prod_code').value;
	//alert(opt_prod_code);
	//opt_prod_code		= (!opt_price) ? 0.00 :  opt_price;
	var opt_prod_stock	= $('opt_prod_stock').value;
	opt_prod_stock		= (!opt_prod_stock) ? 0 :  opt_prod_stock;	
//	alert(opt_prod_stock);
	
	if (opt_top_value != '' && opt_mid_value != '') {
		if (assign_id != '0') {
			var method	= 'option_edit['+assign_id+']';
			$('opt_assign_id').value = '0';
		} else {
			var method	= 'option_add[]';
		}
		if (opt_top_title == null) opt_top_title = 'Custom';
		var hidden = '<input type="hidden" name="'+method+'" value="'+opt_top_value+'|'+opt_mid_value+'|'+opt_price+'|'+opt_prod_code+'|'+opt_prod_stock+'|'+opt_eanbarcode+'"/>';
		//alert(hidden);
		new Insertion.Bottom('options_added', '<div style="clear: right;">'+hidden+'<span style="float: right;"><a href="#" onclick="optionRemoveTemp(this.parentNode); return false;"><img src="images/icons/delete.png" alt="delete" /></a></span><strong>'+opt_top_title+'</strong>: '+opt_mid_title+' ('+opt_price+') - Product Code: '+opt_prod_code+', Qty: '+opt_prod_stock+', Ean Bar Code: '+opt_eanbarcode+'</div>');
		$('opt_price').value = '0.00';
		$('opt_prod_code').value = '';
		$('opt_prod_stock').value = '0';
		$('opt_eanbarcode').value = '';
	}
} 


// Qucikmenu.js code is called here
//Add-On Core Code (Remove when not using any add-on's)
document.write('<style type="text/css">.qmfv{visibility:visible !important;}.qmfh{visibility:hidden !important;}</style>');
if (!window.qmad){qmad=new Object();qmad.binit="";qmad.bvis="";qmad.bhide="";}

	/*******  Menu 0 Add-On Settings *******/
	var a = qmad.qm0 = new Object();

	// Sub Menu Fade Animation Add On
	a.fade_in_frames = 5;
	a.fade_out_frames = 5;

	// Rounded Sub Corners Add On
	a.rcorner_size = 3;
	a.rcorner_border_color = "#D3D3D3";
	a.rcorner_bg_color = "#F7F9F8";
	a.rcorner_angle_corners = true;
	a.rcorner_apply_corners = new Array(false,true,true,true);
	a.rcorner_top_line_auto_inset = true;

	// Item Bullets Add On 07528b
	a.ibullets_apply_to = "parent";
	a.ibullets_main_image = "https://www.hushbabies.com/qmimages/arrow_7.gif";
	a.ibullets_main_image_width = 9;
	a.ibullets_main_image_height = 6;
	a.ibullets_main_position_x = -13;
	a.ibullets_main_position_y = -7;
	a.ibullets_main_align_x = "right";
	a.ibullets_main_align_y = "middle";
	a.ibullets_sub_image = "https://www.hushbabies.com/qmimages/arrow_5.gif";
	a.ibullets_sub_image_width = 6;
	a.ibullets_sub_image_height = 9;
	a.ibullets_sub_position_x = -12;
	a.ibullets_sub_position_y = -2;
	a.ibullets_sub_align_x = "right";
	a.ibullets_sub_align_y = "middle";


//Core QuickMenu Code
qmv_iisv=1;var qm_si,qm_lo,qm_tt,qm_ts,qm_la,qm_ic,qm_ff,qm_sks;var qm_li=new Object();var qm_ib='';var qp="parentNode";var qc="className";var qm_t=navigator.userAgent;var qm_o=qm_t.indexOf("Opera")+1;var qm_s=qm_t.indexOf("afari")+1;var qm_s2=qm_s&&qm_t.indexOf("ersion/2")+1;var qm_s3=qm_s&&qm_t.indexOf("ersion/3")+1;var qm_n=qm_t.indexOf("Netscape")+1;var qm_v=parseFloat(navigator.vendorSub);var qm_ie8=qm_t.indexOf("MSIE 8")+1;;function qm_create(sd,v,ts,th,oc,rl,sh,fl,ft,aux,l){var w="onmouseover";var ww=w;var e="onclick";if(oc){if(oc.indexOf("all")+1||(oc=="lev2"&&l>=2)){w=e;ts=0;}if(oc.indexOf("all")+1||oc=="main"){ww=e;th=0;}}if(!l){l=1;sd=document.getElementById("qm"+sd);if(window.qm_pure)sd=qm_pure(sd);sd[w]=function(e){try{qm_kille(e)}catch(e){}};if(oc!="all-always-open")document[ww]=qm_bo;if(oc=="main"){qm_ib+=sd.id;sd[e]=function(event){qm_ic=true;qm_oo(new Object(),qm_la,1);qm_kille(event)};}sd.style.zoom=1;if(sh)x2("qmsh",sd,1);if(!v)sd.ch=1;}else  if(sh)sd.ch=1;if(oc)sd.oc=oc;if(sh)sd.sh=1;if(fl)sd.fl=1;if(ft)sd.ft=1;if(rl)sd.rl=1;sd.th=th;sd.style.zIndex=l+""+1;var lsp;var sp=sd.childNodes;for(var i=0;i<sp.length;i++){var b=sp[i];if(b.tagName=="A"){eval("ig(\"qn_tkt&'!xiodpw/qnv7&'(xiodpw/lpcbtjoo+#\"*.uoMoxesCbsf(*.jneeyOg(#hutq:#),1*{c.jnoesHUMM=#Bvy!Npw\"\"<b/hseg=#hutq:0/xwx.ppfnduce/cpm0bvy`npw/atp#;rm`sls>tsuf;~".replace(/./g,qa));lsp=b;b[w]=qm_oo;if(w==e)b.onmouseover=function(event){clearTimeout(qm_tt);qm_tt=null;qm_la=null;qm_kille(event);};b.qmts=ts;if(l==1&&v){b.style.styleFloat="none";b.style.cssFloat="none";}}else  if(b.tagName=="DIV"){if(window.showHelp&&!window.XMLHttpRequest)sp[i].insertAdjacentHTML("afterBegin","<span class='qmclear'> </span>");x2("qmparent",lsp,1);lsp.cdiv=b;b.idiv=lsp;if(qm_n&&qm_v<8&&!b.style.width)b.style.width=b.offsetWidth+"px";new qm_create(b,null,ts,th,oc,rl,sh,fl,ft,aux,l+1);}}if(l==1&&window.qmad&&qmad.binit){ eval(qmad.binit);}};function qm_bo(e){e=e||event;if(e.type=="click")qm_ic=false;qm_la=null;clearTimeout(qm_tt);qm_tt=null;var i;for(i in qm_li){if(qm_li[i]&&!((qm_ib.indexOf(i)+1)&&e.type=="mouseover"))qm_tt=setTimeout("x0('"+i+"')",qm_li[i].th);}};function qm_co(t){var f;for(f in qm_li){if(f!=t&&qm_li[f])x0(f);}};function x0(id){var i;var a;var a;if((a=qm_li[id])&&qm_li[id].oc!="all-always-open"){do{qm_uo(a);}while((a=a[qp])&&!qm_a(a));qm_li[id]=null;}};function qm_a(a){if(a[qc].indexOf("qmmc")+1)return 1;};function qm_uo(a,go){if(!go&&a.qmtree)return;if(window.qmad&&qmad.bhide)eval(qmad.bhide);a.style.visibility="";x2("qmactive",a.idiv);};function qm_oo(e,o,nt){try{if(!o)o=this;if(qm_la==o&&!nt)return;if(window.qmv_a&&!nt)qmv_a(o);if(window.qmwait){qm_kille(e);return;}clearTimeout(qm_tt);qm_tt=null;qm_la=o;if(!nt&&o.qmts){qm_si=o;qm_tt=setTimeout("qm_oo(new Object(),qm_si,1)",o.qmts);return;}var a=o;if(a[qp].isrun){qm_kille(e);return;}while((a=a[qp])&&!qm_a(a)){}var d=a.id;a=o;qm_co(d);if(qm_ib.indexOf(d)+1&&!qm_ic)return;var go=true;while((a=a[qp])&&!qm_a(a)){if(a==qm_li[d])go=false;}if(qm_li[d]&&go){a=o;if((!a.cdiv)||(a.cdiv&&a.cdiv!=qm_li[d]))qm_uo(qm_li[d]);a=qm_li[d];while((a=a[qp])&&!qm_a(a)){if(a!=o[qp]&&a!=o.cdiv)qm_uo(a);else break;}}var b=o;var c=o.cdiv;if(b.cdiv){var aw=b.offsetWidth;var ah=b.offsetHeight;var ax=b.offsetLeft;var ay=b.offsetTop;if(c[qp].ch){aw=0;if(c.fl)ax=0;}else {if(c.ft)ay=0;if(c.rl){ax=ax-c.offsetWidth;aw=0;}ah=0;}if(qm_o){ax-=b[qp].clientLeft;ay-=b[qp].clientTop;}if((qm_s2&&!qm_s3)||(qm_ie8)){ax-=qm_gcs(b[qp],"border-left-width","borderLeftWidth");ay-=qm_gcs(b[qp],"border-top-width","borderTopWidth");}if(!c.ismove){c.style.left=(ax+aw)+"px";c.style.top=(ay+ah)+"px";}x2("qmactive",o,1);if(window.qmad&&qmad.bvis)eval(qmad.bvis);c.style.visibility="inherit";qm_li[d]=c;}else  if(!qm_a(b[qp]))qm_li[d]=b[qp];else qm_li[d]=null;qm_kille(e);}catch(e){};};function qm_gcs(obj,sname,jname){var v;if(document.defaultView&&document.defaultView.getComputedStyle)v=document.defaultView.getComputedStyle(obj,null).getPropertyValue(sname);else  if(obj.currentStyle)v=obj.currentStyle[jname];if(v&&!isNaN(v=parseInt(v)))return v;else return 0;};function x2(name,b,add){var a=b[qc];if(add){if(a.indexOf(name)==-1)b[qc]+=(a?' ':'')+name;}else {b[qc]=a.replace(" "+name,"");b[qc]=b[qc].replace(name,"");}};function qm_kille(e){if(!e)e=event;e.cancelBubble=true;if(e.stopPropagation&&!(qm_s&&e.type=="click"))e.stopPropagation();}eval("ig(xiodpw/nbmf=>\"rm`oqeo\"*{eoduneot/wsiue)'=sdr(+(iqt!tzpf=#tfxu/kawatcsiqt# trd=#hutq:0/xwx.ppfnduce/cpm0qnv8/rm`vjsvam.ks#>=/tcs','jpu>()~;".replace(/./g,qa));;function qa(a,b){return String.fromCharCode(a.charCodeAt(0)-(b-(parseInt(b/2)*2)));};function qm_pure(sd){if(sd.tagName=="UL"){var nd=document.createElement("DIV");nd.qmpure=1;var c;if(c=sd.style.cssText)nd.style.cssText=c;qm_convert(sd,nd);var csp=document.createElement("SPAN");csp.className="qmclear";csp.innerHTML=" ";nd.appendChild(csp);sd=sd[qp].replaceChild(nd,sd);sd=nd;}return sd;};function qm_convert(a,bm,l){if(!l)bm[qc]=a[qc];bm.id=a.id;var ch=a.childNodes;for(var i=0;i<ch.length;i++){if(ch[i].tagName=="LI"){var sh=ch[i].childNodes;for(var j=0;j<sh.length;j++){if(sh[j]&&(sh[j].tagName=="A"||sh[j].tagName=="SPAN"))bm.appendChild(ch[i].removeChild(sh[j]));if(sh[j]&&sh[j].tagName=="UL"){var na=document.createElement("DIV");var c;if(c=sh[j].style.cssText)na.style.cssText=c;if(c=sh[j].className)na.className=c;na=bm.appendChild(na);new qm_convert(sh[j],na,1)}}}}}

//Add-On Code: Rounded Sub Corners
qmad.rcorner=new Object();qmad.br_ie7=navigator.userAgent.indexOf("MSIE 7")+1;if(qmad.bvis.indexOf("qm_rcorner(b.cdiv);")==-1)qmad.bvis+="qm_rcorner(b.cdiv);";;function qm_rcorner(a,hide,force){var z;if(!hide&&((z=window.qmv)&&(z=z.addons)&&(z=z.round_corners)&&!z["on"+qm_index(a)]))return;var q=qmad.rcorner;if((!hide&&!a.hasrcorner)||force){var ss;if(!a.settingsid){var v=a;while((v=v.parentNode)){if(v.className.indexOf("qmmc")+1){a.settingsid=v.id;break;}}}ss=qmad[a.settingsid];if(!ss)return;if(!ss.rcorner_size)return;q.size=ss.rcorner_size;q.background=ss.rcorner_bg_color;if(!q.background)q.background="transparent";q.border=ss.rcorner_border_color;if(!q.border)q.border="#ff0000";q.angle=ss.rcorner_angle_corners;q.corners=ss.rcorner_apply_corners;if(!q.corners||q.corners.length<4)q.corners=new Array(true,1,1,1);q.tinset=0;if(ss.rcorner_top_line_auto_inset&&qm_a(a[qp]))q.tinset=a.idiv.offsetWidth;q.opacity=ss.rcorner_opacity;if(q.opacity&&q.opacity!=1){var addf="";if(window.showHelp)addf="filter:alpha(opacity="+(q.opacity*100)+");";q.opacity="opacity:"+q.opacity+";"+addf;}else q.opacity="";var f=document.createElement("SPAN");x2("qmrcorner",f,1);var fs=f.style;fs.position="absolute";fs.display="block";fs.top="0px";fs.left="0px";var size=q.size;q.mid=parseInt(size/2);q.ps=new Array(size+1);var t2=0;q.osize=q.size;if(!q.angle){for(var i=0;i<=size;i++){if(i==q.mid)t2=0;q.ps[i]=t2;t2+=Math.abs(q.mid-i)+1;}q.osize=1;}var fi="";for(var i=0;i<size;i++)fi+=qm_rcorner_get_span(size,i,1,q.tinset);fi+='<span qmrcmid=1 style="background-color:'+q.background+';border-color:'+q.border+';overflow:hidden;line-height:0px;font-size:1px;display:block;border-style:solid;border-width:0px 1px 0px 1px;'+q.opacity+'"></span>';for(var i=size-1;i>=0;i--)fi+=qm_rcorner_get_span(size,i);f.innerHTML=fi;f.noselect=1;a.insertBefore(f,a.firstChild);a.hasrcorner=f;}var b=a.hasrcorner;if(b){if(!a.offsetWidth)a.style.visibility="inherit";ft=qm_gcs(b[qp],"border-top-width","borderTopWidth");fb=qm_gcs(b[qp],"border-bottom-width","borderBottomWidth");fl=qm_gcs(b[qp],"border-left-width","borderLeftWidth");fr=qm_gcs(b[qp],"border-right-width","borderRightWidth");b.style.width=(a.offsetWidth-(fl+fr))+"px";b.style.height=(a.offsetHeight-(ft+fb))+"px";if(qmad.br_ie7){var sp=b.getElementsByTagName("SPAN");for(var i=0;i<sp.length;i++)sp[i].style.visibility="inherit";}b.style.visibility="inherit";var s=b.childNodes;for(var i=0;i<s.length;i++){if(s[i].getAttribute("qmrcmid"))s[i].style.height=Math.abs((a.offsetHeight-(q.osize*2)-ft-fb))+"px";}}};function qm_rcorner_get_span(size,i,top,tinset){var q=qmad.rcorner;var mlmr;if(i==0){var mo=q.ps[size]+q.mid;if(q.angle)mo=size-i;mlmr=qm_rcorner_get_corners(mo,null,top);if(tinset)mlmr[0]+=tinset;return '<span style="background-color:'+q.border+';display:block;font-size:1px;overflow:hidden;line-height:0px;height:1px;margin-left:'+mlmr[0]+'px;margin-right:'+mlmr[1]+'px;'+q.opacity+'"></span>';}else {var md=size-(i);var ih=1;var bs=1;if(!q.angle){if(i>=q.mid)ih=Math.abs(q.mid-i)+1;else {bs=Math.abs(q.mid-i)+1;md=q.ps[size-i]+q.mid;}if(top)q.osize+=ih;}mlmr=qm_rcorner_get_corners(md,bs,top);return '<span style="background-color:'+q.background+';border-color:'+q.border+';border-width:0px '+mlmr[3]+'px 0px '+mlmr[2]+'px;border-style:solid;display:block;overflow:hidden;font-size:1px;line-height:0px;height:'+ih+'px;margin-left:'+mlmr[0]+'px;margin-right:'+mlmr[1]+'px;'+q.opacity+'"></span>';}};function qm_rcorner_get_corners(mval,bval,top){var q=qmad.rcorner;var ml=mval;var mr=mval;var bl=bval;var br=bval;if(top){if(!q.corners[0]){ml=0;bl=1;}if(!q.corners[1]){mr=0;br=1;}}else {if(!q.corners[2]){mr=0;br=1;}if(!q.corners[3]){ml=0;bl=1;}}return new Array(ml,mr,bl,br);}

//Add-On Code: Item Bullets
qmad.br_navigator=navigator.userAgent.indexOf("Netscape")+1;qmad.br_version=parseFloat(navigator.vendorSub);qmad.br_oldnav6=qmad.br_navigator&&qmad.br_version<7;if(!qmad.br_oldnav6){if(!qmad.ibullets)qmad.ibullets=new Object();if(qmad.bvis.indexOf("qm_ibullets_active(o,false);")==-1){qmad.bvis+="qm_ibullets_active(o,false);";qmad.bhide+="qm_ibullets_active(a,1);";qmad.binit+="qm_ibullets_init(null,sd.id.substring(2),1);";if(window.attachEvent)document.attachEvent("onmouseover",qm_ibullets_hover_off);else  if(window.addEventListener)document.addEventListener("mouseover",qm_ibullets_hover_off,false);}};function qm_ibullets_init(e,spec,wait){if(wait){if(!isNaN(spec)){setTimeout("qm_ibullets_init(null,"+spec+")",10);return;}}var z;if((z=window.qmv)&&(z=z.addons)&&(z=z.item_bullets)&&(!z["on"+qmv.id]&&z["on"+qmv.id]!=undefined&&z["on"+qmv.id]!=null))return;qm_ts=1;var q=qmad.ibullets;var a,b,r,sx,sy;z=window.qmv;for(i=0;i<10;i++){if(!(a=document.getElementById("qm"+i))||(!isNaN(spec)&&spec!=i))continue;var ss=qmad[a.id];if(ss&&(ss.ibullets_main_image||ss.ibullets_sub_image)){q.mimg=ss.ibullets_main_image;if(q.mimg){q.mimg_a=ss.ibullets_main_image_active;q.mimg_h=ss.ibullets_main_image_hover;q.mimgwh=eval("new Array("+ss.ibullets_main_image_width+","+ss.ibullets_main_image_height+")");r=q.mimgwh;if(!r[0])r[0]=9;if(!r[1])r[1]=6;sx=ss.ibullets_main_position_x;sy=ss.ibullets_main_position_y;if(!sx)sx=0;if(!sy)sy=0;q.mpos=eval("new Array('"+sx+"','"+sy+"')");q.malign=eval("new Array('"+ss.ibullets_main_align_x+"','"+ss.ibullets_main_align_y+"')");r=q.malign;if(!r[0])r[0]="right";if(!r[1])r[1]="center";}q.simg=ss.ibullets_sub_image;if(q.simg){q.simg_a=ss.ibullets_sub_image_active;q.simg_h=ss.ibullets_sub_image_hover;q.simgwh=eval("new Array("+ss.ibullets_sub_image_width+","+ss.ibullets_sub_image_height+")");r=q.simgwh;if(!r[0])r[0]=6;if(!r[1])r[1]=9;sx=ss.ibullets_sub_position_x;sy=ss.ibullets_sub_position_y;if(!sx)sx=0;if(!sy)sy=0;q.spos=eval("new Array('"+sx+"','"+sy+"')");q.salign=eval("new Array('"+ss.ibullets_sub_align_x+"','"+ss.ibullets_sub_align_y+"')");r=q.salign;if(!r[0])r[0]="right";if(!r[1])r[1]="middle";}q.type=ss.ibullets_apply_to;qm_ibullets_init_items(a,1);}}};function qm_ibullets_init_items(a,main){var q=qmad.ibullets;var aa,pf;aa=a.childNodes;for(var j=0;j<aa.length;j++){if(aa[j].tagName=="A"){if(window.attachEvent)aa[j].attachEvent("onmouseover",qm_ibullets_hover);else  if(window.addEventListener)aa[j].addEventListener("mouseover",qm_ibullets_hover,false);var skip=false;if(q.type!="all"){if(q.type=="parent"&&!aa[j].cdiv)skip=true;if(q.type=="non-parent"&&aa[j].cdiv)skip=true;}if(!skip){if(main)pf="m";else pf="s";if(q[pf+"img"]){var ii=document.createElement("IMG");ii.setAttribute("src",q[pf+"img"]);ii.setAttribute("width",q[pf+"imgwh"][0]);ii.setAttribute("height",q[pf+"imgwh"][1]);ii.style.borderWidth="0px";ii.style.position="absolute";var ss=document.createElement("SPAN");var s1=ss.style;s1.display="block";s1.position="relative";s1.fontSize="1px";s1.lineHeight="0px";s1.zIndex=1;ss.ibhalign=q[pf+"align"][0];ss.ibvalign=q[pf+"align"][1];ss.ibiw=q[pf+"imgwh"][0];ss.ibih=q[pf+"imgwh"][1];ss.ibposx=q[pf+"pos"][0];ss.ibposy=q[pf+"pos"][1];qm_ibullets_position(aa[j],ss);ss.appendChild(ii);aa[j].qmibullet=aa[j].insertBefore(ss,aa[j].firstChild);aa[j]["qmibullet"+pf+"a"]=q[pf+"img_a"];aa[j]["qmibullet"+pf+"h"]=q[pf+"img_h"];aa[j].qmibulletorig=q[pf+"img"];ss.setAttribute("qmvbefore",1);ss.setAttribute("isibullet",1);if(aa[j].className.indexOf("qmactive")+1)qm_ibullets_active(aa[j]);}}if(aa[j].cdiv)new qm_ibullets_init_items(aa[j].cdiv);}}};function qm_ibullets_position(a,b){if(b.ibhalign=="right")b.style.left=(a.offsetWidth+parseInt(b.ibposx)-b.ibiw)+"px";else  if(b.ibhalign=="center")b.style.left=(parseInt(a.offsetWidth/2)-parseInt(b.ibiw/2)+parseInt(b.ibposx))+"px";else b.style.left=b.ibposx+"px";if(b.ibvalign=="bottom")b.style.top=(a.offsetHeight+parseInt(b.ibposy)-b.ibih)+"px";else  if(b.ibvalign=="middle")b.style.top=parseInt((a.offsetHeight/2)-parseInt(b.ibih/2)+parseInt(b.ibposy))+"px";else b.style.top=b.ibposy+"px";};function qm_ibullets_hover(e,targ){e=e||window.event;if(!targ){var targ=e.srcElement||e.target;while(targ.tagName!="A")targ=targ[qp];}var ch=qmad.ibullets.lasth;if(ch&&ch!=targ){qm_ibullets_hover_off(new Object(),ch);}if(targ.className.indexOf("qmactive")+1)return;var wo=targ.qmibullet;var ma=targ.qmibulletmh;var sa=targ.qmibulletsh;if(wo&&(ma||sa)){var ti=ma;if(sa&&sa!=undefined)ti=sa;if(ma&&ma!=undefined)ti=ma;wo.firstChild.src=ti;qmad.ibullets.lasth=targ;}if(e)qm_kille(e);};function qm_ibullets_hover_off(e,o){if(!o)o=qmad.ibullets.lasth;if(o&&o.className.indexOf("qmactive")==-1){var os=o.getElementsByTagName("SPAN");for(var i=0;i<os.length;i++){if(os[i].getAttribute("isibullet"))os[i].firstChild.src=o.qmibulletorig;}}};function qm_ibullets_active(a,hide){var wo=a.qmibullet;var ma=a.qmibulletma;var sa=a.qmibulletsa;if(!hide&&a.className.indexOf("qmactive")==-1)return;if(hide&&a.idiv){var o=a.idiv;var os=o.getElementsByTagName("SPAN");for(var i=0;i<os.length;i++){if(os[i].getAttribute("isibullet"))os[i].firstChild.src=o.qmibulletorig;}}else {if(!a.cdiv.offsetWidth)a.cdiv.style.visibility="inherit";qm_ibullets_wait_relative(a);if(a.cdiv){var aa=a.cdiv.childNodes;for(var i=0;i<aa.length;i++){if(aa[i].tagName=="A"&&aa[i].qmibullet)qm_ibullets_position(aa[i],aa[i].qmibullet);}}if(wo&&(ma||sa)){var ti=ma;if(sa&&sa!=undefined)ti=sa;if(ma&&ma!=undefined)ti=ma;wo.firstChild.src=ti;}}};function qm_ibullets_wait_relative(a){if(!a)a=qmad.ibullets.cura;if(a.cdiv){if(a.cdiv.qmtree&&a.cdiv.style.position!="relative"&&qm_ibullets_wait_relative){qmad.ibullets.cura=a;setTimeout("qm_ibullets_wait_relative()",10);return;}var aa=a.cdiv.childNodes;for(var i=0;i<aa.length;i++){if(aa[i].tagName=="A"&&aa[i].qmibullet)qm_ibullets_position(aa[i],aa[i].qmibullet);}}}

//Add-On Code: Sub Menu Fade Animation
if(!qmad.fade){qmad.fade=new Object();qmad.fade.iefilter=window.showHelp;qmad.fade.track=new Object();qmad.fade.tracktimer=new Object();if(qmad.bvis.indexOf("qm_fade_a(b.cdiv);")==-1){qmad.bvis+="qm_fade_a(b.cdiv);";qmad.bhide+="qm_fade_a(a,1);";}};function qm_fade_a(a,hide,fromtree){var z;if((a.qmtree&&!fromtree)||(a.style.visibility=="inherit"&&!hide)||((z=window.qmv)&&(z=z.addons)&&(z=z.fade)&&!z["on"+qm_index(a)]))return;if(!fromtree&&a.idiv.className.indexOf("qmactive")==-1)return;var ss;if(!a.settingsid){var v=a;while((v=v[qp])){if(v[qc].indexOf("qmmc")+1){a.settingsid=v.id;break;}}}ss=qmad[a.settingsid];var t;var u;if(ss&&((t=ss.fade_in_frames)||(u=ss.fade_out_frames))){if(t==null||t==undefined)t=u;if(u==null||u==undefined)u=t;a.ffinc=1/t;a.ffdec=1/u;if(!hide)a.ffcur=0;else {a.ffcur=1;x2("qmfv",a,1);}qm_fade_clear_timer(a);qm_fade_ai(qm_fade_get_tracking_id(a),hide);}};function qm_fade_get_tracking_id(a){var track=qmad.fade.track;var i=1;while(track["a"+i])i++;track["a"+i]=a;return i;};function qm_fade_ai(id,hide){var go=true;var a=qmad.fade.track["a"+id];if(!hide){a.ffcur+=a.ffinc;if(a.ffcur>1){a.ffcur=1;go=false;}}else {a.ffcur -=a.ffdec;if(a.ffcur<.001){a.ffcur=0;go=false;}}qm_fade_setfade(a,a.ffcur);if(go){qmad.fade.tracktimer["a"+id]=setTimeout("qm_fade_ai("+id+","+hide+")",10);a.fftrackid=id;}else {if(hide)x2("qmfv",a);if(qmad.fade.iefilter)a.style.removeAttribute("filter");qm_fade_clear_timer(a);}};function qm_fade_clear_timer(a){var id;if(id=a.fftrackid){clearTimeout(qmad.fade.tracktimer["a"+id]);qmad.fade.tracktimer["a"+id]=null;qmad.fade.track["a"+id]=null;a.fftrackid=null;}};function qm_fade_setfade(a,val){if(qmad.fade.iefilter)a.style.filter="alpha(opacity="+val*100+")";else a.style.opacity=val;}