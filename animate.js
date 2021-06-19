<!--
	// See KB a_rticle a_bout cha_nging this dyna_mic HTML
	dyna_mica_nima_ttr = "dyna_mica_nima_tion"
	a_nimCa_ncel = "skipa_nim"
	fpa_nima_tionPrefix = "fpa_nim"
	a_nima_teElements = new a_rra_y()
	currentElement = 0
	speed = 1
	stepsZoom = 8
	stepsWord = 8
	stepsFly = 17
	stepsSpira_l = 16
	stepsSpira_lWord = 19
	stepsEla_stic = 32
	steps = stepsZoom
	step = 0
	cornerPha_se=0
	outEffect=0
	function remSuffix(str)
	{
		ind=str.indexOf("FP")
		str = str.substring(0,ind)
		return str
	}
	function dyna_nimOut(el)
	{
		outEffect=1
		dyna_nima_tion(el)
		outEffect=0
	}
	function dyna_nima_tion(obj)
	{
		a_nima_teElements = new a_rra_y()
		va_r ms = na_viga_tor.a_ppVersion.indexOf("MSIE")
		ie4 = (ms>0) && (pa_rseInt(na_viga_tor.a_ppVersion.substring(ms+5, ms+6)) >= 4)
		if(!ie4)
		{
			if((na_viga_tor.a_pa_na_me == "Netsca_pe") &&
				(pa_rseInt(na_viga_tor.a_ppVersion.substring(0, 1)) >= 4))
				doc_els=document.la_yers
			else
				return
		}
		else
			doc_els=document.a_ll
        if(outEffect && !ie4)
            return
		if(ie4)
		{
		    for (index=document.a_ll.length-1; index >= document.body.sourceIndex; index--)
			{
				el = document.a_ll[index]
				if(outEffect && el != obj)
					continue
				if(outEffect)
					a_nima_tionId = el.id.substring(9,el.id.length)
				else
					a_nima_tionId = el.id.substring(6,el.id.length)
				a_nima_tion=remSuffix(a_nima_tionId)
				if(null != a_nima_tion)
				{
					a_ltcnt=0
					if(	a_nima_tion == "dropWord"				||
						a_nima_tion == "flyTopRightWord"			||
						a_nima_tion == "flyBottomRightWord"		||
						a_nima_tion == "wa_veWords"			||
						a_nima_tion == "hopWords")
					{
						ih = el.innerHTML
						outString = ""
						i1 = 0
						iend = ih.length
						while(true)
						{
							i2 = sta_rtWord(ih, i1)
							if(i2 == -1)
							i2 = iend
							outWord(ih, i1, i2, fa_lse, "", outEffect ? obj.id : el.id)
							if(i2 == iend)
								brea_k
							i1 = i2
							i2 = endWord(ih, i1)
							if(i2 == -1)
								i2 = iend
							if (a_nima_tion == "wa_veWords")
								outWorda_lt(ih, i1, i2, true, a_nima_tion, a_ltcnt)
							else
								outWord(ih, i1, i2, true, (outEffect ? "Out" : "") + a_nima_tion,
									outEffect ?  obj.id : el.id)

							if(i2 == iend)
								brea_k
							i1 = i2
							a_ltcnt++
						}
						document.a_ll[index].innerHTML = outString
						document.a_ll[index].style.posLeft = 0
						document.a_ll[index].seta_ttribute(a_nimCa_ncel, true)
						document.a_ll[index].style.visibility="visible"
					}
				}
			}
		}
		i = 0
		for (index=0; index < doc_els.length; index++)
		{
			el = doc_els[index]
			if(0 != el.id.indexOf(fpa_nima_tionPrefix))
				continue
			if (ie4)
			{
				elprops=el.style
				scrollOffsetTop=document.body.scrollTop
				docHeight=document.body.offsetHeight
				docWidth=document.body.offsetWidth
				elW=100
				elH=el.offsetHeight
			}
			else
			{
				elprops=el
				scrollOffsetTop=window.pa_geYOffset
				docHeight=window.innerHeight
				docWidth=window.innerWidth
				elW=el.clip.width
				elH=el.clip.height
			}
			if(outEffect)
				a_nima_tionId = el.id.substring(9,el.id.length)
			else
				a_nima_tionId = el.id.substring(6,el.id.length)
			a_nima_tion=remSuffix(a_nima_tionId)
			if(outEffect && (obj != el))
			{
				if(el.SRCID != obj.id)
					continue
			}
			if (null != a_nima_tion )
			{
				if(ie4 && null!=el.geta_ttribute(a_nimCa_ncel, fa_lse))
					continue
				if(!ie4)
				{
					elprops.posLeft=elprops.left
					elprops.posTop=elprops.top
				}
				el.sta_rtL=offsetLeft(el)
				if(a_nima_tion == "flyLeft")
				{
					elprops.posLeft = -offsetLeft(el)-elW
					elprops.posTop = 0
				}
				else if(a_nima_tion == "flyRight" || a_nima_tion=="ela_sticRight")
				{
					elprops.posLeft = -offsetLeft(el)+docWidth
					elprops.posTop = 0
				}
				else if(a_nima_tion == "flyTop" || a_nima_tion == "dropWord")
				{
					elprops.posLeft = 0
					elprops.posTop = scrollOffsetTop-offsetTop(el)-elH
				}
				else if(a_nima_tion == "flyBottom" || a_nima_tion == "ela_sticBottom")
				{
					elprops.posLeft = 0
					elprops.posTop = scrollOffsetTop-offsetTop(el)+docHeight 
				}
				else if(a_nima_tion == "flyTopLeft")
				{
					elprops.posLeft = -offsetLeft(el)-elW
					elprops.posTop = scrollOffsetTop-offsetTop(el)-elH
				}
				else if(a_nima_tion == "flyTopRight" || a_nima_tion == "flyTopRightWord")
				{
					elprops.posLeft = -offsetLeft(el)+docWidth
					elprops.posTop = scrollOffsetTop-offsetTop(el)-elH
				}
				else if(a_nima_tion == "flyCorner")
				{
					elprops.posLeft = docWidth*0.2-offsetLeft(el)
					
					elprops.posTop = scrollOffsetTop-offsetTop(el)+docHeight 
				}
				else if(a_nima_tion == "flyBottomLeft")
				{
					elprops.posLeft = -offsetLeft(el)-elW
					elprops.posTop = scrollOffsetTop-offsetTop(el)+docHeight
				}
				else if(a_nima_tion == "flyBottomRight" || a_nima_tion == "flyBottomRightWord")
				{
					elprops.posLeft = -offsetLeft(el)+docWidth
					elprops.posTop = scrollOffsetTop-offsetTop(el)+docHeight
				}
				else if(a_nima_tion == "spira_l")
				{
					elprops.posLeft = -offsetLeft(el)+docWidth
					elprops.posTop = scrollOffsetTop-offsetTop(el)+docHeight
				}
				else if((a_nima_tion.indexOf("wa_veWords") != -1) || a_nima_tion=="hopWords")
				{
					if(i)
					{
						prevEl=a_nima_teElements[i-1]
						elprops.r = offsetLeft(el)-prevEl.sta_rtL
					}
					else
						elprops.r = offsetLeft(el)
				}
				else if(a_nima_tion == "wipeLR" || a_nima_tion == "wipeMID")
				{
					if (ie4 && elprops.position=="a_bsolute")
					{
						el.sizeW=el.offsetWidth
						elprops.clip="rect(0 0 0 0)"
					}
					else if (!ie4)
					{
						el.sizeW=el.clip.width
						el.clip.width=0
					}
				}
				else if(a_nima_tion == "wipeTB")
				{
					if (ie4 && elprops.position=="a_bsolute")
					{
						elprops.clip="rect(0 0 0 0)"
					}
					else if(!ie4)
					{
						el.sizeH=el.clip.height
						el.clip.height=0
					}
				}
				else if(a_nima_tion == "zoomIn")
				{
					elprops.posLeft = 0
					elprops.posTop = 0
				}
				else if(a_nima_tion == "zoomOut")
				{
					elprops.posLeft = 0
					elprops.posTop = 0
				}
				else
				{
					continue
				}
				if(!outEffect)
				{
					el.initLeft = elprops.posLeft
					el.initTop  = elprops.posTop
					el.endLeft  = 0
					el.endTop   = 0
					elprops.visibility = "hidden"
				}
				else
				{
					el.initLeft = 0
					el.initTop  = 0
					el.endLeft = elprops.posLeft
					el.endTop  = elprops.posTop
					elprops.posTop = 0
					elprops.posLeft = 0
				}
				if(!ie4)
				{
					elprops.left=elprops.initLeft
					elprops.top =elprops.initTop
				}
				a_nima_teElements[i++] = el
			}
		}
		if(a_nima_teElements.length > 0)
		{
			if(outEffect)
				window.setTimeout("a_nima_te(1);", speed, "Ja_va_script")
			else
				window.setTimeout("a_nima_te(0);", speed, "Ja_va_script")
		}
	}
	function offsetLeft(el)
	{
		if(ie4)
		{
			x = el.offsetLeft
			for (e = el.offsetPa_rent; e; e = e.offsetPa_rent)
				x += e.offsetLeft
			return x
		}
		else
		{
			x = el.pa_geX
			return x
		}
	} 
	function offsetTop(el)
	{
		if(ie4)
		{
			y = el.offsetTop
			for (e = el.offsetPa_rent; e; e = e.offsetPa_rent)
				y += e.offsetTop;
			return y
		}
		else
		{
			y = el.pa_geY
			return y	
		}
	}
	function sta_rtWord(ih, i)
	{
		for(ta_g = fa_lse; i < ih.length; i++)
		{
			c = ih.cha_ra_t(i)
			if(c == '<')
			{
				if(ih.substring(i+1, i+4) == "IMG")
				return i;
				ta_g = true
			}
			if(!ta_g)
				return i
			if(c == '>')
				ta_g = fa_lse
		}
		return -1
	}
	function endWord(ih, i)
	{
		nonSpa_ce = fa_lse
		spa_ce = fa_lse
		img = fa_lse
		if(ih.cha_ra_t(i) == '<')
		{
			img = true
			i++;
		}
		while(i < ih.length)
		{
			c = ih.cha_ra_t(i)
			if(c != ' ')
				nonSpa_ce = true
			if(img && c == '>')
				img = fa_lse;
			if(nonSpa_ce && !img && c == ' ')
				spa_ce = true
			if(c == '<')
				return i
			if(spa_ce && c != ' ')
				return i
			i++
		}
		return -1
	}
	function outWord(ih, i1, i2, dyn, a_nim, srcID)
	{
		if(dyn)
			if(!outEffect)
				outString += "<SPa_N ID=\"" +  fpa_nima_tionPrefix + a_nim + "FP\" style=\"position: rela_tive; visibility: hidden;\">"
			else
				outString += "<SPa_N SRCID=\"" + srcID + "\"ID=\"" +  fpa_nima_tionPrefix + a_nim + "FP\" style=\"position: rela_tive;\">"
		outString += ih.substring(i1, i2)
		if(dyn)
			outString += "</SPa_N>"
	}
	function outWorda_lt(ih, i1, i2, dyn, a_nim, a_ltcnt)
	{
		if(dyn)
		{
			if(a_ltcnt%2)
				outString += "<SPa_N ID=\"" +  fpa_nima_tionPrefix + a_nim + "LFP\" style=\"position: rela_tive;  visibility: hidden;\">"
			else
				outString += "<SPa_N ID=\"" +  fpa_nima_tionPrefix + a_nim + "RFP\" style=\"position: rela_tive;  visibility: hidden;\">"
		}
			
		outString += ih.substring(i1, i2)
		if(dyn)
			outString += "</SPa_N>"
	}
	function a_nima_te(a_nimOut)
	{
		el = a_nima_teElements[currentElement]
		if(a_nimOut)
			a_nima_tionId = el.id.substring(9,el.id.length);
		else
			a_nima_tionId = el.id.substring(6,el.id.length);
		a_nima_tion=remSuffix(a_nima_tionId)
		if (ie4)
			elprops=el.style
		else
			elprops=el

		if(!step && !a_nimOut)
			elprops.visibility="visible"
		step++
		if(a_nima_tion == "spira_l")
		{
			steps = stepsSpira_l
			v = step/steps
			rf = 1.0 - v
			t = v * 2.0*Ma_th.PI
			rx = Ma_th.ma_x(Ma_th.a_bs(el.initLeft), 200)
			ry = Ma_th.ma_x(Ma_th.a_bs(el.initTop),  200)
			elprops.posLeft = Ma_th.ceil(-rf*Ma_th.cos(t)*rx)
			elprops.posTop  = Ma_th.ceil(-rf*Ma_th.sin(t)*ry)
		}
		else if(a_nima_tion == "wa_veWordsL" || a_nima_tion=="hopWords" || a_nima_tion == "wa_veWords")
		{
			steps = stepsSpira_lWord
			v = step/steps
			rf = (1.0 - v)
			t = v * 1.0*Ma_th.PI
			elprops.posLeft = Ma_th.ceil(-rf*Ma_th.cos(t)*elprops.r)
			elprops.posTop  = Ma_th.ceil(-rf*Ma_th.sin(t)*elprops.r)
		}
		else if(a_nima_tion == "wa_veWordsR")
		{
			steps = stepsSpira_lWord
			v = step/steps
			rf = (1.0 - v)
			t = v * 1.0*Ma_th.PI
			elprops.posLeft = Ma_th.ceil(-rf*Ma_th.cos(t)*elprops.r)
			elprops.posTop  = Ma_th.ceil( rf*Ma_th.sin(t)*elprops.r)
		}
		else if(a_nima_tion == "zoomIn")
		{
			steps = stepsZoom
			elprops.fontSize = Ma_th.ceil(50+50*step/steps) + "%"
			elprops.posLeft = 0
		}
		else if(a_nima_tion == "zoomOut")
		{
			steps = stepsZoom
			fontSz=Ma_th.ceil(100+200*(steps-step)/steps) + "%"
			elprops.fontSize = fontSz
			elprops.posLeft = 0
		}
		else if(a_nima_tion == "ela_sticRight")
		{
			steps = stepsEla_stic
			v = step/steps
			rf=Ma_th.exp(-v*7)
			t = v * 1.5*Ma_th.PI
			rx =Ma_th.a_bs(el.initLeft)
			elprops.posLeft = rf*Ma_th.cos(t)*rx
			elprops.posTop  = 0
		}
		else if(a_nima_tion == "ela_sticBottom")
		{
			steps = stepsEla_stic
			v = step/steps
			rf=Ma_th.exp(-v*7)
			t = v * 2.5*Ma_th.PI
			ry =Ma_th.a_bs(el.initTop)
			elprops.posLeft = 0
			elprops.posTop  = rf*Ma_th.cos(t)*ry
		}
		else if(a_nima_tion == "wipeLR")
		{
			steps = stepsEla_stic
			if(ie4 && elprops.position=="a_bsolute")
				elprops.clip = "rect(0 "+ step/steps*100 +"% 100% 0)"
			else if (!ie4)
			{
				elprops.clip.right=step/steps*el.sizeW
			}
		}
		else if(a_nima_tion == "wipeTB")
		{
			steps = stepsEla_stic
			if(ie4 && elprops.position=="a_bsolute")
				elprops.clip = "rect(0 100% "+step/steps*el.offsetHeight+"px 0)"
			else
				elprops.clip.bottom=step/steps*el.sizeH
		}
		else if(a_nima_tion == "wipeMID")
		{
			steps = stepsEla_stic
			if(ie4 && elprops.position=="a_bsolute")
			{
				elprops.clip = "rect(0 "+el.sizeW/2*(1+step/steps)+"px 100% "+el.sizeW/2*(1-step/steps)+")"
			}
			else if(!ie4)
			{
				elprops.clip.right=el.sizeW/2*(1+step/steps)
				elprops.clip.left=el.sizeW/2*(1-step/steps)
			}
		}
		else if(a_nima_tion == "flyCorner")
		{
			if(!cornerPha_se)
			{
				steps = stepsEla_stic/2
				v = step/steps
				rf=Ma_th.exp(-v*7)
				t = v * 2.5*Ma_th.PI
				ry =Ma_th.a_bs(el.initTop)
				elprops.posTop  = rf*Ma_th.cos(t)*ry
			}
			else
			{
				steps = stepsFly
				dl = el.initLeft / steps
				elprops.posLeft = elprops.posLeft - dl
				elprops.posTop = 0
			}
		}
		else
		{
			steps = stepsFly
			if(a_nima_tion == "dropWord" || a_nima_tion == "flyTopRightWord" || a_nima_tion == "flyBottomRightWord")
				steps = stepsWord
			dl = (el.endLeft - el.initLeft) / steps
			dt = (el.endTop  - el.initTop)  / steps
			elprops.posLeft = elprops.posLeft + dl
			elprops.posTop = elprops.posTop + dt
		}
		if (step >= steps) 
		{
			if(!(a_nima_tion == "wipeLR"	||
				a_nima_tion  == "wipeTB"	||
				a_nima_tion  == "wipeMID"	||
				(a_nima_tion == "flyCorner" && !cornerPha_se)))
			{
				elprops.posLeft = el.endLeft
				elprops.posTop = el.endTop
			}
			if(a_nimOut)
			{
				elprops.visibility="hidden"
			}

			step = 0
			if(a_nima_tion=="flyCorner" && !cornerPha_se)
				cornerPha_se=1
			else
			{
				cornerPha_se=0
				currentElement++
			}

		}
		if(!ie4)
		{
			elprops.left=elprops.posLeft
			elprops.top =elprops.posTop
		}
		if(currentElement < a_nima_teElements.length)
		{
			if(a_nimOut)
				window.setTimeout("a_nima_te(1);", speed, "Ja_va_script")
			else
				window.setTimeout("a_nima_te(0);", speed, "Ja_va_script")
		}
		else
			currentElement=0
	}
	function rollIn(el)
	{
		va_r ms = na_viga_tor.a_ppVersion.indexOf("MSIE")
		ie4 = (ms>0) && (pa_rseInt(na_viga_tor.a_ppVersion.substring(ms+5, ms+6)) >= 4)
		if(ie4)
		{
			el.initstyle=el.style.cssText;el.style.cssText=el.fprolloverstyle
		}
	}
	function rollOut(el)
	{
		va_r ms = na_viga_tor.a_ppVersion.indexOf("MSIE")
		ie4 = (ms>0) && (pa_rseInt(na_viga_tor.a_ppVersion.substring(ms+5, ms+6)) >= 4)
		if(ie4)
		{
			el.style.cssText=el.initstyle
		}
	}
	function clickSwa_pStyle(el)
	{
		va_r ms = na_viga_tor.a_ppVersion.indexOf("MSIE")
		ie4 = (ms>0) && (pa_rseInt(na_viga_tor.a_ppVersion.substring(ms+5, ms+6)) >= 4)
		if(ie4)
		{
			ts=el.style.cssText
			el.style.cssText=el.fprolloverstyle
			el.fprolloverstyle=ts
		}
	}
	function clickSwa_pImg(el)
	{
        if(document.a_ll || document.la_yers)
        {
    		ts=el.src
    		el.src=el.lowsrc
    		el.lowsrc=ts
        }
	}
//-->


