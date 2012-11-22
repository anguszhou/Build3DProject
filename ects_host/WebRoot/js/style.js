(function(d,m,l){if(d[m]===l)d[m]={};m=d[m];var j=d.document,g=function(h,r,v,e){if(!r||!h)return h;if(v===l)v=true;var q,p,u;if(e&&(u=e.length))for(q=0;q<u;q++){p=e[q];if(p in r)if(v||!(p in h))h[p]=r[p]}else for(p in r)if(v||!(p in h))h[p]=r[p];return h},k=false,o=[],s=false;g(m,{version:"1.0.5",_init:function(){this.Env={mods:{}}},add:function(h,r){this.Env.mods[h]={name:h,fn:r};r(this);return this},ready:function(h){s||this._bindReady();k?h.call(d,this):o.push(h);return this},_bindReady:function(){var h=
this,r=j.documentElement.doScroll,v=r?"onreadystatechange":"DOMContentLoaded";s=true;if(j.attachEvent){if(d!=d.top){var e=function(){if(j.readyState==="complete"){j.detachEvent(v,e);h._fireReady()}};j.attachEvent(v,e)}else{var q=function(){try{r("left");h._fireReady()}catch(u){setTimeout(q,1)}};q()}d.attachEvent("onload",function(){h._fireReady()})}else{var p=function(){j.removeEventListener(v,p,false);h._fireReady()};j.addEventListener(v,p,false)}},_fireReady:function(){if(!k){k=true;if(o){for(var h,
r=0;h=o[r++];)h.call(d,this);o=null}}},mix:g,merge:function(){var h=arguments,r={},v,e=h.length;for(v=0;v<e;++v)g(r,h[v]);return r},extend:function(h,r,v,e){if(!r||!h)return h;var q=Object.prototype,p=r.prototype,u=function(f){function b(){}b.prototype=f;return new b}(p);h.prototype=u;u.constructor=h;h.superclass=p;if(r!==Object&&p.constructor===q.constructor)p.constructor=r;v&&g(u,v);e&&g(h,e);return h},augment:function(h,r,v,e){return g(h.prototype,m.isFunction(r)?r.prototype:r,v,e)},app:function(h,
r){var v=d[h]||{};g(v,this,true,["_init","add","namespace"]);v._init();return g(d[h]=v,m.isFunction(r)?r():r)},namespace:function(){var h=arguments,r=h.length,v=null,e,q,p;for(e=0;e<r;++e){p=(""+h[e]).split(".");v=this;for(q=d[p[0]]===v?1:0;q<p.length;++q)v=v[p[q]]=v[p[q]]||{}}return v},log:function(h,r,v){if(this.Config.debug){v&&(h=v+": "+h);if(d.console!==l&&console.log)console[r&&console[r]?r:"log"](h)}return this},error:function(h){if(this.Config.debug)throw h;},now:function(){return(new Date).getTime()}});
m._init();m.Config={debug:""}})(window,"KISSY");
KISSY.add("lang",function(d,m){function l(e){var q=typeof e;return e===null|(q!=="object"&&q!=="function")}var j=document,g=Array.prototype,k=g.forEach,o=g.indexOf,s=g.slice,h=/^\s+|\s+$/g,r=/^(\w+)\[\]$/,v=Object.prototype.toString;d.mix(d,{each:k?function(e,q,p){k.call(e,q,p);return this}:function(e,q,p){var u=e&&e.length||0,f;for(f=0;f<u;++f)q.call(p||this,e[f],f,e);return this},trim:String.prototype.trim?function(e){return(e||"").trim()}:function(e){return(e||"").replace(h,"")},isPlainObject:function(e){return e&&
v.call(e)==="[object Object]"&&!e.nodeType&&!e.setInterval},isEmptyObject:function(e){for(var q in e)return false;return true},isFunction:function(e){return v.call(e)==="[object Function]"},isArray:function(e){return v.call(e)==="[object Array]"},indexOf:o?function(e,q){return o.call(q,e)}:function(e,q){for(var p=0,u=q.length;p<u;++p)if(q[p]===e)return p;return-1},inArray:function(e,q){return d.indexOf(e,q)!==-1},makeArray:function(e){if(e===null||e===m)return[];if(d.isArray(e))return e;if(typeof e.length!==
"number"||typeof e==="string"||d.isFunction(e))return[e];if(e.item&&d.UA.ie){for(var q=[],p=0,u=e.length;p<u;++p)q[p]=e[p];return q}return s.call(e)},param:function(e){if(typeof e!=="object")return"";var q=[],p,u;for(p in e){u=e[p];if(l(u))q.push(p,"=",u+"","&");else if(d.isArray(u)&&u.length)for(var f=0,b=u.length;f<b;++f)l(u[f])&&q.push(p+"[]=",u[f]+"","&")}q.pop();return encodeURI(q.join(""))},unparam:function(e,q){if(typeof e!=="string"||(e=decodeURI(d.trim(e))).length===0)return{};var p={};e=
e.split(q||"&");for(var u,f,b=0,i=e.length;b<i;++b){u=e[b].split("=");q=u[0];u=u[1]||"";if((f=q.match(r))&&f[1]){p[f[1]]=p[f[1]]||[];p[f[1]].push(u)}else p[q]=u}return p},later:function(e,q,p,u,f){q=q||0;u=u||{};var b=e,i=d.makeArray(f),a;if(typeof e==="string")b=u[e];b||d.error("method undefined");e=function(){b.apply(u,i)};a=p?setInterval(e,q):setTimeout(e,q);return{id:a,interval:p,cancel:function(){this.interval?clearInterval(a):clearTimeout(a)}}},globalEval:function(e){if(e=d.trim(e)){var q=j.getElementsByTagName("head")[0]||
j.documentElement,p=j.createElement("script");if(d.UA.ie)p.text=e;else p.appendChild(j.createTextNode(e));q.insertBefore(p,q.firstChild);q.removeChild(p)}}});if("ks-debug"in d.unparam(location.hash))d.Config.debug=true});
KISSY.add("ua",function(d){var m=navigator.userAgent,l,j={ie:0,gecko:0,firefox:0,opera:0,webkit:0,safari:0,chrome:0,mobile:""},g=function(k){var o=0;return parseFloat(k.replace(/\./g,function(){return o++===0?".":""}))};if((l=m.match(/AppleWebKit\/([\d.]*)/))&&l[1]){j.webkit=g(l[1]);if((l=m.match(/Chrome\/([\d.]*)/))&&l[1])j.chrome=g(l[1]);else if((l=m.match(/\/([\d.]*) Safari/))&&l[1])j.safari=g(l[1]);if(/ Mobile\//.test(m))j.mobile="Apple";else if(l=m.match(/NokiaN[^\/]*|Android \d\.\d|webOS\/\d\.\d/))j.mobile=
l[0]}else if((l=m.match(/Opera\/.* Version\/([\d.]*)/))&&l[1]){j.opera=g(l[1]);if(m.match(/Opera Mini[^;]*/))j.mobile=l[0]}else if((l=m.match(/MSIE\s([^;]*)/))&&l[1])j.ie=g(l[1]);else if(l=m.match(/Gecko/)){j.gecko=1;if((l=m.match(/rv:([\d.]*)/))&&l[1])j.gecko=g(l[1]);if((l=m.match(/Firefox\/([\d.]*)/))&&l[1])j.firefox=g(l[1])}d.UA=j});
KISSY.add("selector",function(d,m){function l(f,b,i){var a,c=[],n,t;if(typeof f===v){f=d.trim(f);if(p.test(f)){if(b=g(f.slice(1)))c=[b]}else if(a=u.exec(f)){n=a[1];t=a[2];a=a[3];if(b=n?g(n):j(b))if(a){if(!n||f.indexOf(e)!==-1)c=o(a,t,b)}else if(t)c=k(b,t)}else if(f.indexOf(",")>-1)if(r.querySelectorAll)c=r.querySelectorAll(f);else{n=f.split(",");t=[];c=0;for(f=n.length;c<f;++c)t=t.concat(l(n[c],b));c=s(t)}}else if(f&&f.nodeType)c=[f];else if(f&&f.item)c=f;if(c.item)c=d.makeArray(c);i||h(c);return c}
function j(f){if(f===m)f=r;else if(typeof f===v&&p.test(f))f=g(f.slice(1));else if(f&&f.nodeType!==1&&f.nodeType!==9)f=null;return f}function g(f){return r.getElementById(f)}function k(f,b){return f.getElementsByTagName(b)}function o(f,b,i){i=f=i.getElementsByClassName(f);var a=0,c=0,n=f.length,t;if(b&&b!==q){i=[];for(b=b.toUpperCase();a<n;++a){t=f[a];if(t.tagName===b)i[c++]=t}}return i}function s(f){var b=false;f.sort(function(a,c){a=a.sourceIndex-c.sourceIndex;if(a===0)b=true;return a});if(b)for(var i=
1;i<f.length;i++)f[i]===f[i-1]&&f.splice(i--,1);return f}function h(f){f.each=function(b,i){d.each(f,b,i)}}var r=document,v="string",e=" ",q="*",p=/^#[\w-]+$/,u=/^(?:#([\w-]+))?\s*([\w-]+|\*)?\.?([\w-]+)?$/;(function(){var f=r.createElement("div");f.appendChild(r.createComment(""));if(f.getElementsByTagName(q).length>0)k=function(b,i){b=b.getElementsByTagName(i);if(i===q){i=[];for(var a=0,c=0,n;n=b[a++];)if(n.nodeType===1)i[c++]=n;b=i}return b}})();r.getElementsByClassName||(o=r.querySelectorAll?
function(f,b,i){return i.querySelectorAll((b?b:"")+"."+f)}:function(f,b,i){b=i.getElementsByTagName(b||q);i=[];var a=0,c=0,n=b.length,t,w;for(f=e+f+e;a<n;++a){t=b[a];if((w=t.className)&&(e+w+e).indexOf(f)>-1)i[c++]=t}return i});d.query=l;d.get=function(f,b){return l(f,b,true)[0]||null}});
KISSY.add("dom-base",function(d,m){function l(a,c){return c&&c.nodeName.toUpperCase()===a.toUpperCase()}function j(a,c){for(var n=[],t=0;a;a=a.nextSibling)if(a.nodeType===1&&a!==c)n[t++]=a;return n}function g(a,c,n){c=c||0;for(var t=0;a;a=a[n])if(a.nodeType===1&&t++===c)break;return a}function k(a,c){var n=null,t;if(a&&(a.push||a.item)&&a[0]){c=c||a[0].ownerDocument;n=c.createDocumentFragment();if(a.item)a=d.makeArray(a);c=0;for(t=a.length;c<t;++c)n.appendChild(a[c])}else d.error("unable to convert "+
a+" to fragment");return n}var o=document,s=o.documentElement.textContent!==m?"textContent":"innerText",h=d.UA,r=h.ie,v=r&&r<8,e={readonly:"readOnly"},q=/href|src|style/,p=/href|src|colspan|rowspan/,u=/\r/g,f=/radio|checkbox/,b=o.createElement("DIV"),i=/^[a-z]+$/i;v&&d.mix(e,{"for":"htmlFor","class":"className"});d.DOM={query:d.query,get:d.get,attr:function(a,c,n){if(!a||a.nodeType!==1)return m;var t;c=c.toLowerCase();c=e[c]||c;if(n===m){if(q.test(c)){if(c==="style")t=a.style.cssText}else t=a[c];
if(t===m)t=a.getAttribute(c);if(v&&p.test(c))t=a.getAttribute(c,2);return t===null?m:t}if(c==="style")a.style.cssText=n;else a.setAttribute(c,""+n)},removeAttr:function(a,c){a&&a.nodeType===1&&a.removeAttribute(c)},val:function(a,c){if(!a||a.nodeType!==1)return m;if(c===m){if(l("option",a))return(a.attributes.value||{}).specified?a.value:a.text;if(l("select",a)){c=a.selectedIndex;var n=a.options;if(c<0)return null;else if(a.type==="select-one")return d.DOM.val(n[c]);a=[];c=0;for(var t=n.length;c<
t;++c)n[c].selected&&a.push(d.DOM.val(n[c]));return a}if(h.webkit&&f.test(a.type))return a.getAttribute("value")===null?"on":a.value;return(a.value||"").replace(u,"")}if(l("select",a)){n=d.makeArray(c);var w=a.options,x;c=0;for(t=w.length;c<t;++c){x=w[c];x.selected=d.inArray(d.DOM.val(x),n)}if(!n.length)a.selectedIndex=-1}else a.value=c},css:function(a,c,n){if(n===m)return a.style[c];d.each(d.makeArray(a),function(t){t.style[c]=n})},text:function(a,c){if(c===m)return(a||{})[s]||"";if(a)a[s]=c},html:function(a,
c){if(c===m)return a.innerHTML;a.innerHTML=c},children:function(a){if(a.children)return d.makeArray(a.children);return j(a.firstChild)},siblings:function(a){return j(a.parentNode.firstChild,a)},next:function(a){return g(a,1,"nextSibling")},prev:function(a){return g(a,1,"previousSibling")},parent:function(a){return(a=a.parentNode)&&a.nodeType!==11?a:null},create:function(a,c){if(typeof a==="string")a=d.trim(a);if(i.test(a))return(c||o).createElement(a);var n=null;n=c?c.createElement("DIV"):b;n.innerHTML=
a;a=n.childNodes;return n=a.length===1?a[0].parentNode.removeChild(a[0]):k(a,c||o)},addStyleSheet:function(a,c){var n=o.getElementsByTagName("head")[0],t=o.createElement("style");c&&(t.id=c);n.appendChild(t);if(t.styleSheet)t.styleSheet.cssText=a;else t.appendChild(o.createTextNode(a))}}});
KISSY.add("dom-class",function(d,m){function l(s,h,r){if(d.isArray(s)){d.each(s,function(){h.apply(r,Array.prototype.slice.call(arguments,3))});return true}}var j=d.DOM;d.mix(j,{hasClass:function(s,h){if(!h||!s||!s.className)return false;return(" "+s.className+" ").indexOf(" "+h+" ")>-1},addClass:function(s,h){if(!l(s,k,j,h))if(h&&s)g(s,h)||(s.className+=" "+h)},removeClass:function(s,h){if(!l(s,o,j,h))if(g(s,h)){s.className=(" "+s.className+" ").replace(" "+h+" "," ");g(s,h)&&o(s,h)}},replaceClass:function(s,
h,r){o(s,h);k(s,r)},toggleClass:function(s,h,r){l(s,j.toggleClass,j,h,r)||((r!==m?r:!g(s,h))?k(s,h):o(s,h))}});var g=j.hasClass,k=j.addClass,o=j.removeClass});
KISSY.add("event",function(d,m){function l(b,i,a,c){if(d.isArray(i)){d.each(i,function(n){f[b](n,a,c)});return true}if((a=d.trim(a))&&a.indexOf(q)>0){d.each(a.split(q),function(n){f[b](i,n,c)});return true}}function j(b){var i=-1;if(b.nodeType===3||b.nodeType===8)return i;return i=b.nodeType?o.attr(b,e):b.isCustomEventTarget?b.eventTargetId:b[e]}function g(b,i){if(b.nodeType)o.attr(b,e,i);else if(b.isCustomEventTarget)b.eventTargetId=i;else try{b[e]=i}catch(a){d.error(a)}}function k(b){if(b.nodeType)o.removeAttr(b,
e);else if(b.isCustomEventTarget)b.eventTargetId=m;else b[e]=m}var o=d.DOM,s=window,h=document,r=h.addEventListener?function(b,i,a){b.addEventListener&&b.addEventListener(i,a,false)}:function(b,i,a){b.attachEvent&&b.attachEvent("on"+i,a)},v=h.removeEventListener?function(b,i,a){b.removeEventListener&&b.removeEventListener(i,a,false)}:function(b,i,a){b.detachEvent&&b.detachEvent("on"+i,a)},e="data-ks-event-guid",q=" ",p=d.now(),u={},f={special:{},add:function(b,i,a){if(!l("add",b,i,a)){var c=j(b),
n,t;if(!(c===-1||!i||!d.isFunction(a))){if(!c){g(b,c=p++);u[c]={target:b,events:{}}}t=u[c].events;n=!b.isCustomEventTarget&&f.special[i]||{};if(!t[i]){c=function(w,x){if(!w||!w.fixed){w=new d.EventObject(b,w,i);d.isPlainObject(x)&&d.mix(w,x)}n.setup&&n.setup(w);return(n.handle||f._handle)(b,w,t[i].listeners)};t[i]={handle:c,listeners:[]};if(b.isCustomEventTarget)b._addEvent&&b._addEvent(i,c);else r(b,n.fix||i,c)}t[i].listeners.push(a)}}},remove:function(b,i,a){if(!l("remove",b,i,a)){var c=j(b),n,
t,w,x,y,z;if(c!==-1)if(c&&(n=u[c]))if(n.target===b){n=n.events||{};if(t=n[i]){w=t.listeners;y=w.length;if(d.isFunction(a)&&y&&d.inArray(a,w)){z=[];for(x=0;x<y;++x)a!==w[x]&&z.push(w[x]);y=z.length}if(a===m||y===0){b.isCustomEventTarget||v(b,i,t.handle);delete u[c].type}}if(i===m||d.isEmptyObject(n)){for(i in n)f.remove(b,i);delete u[c];k(b)}}}},_handle:function(b,i,a){for(var c,n=0,t=a.length;n<t;++n){c=a[n].call(b,i);if(i.isImmediatePropagationStopped)break;c===false&&i.halt()}return c},_getCache:function(b){return u[b]},
_simpleAdd:r,_simpleRemove:v};f.on=f.add;d.Event=f;s.attachEvent&&!s.addEventListener&&s.attachEvent("onunload",function(){var b,i;for(b in u)if(i=u[b].target)try{f.remove(i)}catch(a){}})});
KISSY.add("event-object",function(d,m){function l(k,o,s){this.currentTarget=k;this.originalEvent=o||{};if(o){this.type=o.type;this._fix()}else{this.type=s;this.target=k}this.fixed=true}var j=document,g="altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode layerX layerY metaKey newValue offsetX offsetY originalTarget pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" ");d.mix(l.prototype,
{_fix:function(){for(var k=this.originalEvent,o=g.length,s;o;){s=g[--o];this[s]=k[s]}if(!this.target)this.target=this.srcElement||j;if(this.target.nodeType===3)this.target=this.target.parentNode;if(!this.relatedTarget&&this.fromElement)this.relatedTarget=this.fromElement===this.target?this.toElement:this.fromElement;if(this.pageX===m&&this.clientX!==m){k=j.documentElement;o=j.body;this.pageX=this.clientX+(k&&k.scrollLeft||o&&o.scrollLeft||0)-(k&&k.clientLeft||o&&o.clientLeft||0);this.pageY=this.clientY+
(k&&k.scrollTop||o&&o.scrollTop||0)-(k&&k.clientTop||o&&o.clientTop||0)}if(this.which===m)this.which=this.charCode!==m?this.charCode:this.keyCode;if(this.metaKey===m)this.metaKey=this.ctrlKey;if(!this.which&&this.button!==m)this.which=this.button&1?1:this.button&2?3:this.button&4?2:0},preventDefault:function(){var k=this.originalEvent;if(k.preventDefault)k.preventDefault();else k.returnValue=false;this.isDefaultPrevented=true},stopPropagation:function(){var k=this.originalEvent;if(k.stopPropagation)k.stopPropagation();
else k.cancelBubble=true;this.isPropagationStopped=true},stopImmediatePropagation:function(){var k=this.originalEvent;k.stopImmediatePropagation?k.stopImmediatePropagation():this.stopPropagation();this.isImmediatePropagationStopped=true},halt:function(k){k?this.stopImmediatePropagation():this.stopPropagation();this.preventDefault()}});d.EventObject=l});
KISSY.add("event-target",function(d,m){var l=d.Event;d.EventTarget={eventTargetId:m,isCustomEventTarget:true,fire:function(j,g){(j=((l._getCache(this.eventTargetId||-1)||{}).events||{})[j])&&d.isFunction(j.handle)&&j.handle(m,g)},on:function(j,g){l.add(this,j,g)},detach:function(j,g){l.remove(this,j,g)}}});
KISSY.add("event-mouseenter",function(d){var m=d.Event;d.UA.ie||d.each([{name:"mouseenter",fix:"mouseover"},{name:"mouseleave",fix:"mouseout"}],function(l){m.special[l.name]={fix:l.fix,setup:function(j){j.type=l.name},handle:function(j,g,k){var o=g.relatedTarget;try{for(;o&&o!==j;)o=o.parentNode;o!==j&&m._handle(j,g,k)}catch(s){}}}})});
KISSY.add("node",function(d){function m(g,k,o){var s;if(!(this instanceof m))return new m(g,k,o);if(!g)return null;if(g.nodeType)s=g;else if(typeof g==="string")s=l.create(g,o);k&&d.error("not implemented");this[0]=s}var l=d.DOM,j=m.prototype;d.each(["attr","removeAttr","css"],function(g){j[g]=function(k,o){var s=this[0];if(o===undefined)return l[g](s,k);else{l[g](s,k,o);return this}}});d.each(["val","text","html"],function(g){j[g]=function(k){var o=this[0];if(k===undefined)return l[g](o);else{l[g](o,
k);return this}}});d.each(["children","siblings","next","prev","parent"],function(g){j[g]=function(){var k=l[g](this[0]);return k?new d[k.length?"NodeList":"Node"](k):null}});d.each(["hasClass","addClass","removeClass","replaceClass","toggleClass"],function(g){j[g]=function(){var k=l[g].apply(l,[this[0]].concat(d.makeArray(arguments)));return typeof k==="boolean"?k:this}});d.mix(j,d.EventTarget);j._addEvent=function(g,k){d.Event._simpleAdd(this[0],g,k)};delete j.fire;d.mix(j,{one:function(g){return d.one(g,
this[0])},all:function(g){return d.all(g,this[0])},appendTo:function(g){if((g=d.get(g))&&g.appendChild)g.appendChild(this[0]);return this}});d.one=function(g,k){return new m(d.get(g,k))};d.Node=m});
KISSY.add("nodelist",function(d){function m(j){if(!(this instanceof m))return new m(j);l.apply(this,j||[])}var l=Array.prototype.push;d.mix(m.prototype,{length:0,each:function(j,g){for(var k=this.length,o=0,s;o<k;++o){s=new d.Node(this[o]);j.call(g||s,s,o,this)}return this}});d.all=function(j,g){return new m(d.query(j,g,true))};d.NodeList=m});
var MFP=KISSY.app("MFP");
MFP.add("ecpm",function(s){function t(){var a=[],c=i.body,b,d="",f="",e=i.cookie.split(";"),h=/(^\s*)|(\s*$)/g;for(b=0;b<e.length;b++){e[b]=e[b].replace(h,"");if(e[b].indexOf("cna=")===0){f=e[b].substr(4,24);break}}for(b=1;b<=32;b++){e=Math.floor(Math.random()*16);if(f&&b<=f.length){h=f.charCodeAt(b-1);e=(e+h)%16}d+=e.toString(16)}a.push("cg="+d);a.push("ac="+Math.floor(Math.random()*1E4));d=f=0;for(b=1;b<=16;b++){e=Math.random();h=Math.random();Math.pow(e,2)+Math.pow(h,2)<=1&&f++;if(b<=12)d+=e}b=
"pr"+String.fromCharCode(97+f);d=Math.round(d*4973)|(c?c.clientWidth:0)<<16;a.push(b+"="+d);a.push("cas="+b);a.push("cbh="+(c?c.clientHeight:-1));a.push("cbw="+(c?c.clientWidth:-1));a.push("sx=0");a.push("sy=0");return a}function q(){var a=[],c=navigator,b=n.screen,d=0,f=0,e=0,h=0,j=0;try{d=b.width;f=b.height;e=b.availHeight;h=b.availWidth;j=b.colorDepth}catch(o){}a.push("re="+d+"x"+f);a.push("cah="+e);a.push("caw="+h);a.push("ccd="+j);a.push("ctz="+-((new Date).getTimezoneOffset()/60));a.push("chl="+
history.length);a.push("cja="+(c.javaEnabled()?"1":"0"));a.push("cpl="+(c.plugins?c.plugins.length:0));a.push("cmm="+(c.mimeTypes?c.mimeTypes.length:0));b="-1";if(c.plugins&&c.plugins.length)for(var g=0;g<c.plugins.length;g++){if(c.plugins[g].name.indexOf("Shockwave Flash")!=-1){b=c.plugins[g].description.split("Shockwave Flash ")[1];break}}else if(n.ActiveXObject)for(c=10;c>=2;c--)try{if(eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."+g+"');")){b=g+".0";break}}catch(k){}if(b!="-1")b=b.substring(0,
b.indexOf(".")+2);a.push("cf="+b);g="";g=self.location!=top.location&&i.referrer?i.referrer:i.location.href;c=i.referrer||"";a.push("u="+encodeURIComponent(g));a.push("r="+encodeURIComponent(c));q=function(){return a};return a}var p=KISSY,n=window,i=document;s.ECPM={getClientInfo:function(a){var c=[],b="";a=a||800;try{c=c.concat(t(),q());b=c.join("&").substr(0,a)}catch(d){}return b},getRequest:function(a,c){return"http://t.alimama.com/alimama.php?callback="+c+"&i="+a+"&t=k&"+this.getClientInfo()},
requestAd:function(a,c){var b=i.createElement("script");b.id="ecpm_ad-"+a;b.async=true;b.src=this.getRequest(a,c);i.getElementsByTagName("HEAD")[0].appendChild(b)},getHTML:function(a,c,b){if(a.html)return a.html;if(a.adboardtype=="txtlink"){a.html='<a href="'+a.clickurl+'" target="_blank">'+a.title+"</a>";return a.html}var d=a.imgsrc.split("?")[0];if(typeof b==="undefined")b="auto";if(typeof c==="undefined")c="auto";if(d.lastIndexOf(".swf")==d.length-4){d="swfsrc="+encodeURIComponent(a.imgsrc)+"&clickTAG="+
encodeURIComponent(a.clickurl);a.html='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="'+c+'" height="'+b+'" align="middle"><param name="allowScriptAccess" value="never" /><param name="FlashVars" value="'+d+'" /><param name="movie" value="http://a.alimama.cn/js/wrapper.swf" /><param name="wmode" value="transparent" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" /><embed src="http://a.alimama.cn/js/wrapper.swf" quality="high" bgcolor="#ffffff" width="'+
c+'" height="'+b+'" FlashVars="'+d+'" align="middle" allowScriptAccess="never" wmode="transparent" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>'}else a.html='<a href="'+a.clickurl+'" target="_blank"><img src="'+a.imgsrc+'" width="'+c+'" height="'+b+'" border="0"/></a>';return a.html},init:function(a,c){a=a||"J_ECPM";c=c||"g_ecpm_callback";a=p.query("."+a);var b={},d,f=a.length,e,h=[],j,o=this;for(d=0;d<f;d++){j=p.unparam(a[d].getAttribute("data"));
e=j.pid;a[d].id=e;b[e]=j;h.push(e)}o.requestAd(h.join(","),c);n[c]=function(g){try{var k,l,u=g.length,r,m;for(l=0;l<u;l++){k=g[l];m=k.pid;if(r=p.get("#"+m))r.innerHTML=o.getHTML(k.ads[0],b[m].width,b[m].height)}}catch(v){}}}}});



var TB=TB||{};TB.Header=function(){var f=function(u){return typeof(u)!="string"?u:document.getElementById(u)},r=navigator.userAgent.toLowerCase(),n=/msie/.test(r)&&!/opera/.test(r),k=n&&!/msie 7/.test(r)&&!/msie 8/.test(r);var h={getCookie:function(v){var u=document.cookie.match("(?:^|;)\\s*"+v+"=([^;]*)");return(u&&u[1])?decodeURIComponent(u[1]):""},parseQueryParams:function(A){var x={};var v=A.split("&");for(var y=0,z=v.length;y<z;++y){var w=v[y],B=w.search("=");var C=w.substring(0,B);var u=w.substring(B+1,w.length);x[decodeURIComponent(C)]=decodeURIComponent(u)}return x},trim:function(u){return u.replace(/^\s+|\s+$/g,"")},hasClass:function(v,u){v=f(v);if(!v||!u||!v.className){return false}return(" "+v.className+" ").indexOf(" "+u+" ")>-1},addClass:function(v,u){v=f(v);if(!v||!u){return}if(this.hasClass(v,u)){return}v.className+=" "+u},removeClass:function(v,u){v=f(v);if(!this.hasClass(v,u)){return}v.className=v.className.replace(new RegExp(u,"g"),"");if(!this.trim(v.className)){v.removeAttribute(n?"className":"class")}},addEvent:function(w,v,u){w=f(w);if(!w||!v||typeof(u)!="function"){return}if(w.addEventListener){w.addEventListener(v,u,false)}else{if(w.attachEvent){w.attachEvent("on"+v,u)}}},stopEvent:function(u){if(u.stopPropagation){u.stopPropagation()}else{u.cancelBubble=true}if(u.preventDefault){u.preventDefault()}else{u.returnValue=false}},getElementsByClassName:function(v,A,u,z){var w=[],y=f(u).getElementsByTagName(A),x=0;for(;x<y.length;x++){if(h.hasClass(y[x],v)){w[w.length]=y[x];arguments[3]&&arguments[3].call(y[x])}}return w},escapeHTML:function(v){var w=document.createElement("div");var u=document.createTextNode(v);w.appendChild(u);return w.innerHTML}};var s=h.getCookie("_nk_"),i=h.getCookie("uc1"),d=h.parseQueryParams(i),p=h.getCookie("_l_g_")&&s,o=parseInt(d._msg_)||0,j=new Date().getTime();var q=(document.location.href.indexOf("https://")===0);function a(w){if(!w){return}var v=h.getElementsByClassName("menu-bd","div",w)[0];if(!v){return}if(!q){var u=document.createElement("iframe");u.src="about: blank";u.className="menu-bd";w.insertBefore(u,v);w.iframe=u}w.menulist=v;w.onmouseenter=function(){h.addClass(this.parentNode,"hover");if(q){return}this.iframe.style.height=parseInt(this.menulist.offsetHeight)+25+"px";this.iframe.style.width=parseInt(this.menulist.offsetWidth)+1+"px"};w.onmouseleave=function(){h.removeClass(this.parentNode,"hover")}}function m(x,w,u){var v=document.createElement("option");v.innerHTML=x;v.value=w;v.className=u||"";return v}function c(){var u=document.forms.topSearch;if(!u){return}h.addEvent(u,"submit",function(v){if(u.q.value==""){u.action="http://list.taobao.com/browse/cat-0.htm"}})}function e(y){var w=f(y);if(!w){return}var x=w.q;if(!x){return}var v=w.elements.search_type;var u=w.elements.cat;h.addEvent(v,"change",function(){if(v.value=="dating"){h.addClass(u,"hidden")}else{h.removeClass(u,"hidden")}});h.addEvent(w,"submit",function(F){var B=v.value;if(B=="item"&&x.value==""&&u.value==""){w.action="http://list.taobao.com/browse/cat-0.htm"}else{if(u.value.indexOf("special")>-1){w.method="post";w.action=["http://video.taobao.com/searchlist.php","http://zazhi.taobao.com/search"][u.value.replace("special","")]+"?q="+w.q.value}else{if(B=="mall"){w.action="http://list.mall.taobao.com/search_dispatcher.htm"}else{if(B=="shop"){var D="";if(w.elements.page_type){D=w.elements.page_type.value}var E=3;if(D==="FP"){E=1}else{if(D==="SRP"){E=2}}if(!w.elements.stat){if(n){var A=document.createElement('<input name="stat" >')}else{var A=document.createElement("input");A.name="stat"}A.type="hidden";w.appendChild(A)}w.elements.stat.value=E;if(!w.elements.catName){if(n){var C=document.createElement('<input name="catName" >')}else{var C=document.createElement("input");C.name="catName"}C.type="hidden";w.appendChild(C)}w.elements.catName.value=u[u.selectedIndex].innerHTML.replace("&nbsp;","");w.action="http://shopsearch.taobao.com/browse/shop_search.htm"}else{if(B=="dating"){if(x.value==""){w.action="http://dating.taobao.com"}else{w.action="http://dating.taobao.com/search_question.htm"}}else{if(B=="global"){w.promote.value="2097152"}else{if(B=="auction"){w.atype.value="a";w.isnew.value="1,3"}}}}}}}var G=u.options[u.selectedIndex];if(!G||!G.className){return}var z=G.className.split("^");if(!z||z.length<2){return}w.elements.prop.value=z[0];w.elements.ppath.value=z[1]})}function b(B){var y=f(B);if(!y){return}var z=y.q;if(!z){return}if(!(window.TB&&TB.Suggest)){return}var v=new TB.Suggest(z,"http://suggest.taobao.com/sug",{resultFormat:""});var A=y.ssid;if(A){setTimeout(function(){A.value="s5-e"},0);A.setAttribute("autocomplete","off");v.subscribe("onItemSelect",function(){if(A.value.indexOf("-p1")==-1){A.value+="-p1"}if(y.cat&&y.cat.value==="50017708"||y.cat.value==="50016871"||y.cat.value==="99"||y.cat.value==="40"){return}if(y.viewIndex){y.viewIndex.value="7"}else{if(n){var C=document.createElement('<input name="viewIndex" >')}else{var C=document.createElement("input");C.name="viewIndex"}C.type="hidden";C.value="7";y.appendChild(C)}if(y.sort){y.sort.value="coefp"}else{if(n){var D=document.createElement('<input name="sort" >')}else{var D=document.createElement("input");D.name="sort"}D.type="hidden";D.value="coefp";y.appendChild(D)}})}var w=y.elements.search_type;var u=function(){return w.value};var x=v._needUpdate;v._needUpdate=function(){var C=u();return(C==="item"||C==="mall")&&x.call(v)}}function l(u){var v=f(u);if(!v){return}h.addEvent(v,"click",function(x){h.stopEvent(x);var w=v.href;new Image().src="//taobao.alipay.com/user/logout.htm";setTimeout(function(){location.href=w},20)})}function g(){if(document.domain.indexOf(".taobao.net")===-1){return}var x=document.getElementById("header"),w=x?x.getElementsByTagName("a"):[],v=0,u=w.length;for(;v<u;v++){w[v].href=w[v].href.replace("taobao.com",document.domain.replace(/[^.]+\./,""))}}function t(){if(document.location.href.indexOf("https://")===0){return}var u=document,x=u.getElementsByTagName("head")[0],v=u.createElement("script");v.src="http://a.tbcdn.cn/app/search/monitor.js?t=20100331.js";x.appendChild(v)}return{init:function(){if(k){var u=h.getElementsByClassName("menu","div","site-nav",function(){a(this)})}g();t();setTimeout(function v(){if(typeof v.count=="undefined"){v.count=0}v.count++;if(!(f("search")&&f("q")&&window.TB&&TB.Suggest)){if(v.count>100){return}setTimeout(arguments.callee,200)}else{c();e("search");b("search")}},200);l("J_Logout")},writeLoginInfo:function(y){y=y||{};var z=y.memberServer||"http://member1.taobao.com";var w=y.loginServer||z;var C=y.loginUrl||w+"/member/login.jhtml?f=top";var v=location.href;var E=/^http.*(\/member\/login\.jhtml)$/i;if(E.test(v)){v=""}var u=y.redirectUrl||v;if(u){C+="&redirectURL="+encodeURIComponent(u)}var B=y.logoutUrl||w+"/member/logout.jhtml?f=top";var A=z+"/member/newbie.htm";var D=z+"/message/list_private_msg.htm?t="+j;var F="http://jianghu.taobao.com/admin/home.htm?t="+j;var x="";if(p){x='\u60a8\u597d\uff0c<a class="user-nick" href="'+F+'" target="_top">'+h.escapeHTML(unescape(s.replace(/\\u/g,"%u")))+"</a>\uff01";x+='<a id="J_Logout" href="'+B+'" target="_top">\u9000\u51fa</a>';x+='<a href="'+D+'" target="_top">\u7ad9\u5185\u4fe1';if(o){x+="("+o+")"}x+="</a>"}else{x='\u60a8\u597d\uff0c\u6b22\u8fce\u6765\u6dd8\u5b9d\uff01<a href="'+C+'" target="_top">\u8bf7\u767b\u5f55</a>';x+='<a href="'+A+'" target="_top">\u514d\u8d39\u6ce8\u518c</a>'}document.write(x)}}}();

var sMax;	// 最大数量的星星即最大评分值
var holder; // 鼠标停留的评分控件
var preSet; // 保存了评分值（通过单击来进行评分）
var rated; //是否评分过，并保存了结果（注意此值一旦设为空，就不能再评分）

// 鼠标停留事件
function rating(num){
	sMax = 0;	// 默认值为0
	for(n=0; n<num.parentNode.childNodes.length; n++){
		if(num.parentNode.childNodes[n].nodeName == "A"){
			sMax++;	
		}
	}
	
	if(!rated){
		s = num.id.replace("_", ''); // 获取选中的星星的索引，这里使用_1,_2,_3,_4,_5来做为评分控件的ID，当然也有其他的方式。
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById("_"+i).className = "on";
				document.getElementById("rateStatus").innerHTML = num.title;	
				holder = a+1;
				a++;
			}else{
				document.getElementById("_"+i).className = "";
			}
		}
	}
}

// 离开事件
function off(me){
	if(!rated){
		if(!preSet){	
			for(i=1; i<=sMax; i++){		
				document.getElementById("_"+i).className = "";
				document.getElementById("rateStatus").innerHTML = me.parentNode.title;
			}
		}else{
			rating(preSet);
			//document.getElementById("rateStatus").innerHTML = document.getElementById("ratingSaved").innerHTML;
		}
	}
}

// 点击进行评分
function rateIt(me){
	if(!rated){
		document.getElementById("rateStatus").innerHTML = me.title;//document.getElementById("ratingSaved").innerHTML + " :: "+
		preSet = me;
		//rated=1;  //设为1以后，就变成了最终结果，不能再修改评分结果
		sendRate(me);
		rating(me);
	}
}

//使用Ajax或其他方式发送评分结果 
function sendRate(sel){
	//alert("评分结果: "+sel.title);
}



function ects_img_detail(originImg)
{	
	
	var pos=getElementPos(originImg);	
	var newDiv = document.createElement("div"); 
	var newImg = document.createElement("img");
	
	//娑堥櫎娴忚鍣ㄤ笂涓??涓脊鍑哄眰鏈攢姣侀棶棰??
	var ego_img_detail=document.getElementById("ego_img_detail");	
	if(ego_img_detail!=null)
	{	
		document.body.removeChild(ego_img_detail.parentNode);
	}
	
	newImg.id = "ego_img_detail";	
    newImg.src=originImg.src;
    
    newImg.width="100";
    newImg.height="100";
    
    newDiv.style.position = "absolute";
    newDiv.style.zIndex = "9999";      
   
    newDiv.style.bottom = window.screen.availHeight - 170 -pos.y - originImg.height+ "px";    
    newDiv.style.left = pos.x -3 + "px";  
        
    newDiv.style.border = "3px solid #0066cc";    
     
    newDiv.appendChild(newImg);  
    newDiv.onmouseout=function(){remove_img_detail();};
    
    document.body.appendChild(newDiv);
    
    ego_img_detail_interval=setInterval(ego_expand_detail,10);
}

function remove_img_detail()
{
	var ego_img_detail=document.getElementById("ego_img_detail");
	if(ego_img_detail!=null)
		document.body.removeChild(ego_img_detail.parentNode);
}

function ego_expand_detail()
{
	var ego_img_detail=document.getElementById("ego_img_detail");
	if(ego_img_detail!=null)
		if(ego_img_detail.height<200) 
		{
			ego_img_detail.height+=20;
			ego_img_detail.width+=20;
		}
		else
			clearInterval(ego_img_detail_interval);
		
}

function getElementPos(element)
{
	 var ua = navigator.userAgent.toLowerCase();
	 var isOpera = (ua.indexOf('opera') != -1);
	 var isIE = (ua.indexOf('msie') != -1 && !isOpera); // not opera spoof
	 var el = element;//document.getElementById(elementId);
	 if(el.parentNode === null || el.style.display == 'none') {
	  return false;
	 }      
	 var parent = null;
	 var pos = [];     
	 var box;     
	 if(el.getBoundingClientRect)    //IE
	 {         
	  box = el.getBoundingClientRect();
	  var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
	  var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
	  return {x:box.left + scrollLeft, y:box.top + scrollTop};
	 }else if(document.getBoxObjectFor)    // gecko    
	 {
	  box = document.getBoxObjectFor(el); 
	  var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0; 
	  var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0; 
	  pos = [box.x - borderLeft, box.y - borderTop];
	 } else    // safari & opera    
	 {
	  pos = [el.offsetLeft, el.offsetTop];  
	  parent = el.offsetParent;     
	  if (parent != el) { 
	   while (parent) {  
	    pos[0] += parent.offsetLeft; 
	    pos[1] += parent.offsetTop; 
	    parent = parent.offsetParent;
	   }  
	  }   
	  if (ua.indexOf('opera') != -1 || ( ua.indexOf('safari') != -1 && el.style.position == 'absolute' )) { 
	   pos[0] -= document.body.offsetLeft;
	   pos[1] -= document.body.offsetTop;         
	  }    
	 }              
	 if (el.parentNode) { 
	    parent = el.parentNode;
	   } else {
	    parent = null;
	   }
	 while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML') { // account for any scrolled ancestors
	  pos[0] -= parent.scrollLeft;
	  pos[1] -= parent.scrollTop;
	  if (parent.parentNode) {
	   parent = parent.parentNode;
	  } else {
	   parent = null;
	  }
	 }
	 return {x:pos[0], y:pos[1]};
}
