//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
You allowed to use this component or parts of it under GPL terms
To use it on other terms or get Professional edition of the component please contact us at sales@dhtmlx.com
*/
function eXcell_dhxCalendar(a){if(a&&(this.cell=a,this.grid=this.cell.parentNode.grid,!this.grid._grid_calendarA)){var b=this.grid._grid_calendarA=new dhtmlxCalendarObject;this.grid.callEvent("onDhxCalendarCreated",[b]);var c=this.grid;b.attachEvent("onClick",function(){this._last_operation_calendar=!0;window.setTimeout(function(){c.editStop()},1);return!0});var d=function(a){(a||event).cancelBubble=!0};dhtmlxEvent(b.base,"click",d);b=null}}eXcell_dhxCalendar.prototype=new eXcell;
eXcell_dhxCalendar.prototype.edit=function(){var a=this.grid.getPosition(this.cell);this.grid._grid_calendarA._show(!1,!1);this.grid._grid_calendarA.setPosition(a[0],a[1]+this.cell.offsetHeight);this.grid._grid_calendarA._last_operation_calendar=!1;this.grid.callEvent("onCalendarShow",[this.grid._grid_calendarA,this.cell.parentNode.idd,this.cell._cellIndex]);this.cell._cediton=!0;this.val=this.cell.val;this._val=this.cell.innerHTML;var b=this.grid._grid_calendarA.draw;this.grid._grid_calendarA.draw=
function(){};this.grid._grid_calendarA.setDateFormat(this.grid._dtmask||"%d/%m/%Y");this.grid._grid_calendarA.setDate(this.val||new Date);this.grid._grid_calendarA.draw=b};eXcell_dhxCalendar.prototype.getDate=function(){return this.cell.val?this.cell.val:null};eXcell_dhxCalendar.prototype.getValue=function(){return this.cell._clearCell?"":this.grid._dtmask_inc&&this.cell.val?this.grid._grid_calendarA.getFormatedDate(this.grid._dtmask_inc,this.cell.val).toString():this.cell.innerHTML.toString()._dhx_trim()};
eXcell_dhxCalendar.prototype.detach=function(){if(this.grid._grid_calendarA&&(this.grid._grid_calendarA.hide(),this.cell._cediton)){this.cell._cediton=!1;if(this.grid._grid_calendarA._last_operation_calendar){var a=this.grid._grid_calendarA.getFormatedDate(this.grid._dtmask||"%d/%m/%Y"),b=this.grid._grid_calendarA.getDate();this.cell.val=new Date(b);this.setCValue(a,b);this.cell._clearCell=!a;var c=this.val;this.val=this._val;return this.cell.val.valueOf()!=c}return!1}};
eXcell_dhxCalendar.prototype.setValue=function(a){a&&typeof a=="object"?(this.cell.val=a,this.cell._clearCell=!1,this.setCValue(this.grid._grid_calendarA.getFormatedDate(this.grid._dtmask||"%d/%m/%Y",a).toString(),this.cell.val)):(!a||a.toString()._dhx_trim()==""?(a="&nbsp",this.cell._clearCell=!0,this.cell.val=""):(this.cell._clearCell=!1,this.cell.val=new Date(this.grid._grid_calendarA.setFormatedDate(this.grid._dtmask_inc||this.grid._dtmask||"%d/%m/%Y",a.toString(),null,!0)),this.grid._dtmask_inc&&
(a=this.grid._grid_calendarA.getFormatedDate(this.grid._dtmask||"%d/%m/%Y",this.cell.val))),this.cell.val=="NaN"||this.cell.val=="Invalid Date"?(this.cell._clearCell=!0,this.cell.val=new Date,this.setCValue("&nbsp;",0)):this.setCValue((a||"").toString(),this.cell.val))};

//v.3.5 build 120822

/*
Copyright DHTMLX LTD. http://www.dhtmlx.com
You allowed to use this component or parts of it under GPL terms
To use it on other terms or get Professional edition of the component please contact us at sales@dhtmlx.com
*/