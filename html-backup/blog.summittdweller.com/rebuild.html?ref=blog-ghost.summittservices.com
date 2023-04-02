<!doctype html>
<html class="staticrypt-html">
<head>
    <meta charset="utf-8">
    <title>Summitt Dweller Blog - Rebuild</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- do not cache this page -->
    <meta http-equiv="cache-control" content="max-age=0"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT"/>
    <meta http-equiv="pragma" content="no-cache"/>

    <style>
        .staticrypt-hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 1px solid #eee;
        }

        .staticrypt-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
            box-sizing: border-box;
        }

        .staticrypt-form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }

        .staticrypt-form input[type="password"] {
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .staticrypt-form .staticrypt-decrypt-button {
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            cursor: pointer;
        }

        .staticrypt-form .staticrypt-decrypt-button:hover, .staticrypt-form .staticrypt-decrypt-button:active, .staticrypt-form .staticrypt-decrypt-button:focus {
            background: #43A047;
        }

        .staticrypt-html {
            height: 100%;
        }

        .staticrypt-body {
            height: 100%;
            margin: 0;
        }

        .staticrypt-content {
            height: 100%;
            margin-bottom: 1em;
            background: #76b852; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #76b852, #8DC26F);
            background: -moz-linear-gradient(right, #76b852, #8DC26F);
            background: -o-linear-gradient(right, #76b852, #8DC26F);
            background: linear-gradient(#fff 0%, #b8c09f 100%) fixed;
            /* background: linear-gradient(to left, #76b852, #8DC26F); */
            font-family: "Arial", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .staticrypt-instructions {
            margin-top: -1em;
            margin-bottom: 1em;
        }

        .staticrypt-title {
            font-size: 1.5em;
        }

        label.staticrypt-remember {
            display: flex;
            align-items: center;
            margin-bottom: 1em;
        }

        .staticrypt-remember input[type=checkbox] {
            transform: scale(1.5);
            margin-right: 1em;
        }

        .hidden {
            display: none !important;
        }

        .staticrypt-spinner-container {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .staticrypt-spinner {
            display: inline-block;
            width: 2rem;
            height: 2rem;
            vertical-align: text-bottom;
            border: 0.25em solid gray;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner-border .75s linear infinite;
            animation: spinner-border .75s linear infinite;
            animation-duration: 0.75s;
            animation-timing-function: linear;
            animation-delay: 0s;
            animation-iteration-count: infinite;
            animation-direction: normal;
            animation-fill-mode: none;
            animation-play-state: running;
            animation-name: spinner-border;
        }

        @keyframes spinner-border {
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>

<body class="staticrypt-body">

<div id="staticrypt_loading" class="staticrypt-spinner-container">
    <div class="staticrypt-spinner"></div>
</div>

<div id="staticrypt_content" class="staticrypt-content hidden">
    <div class="staticrypt-page">
        <div class="staticrypt-form">
            <div class="staticrypt-instructions">
                <p class="staticrypt-title">Summitt Dweller Blog - Rebuild</p>
                <p>Please enter the passphrase.<br/>Hint: gh0st</p>
            </div>

            <hr class="staticrypt-hr">

            <form id="staticrypt-form" action="rebuild.html?ref=blog-ghost.summittservices.com#" method="post">
                <input id="staticrypt-password"
                       type="password"
                       name="password"
                       placeholder="Password"
                       autofocus/>

                <label id="staticrypt-remember-label" class="staticrypt-remember hidden">
                    <input id="staticrypt-remember"
                           type="checkbox"
                           name="remember"/>
                    Remember me
                </label>

                <input type="submit" class="staticrypt-decrypt-button" value="DECRYPT"/>
            </form>
        </div>

    </div>
</div>


<script>/**
 * Crypto JS 3.1.9-1
 * Copied as is from https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.min.js
 */
!function(t,r){"object"==typeof exports?module.exports=exports=r():"function"==typeof define&&define.amd?define([],r):t.CryptoJS=r()}(this,function(){var t=t||function(t,r){var e=Object.create||function(){function t(){}return function(r){var e;return t.prototype=r,e=new t,t.prototype=null,e}}(),i={},n=i.lib={},o=n.Base=function(){return{extend:function(t){var r=e(this);return t&&r.mixIn(t),r.hasOwnProperty("init")&&this.init!==r.init||(r.init=function(){r.$super.init.apply(this,arguments)}),r.init.prototype=r,r.$super=this,r},create:function(){var t=this.extend();return t.init.apply(t,arguments),t},init:function(){},mixIn:function(t){for(var r in t)t.hasOwnProperty(r)&&(this[r]=t[r]);t.hasOwnProperty("toString")&&(this.toString=t.toString)},clone:function(){return this.init.prototype.extend(this)}}}(),s=n.WordArray=o.extend({init:function(t,e){t=this.words=t||[],e!=r?this.sigBytes=e:this.sigBytes=4*t.length},toString:function(t){return(t||c).stringify(this)},concat:function(t){var r=this.words,e=t.words,i=this.sigBytes,n=t.sigBytes;if(this.clamp(),i%4)for(var o=0;o<n;o++){var s=e[o>>>2]>>>24-o%4*8&255;r[i+o>>>2]|=s<<24-(i+o)%4*8}else for(var o=0;o<n;o+=4)r[i+o>>>2]=e[o>>>2];return this.sigBytes+=n,this},clamp:function(){var r=this.words,e=this.sigBytes;r[e>>>2]&=4294967295<<32-e%4*8,r.length=t.ceil(e/4)},clone:function(){var t=o.clone.call(this);return t.words=this.words.slice(0),t},random:function(r){for(var e,i=[],n=function(r){var r=r,e=987654321,i=4294967295;return function(){e=36969*(65535&e)+(e>>16)&i,r=18e3*(65535&r)+(r>>16)&i;var n=(e<<16)+r&i;return n/=4294967296,n+=.5,n*(t.random()>.5?1:-1)}},o=0;o<r;o+=4){var a=n(4294967296*(e||t.random()));e=987654071*a(),i.push(4294967296*a()|0)}return new s.init(i,r)}}),a=i.enc={},c=a.Hex={stringify:function(t){for(var r=t.words,e=t.sigBytes,i=[],n=0;n<e;n++){var o=r[n>>>2]>>>24-n%4*8&255;i.push((o>>>4).toString(16)),i.push((15&o).toString(16))}return i.join("")},parse:function(t){for(var r=t.length,e=[],i=0;i<r;i+=2)e[i>>>3]|=parseInt(t.substr(i,2),16)<<24-i%8*4;return new s.init(e,r/2)}},h=a.Latin1={stringify:function(t){for(var r=t.words,e=t.sigBytes,i=[],n=0;n<e;n++){var o=r[n>>>2]>>>24-n%4*8&255;i.push(String.fromCharCode(o))}return i.join("")},parse:function(t){for(var r=t.length,e=[],i=0;i<r;i++)e[i>>>2]|=(255&t.charCodeAt(i))<<24-i%4*8;return new s.init(e,r)}},l=a.Utf8={stringify:function(t){try{return decodeURIComponent(escape(h.stringify(t)))}catch(t){throw new Error("Malformed UTF-8 data")}},parse:function(t){return h.parse(unescape(encodeURIComponent(t)))}},f=n.BufferedBlockAlgorithm=o.extend({reset:function(){this._data=new s.init,this._nDataBytes=0},_append:function(t){"string"==typeof t&&(t=l.parse(t)),this._data.concat(t),this._nDataBytes+=t.sigBytes},_process:function(r){var e=this._data,i=e.words,n=e.sigBytes,o=this.blockSize,a=4*o,c=n/a;c=r?t.ceil(c):t.max((0|c)-this._minBufferSize,0);var h=c*o,l=t.min(4*h,n);if(h){for(var f=0;f<h;f+=o)this._doProcessBlock(i,f);var u=i.splice(0,h);e.sigBytes-=l}return new s.init(u,l)},clone:function(){var t=o.clone.call(this);return t._data=this._data.clone(),t},_minBufferSize:0}),u=(n.Hasher=f.extend({cfg:o.extend(),init:function(t){this.cfg=this.cfg.extend(t),this.reset()},reset:function(){f.reset.call(this),this._doReset()},update:function(t){return this._append(t),this._process(),this},finalize:function(t){t&&this._append(t);var r=this._doFinalize();return r},blockSize:16,_createHelper:function(t){return function(r,e){return new t.init(e).finalize(r)}},_createHmacHelper:function(t){return function(r,e){return new u.HMAC.init(t,e).finalize(r)}}}),i.algo={});return i}(Math);return function(){function r(t,r,e){for(var i=[],o=0,s=0;s<r;s++)if(s%4){var a=e[t.charCodeAt(s-1)]<<s%4*2,c=e[t.charCodeAt(s)]>>>6-s%4*2;i[o>>>2]|=(a|c)<<24-o%4*8,o++}return n.create(i,o)}var e=t,i=e.lib,n=i.WordArray,o=e.enc;o.Base64={stringify:function(t){var r=t.words,e=t.sigBytes,i=this._map;t.clamp();for(var n=[],o=0;o<e;o+=3)for(var s=r[o>>>2]>>>24-o%4*8&255,a=r[o+1>>>2]>>>24-(o+1)%4*8&255,c=r[o+2>>>2]>>>24-(o+2)%4*8&255,h=s<<16|a<<8|c,l=0;l<4&&o+.75*l<e;l++)n.push(i.charAt(h>>>6*(3-l)&63));var f=i.charAt(64);if(f)for(;n.length%4;)n.push(f);return n.join("")},parse:function(t){var e=t.length,i=this._map,n=this._reverseMap;if(!n){n=this._reverseMap=[];for(var o=0;o<i.length;o++)n[i.charCodeAt(o)]=o}var s=i.charAt(64);if(s){var a=t.indexOf(s);a!==-1&&(e=a)}return r(t,e,n)},_map:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="}}(),function(r){function e(t,r,e,i,n,o,s){var a=t+(r&e|~r&i)+n+s;return(a<<o|a>>>32-o)+r}function i(t,r,e,i,n,o,s){var a=t+(r&i|e&~i)+n+s;return(a<<o|a>>>32-o)+r}function n(t,r,e,i,n,o,s){var a=t+(r^e^i)+n+s;return(a<<o|a>>>32-o)+r}function o(t,r,e,i,n,o,s){var a=t+(e^(r|~i))+n+s;return(a<<o|a>>>32-o)+r}var s=t,a=s.lib,c=a.WordArray,h=a.Hasher,l=s.algo,f=[];!function(){for(var t=0;t<64;t++)f[t]=4294967296*r.abs(r.sin(t+1))|0}();var u=l.MD5=h.extend({_doReset:function(){this._hash=new c.init([1732584193,4023233417,2562383102,271733878])},_doProcessBlock:function(t,r){for(var s=0;s<16;s++){var a=r+s,c=t[a];t[a]=16711935&(c<<8|c>>>24)|4278255360&(c<<24|c>>>8)}var h=this._hash.words,l=t[r+0],u=t[r+1],d=t[r+2],v=t[r+3],p=t[r+4],_=t[r+5],y=t[r+6],g=t[r+7],B=t[r+8],w=t[r+9],k=t[r+10],S=t[r+11],m=t[r+12],x=t[r+13],b=t[r+14],H=t[r+15],z=h[0],A=h[1],C=h[2],D=h[3];z=e(z,A,C,D,l,7,f[0]),D=e(D,z,A,C,u,12,f[1]),C=e(C,D,z,A,d,17,f[2]),A=e(A,C,D,z,v,22,f[3]),z=e(z,A,C,D,p,7,f[4]),D=e(D,z,A,C,_,12,f[5]),C=e(C,D,z,A,y,17,f[6]),A=e(A,C,D,z,g,22,f[7]),z=e(z,A,C,D,B,7,f[8]),D=e(D,z,A,C,w,12,f[9]),C=e(C,D,z,A,k,17,f[10]),A=e(A,C,D,z,S,22,f[11]),z=e(z,A,C,D,m,7,f[12]),D=e(D,z,A,C,x,12,f[13]),C=e(C,D,z,A,b,17,f[14]),A=e(A,C,D,z,H,22,f[15]),z=i(z,A,C,D,u,5,f[16]),D=i(D,z,A,C,y,9,f[17]),C=i(C,D,z,A,S,14,f[18]),A=i(A,C,D,z,l,20,f[19]),z=i(z,A,C,D,_,5,f[20]),D=i(D,z,A,C,k,9,f[21]),C=i(C,D,z,A,H,14,f[22]),A=i(A,C,D,z,p,20,f[23]),z=i(z,A,C,D,w,5,f[24]),D=i(D,z,A,C,b,9,f[25]),C=i(C,D,z,A,v,14,f[26]),A=i(A,C,D,z,B,20,f[27]),z=i(z,A,C,D,x,5,f[28]),D=i(D,z,A,C,d,9,f[29]),C=i(C,D,z,A,g,14,f[30]),A=i(A,C,D,z,m,20,f[31]),z=n(z,A,C,D,_,4,f[32]),D=n(D,z,A,C,B,11,f[33]),C=n(C,D,z,A,S,16,f[34]),A=n(A,C,D,z,b,23,f[35]),z=n(z,A,C,D,u,4,f[36]),D=n(D,z,A,C,p,11,f[37]),C=n(C,D,z,A,g,16,f[38]),A=n(A,C,D,z,k,23,f[39]),z=n(z,A,C,D,x,4,f[40]),D=n(D,z,A,C,l,11,f[41]),C=n(C,D,z,A,v,16,f[42]),A=n(A,C,D,z,y,23,f[43]),z=n(z,A,C,D,w,4,f[44]),D=n(D,z,A,C,m,11,f[45]),C=n(C,D,z,A,H,16,f[46]),A=n(A,C,D,z,d,23,f[47]),z=o(z,A,C,D,l,6,f[48]),D=o(D,z,A,C,g,10,f[49]),C=o(C,D,z,A,b,15,f[50]),A=o(A,C,D,z,_,21,f[51]),z=o(z,A,C,D,m,6,f[52]),D=o(D,z,A,C,v,10,f[53]),C=o(C,D,z,A,k,15,f[54]),A=o(A,C,D,z,u,21,f[55]),z=o(z,A,C,D,B,6,f[56]),D=o(D,z,A,C,H,10,f[57]),C=o(C,D,z,A,y,15,f[58]),A=o(A,C,D,z,x,21,f[59]),z=o(z,A,C,D,p,6,f[60]),D=o(D,z,A,C,S,10,f[61]),C=o(C,D,z,A,d,15,f[62]),A=o(A,C,D,z,w,21,f[63]),h[0]=h[0]+z|0,h[1]=h[1]+A|0,h[2]=h[2]+C|0,h[3]=h[3]+D|0},_doFinalize:function(){var t=this._data,e=t.words,i=8*this._nDataBytes,n=8*t.sigBytes;e[n>>>5]|=128<<24-n%32;var o=r.floor(i/4294967296),s=i;e[(n+64>>>9<<4)+15]=16711935&(o<<8|o>>>24)|4278255360&(o<<24|o>>>8),e[(n+64>>>9<<4)+14]=16711935&(s<<8|s>>>24)|4278255360&(s<<24|s>>>8),t.sigBytes=4*(e.length+1),this._process();for(var a=this._hash,c=a.words,h=0;h<4;h++){var l=c[h];c[h]=16711935&(l<<8|l>>>24)|4278255360&(l<<24|l>>>8)}return a},clone:function(){var t=h.clone.call(this);return t._hash=this._hash.clone(),t}});s.MD5=h._createHelper(u),s.HmacMD5=h._createHmacHelper(u)}(Math),function(){var r=t,e=r.lib,i=e.WordArray,n=e.Hasher,o=r.algo,s=[],a=o.SHA1=n.extend({_doReset:function(){this._hash=new i.init([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(t,r){for(var e=this._hash.words,i=e[0],n=e[1],o=e[2],a=e[3],c=e[4],h=0;h<80;h++){if(h<16)s[h]=0|t[r+h];else{var l=s[h-3]^s[h-8]^s[h-14]^s[h-16];s[h]=l<<1|l>>>31}var f=(i<<5|i>>>27)+c+s[h];f+=h<20?(n&o|~n&a)+1518500249:h<40?(n^o^a)+1859775393:h<60?(n&o|n&a|o&a)-1894007588:(n^o^a)-899497514,c=a,a=o,o=n<<30|n>>>2,n=i,i=f}e[0]=e[0]+i|0,e[1]=e[1]+n|0,e[2]=e[2]+o|0,e[3]=e[3]+a|0,e[4]=e[4]+c|0},_doFinalize:function(){var t=this._data,r=t.words,e=8*this._nDataBytes,i=8*t.sigBytes;return r[i>>>5]|=128<<24-i%32,r[(i+64>>>9<<4)+14]=Math.floor(e/4294967296),r[(i+64>>>9<<4)+15]=e,t.sigBytes=4*r.length,this._process(),this._hash},clone:function(){var t=n.clone.call(this);return t._hash=this._hash.clone(),t}});r.SHA1=n._createHelper(a),r.HmacSHA1=n._createHmacHelper(a)}(),function(r){var e=t,i=e.lib,n=i.WordArray,o=i.Hasher,s=e.algo,a=[],c=[];!function(){function t(t){for(var e=r.sqrt(t),i=2;i<=e;i++)if(!(t%i))return!1;return!0}function e(t){return 4294967296*(t-(0|t))|0}for(var i=2,n=0;n<64;)t(i)&&(n<8&&(a[n]=e(r.pow(i,.5))),c[n]=e(r.pow(i,1/3)),n++),i++}();var h=[],l=s.SHA256=o.extend({_doReset:function(){this._hash=new n.init(a.slice(0))},_doProcessBlock:function(t,r){for(var e=this._hash.words,i=e[0],n=e[1],o=e[2],s=e[3],a=e[4],l=e[5],f=e[6],u=e[7],d=0;d<64;d++){if(d<16)h[d]=0|t[r+d];else{var v=h[d-15],p=(v<<25|v>>>7)^(v<<14|v>>>18)^v>>>3,_=h[d-2],y=(_<<15|_>>>17)^(_<<13|_>>>19)^_>>>10;h[d]=p+h[d-7]+y+h[d-16]}var g=a&l^~a&f,B=i&n^i&o^n&o,w=(i<<30|i>>>2)^(i<<19|i>>>13)^(i<<10|i>>>22),k=(a<<26|a>>>6)^(a<<21|a>>>11)^(a<<7|a>>>25),S=u+k+g+c[d]+h[d],m=w+B;u=f,f=l,l=a,a=s+S|0,s=o,o=n,n=i,i=S+m|0}e[0]=e[0]+i|0,e[1]=e[1]+n|0,e[2]=e[2]+o|0,e[3]=e[3]+s|0,e[4]=e[4]+a|0,e[5]=e[5]+l|0,e[6]=e[6]+f|0,e[7]=e[7]+u|0},_doFinalize:function(){var t=this._data,e=t.words,i=8*this._nDataBytes,n=8*t.sigBytes;return e[n>>>5]|=128<<24-n%32,e[(n+64>>>9<<4)+14]=r.floor(i/4294967296),e[(n+64>>>9<<4)+15]=i,t.sigBytes=4*e.length,this._process(),this._hash},clone:function(){var t=o.clone.call(this);return t._hash=this._hash.clone(),t}});e.SHA256=o._createHelper(l),e.HmacSHA256=o._createHmacHelper(l)}(Math),function(){function r(t){return t<<8&4278255360|t>>>8&16711935}var e=t,i=e.lib,n=i.WordArray,o=e.enc;o.Utf16=o.Utf16BE={stringify:function(t){for(var r=t.words,e=t.sigBytes,i=[],n=0;n<e;n+=2){var o=r[n>>>2]>>>16-n%4*8&65535;i.push(String.fromCharCode(o))}return i.join("")},parse:function(t){for(var r=t.length,e=[],i=0;i<r;i++)e[i>>>1]|=t.charCodeAt(i)<<16-i%2*16;return n.create(e,2*r)}};o.Utf16LE={stringify:function(t){for(var e=t.words,i=t.sigBytes,n=[],o=0;o<i;o+=2){var s=r(e[o>>>2]>>>16-o%4*8&65535);n.push(String.fromCharCode(s))}return n.join("")},parse:function(t){for(var e=t.length,i=[],o=0;o<e;o++)i[o>>>1]|=r(t.charCodeAt(o)<<16-o%2*16);return n.create(i,2*e)}}}(),function(){if("function"==typeof ArrayBuffer){var r=t,e=r.lib,i=e.WordArray,n=i.init,o=i.init=function(t){if(t instanceof ArrayBuffer&&(t=new Uint8Array(t)),(t instanceof Int8Array||"undefined"!=typeof Uint8ClampedArray&&t instanceof Uint8ClampedArray||t instanceof Int16Array||t instanceof Uint16Array||t instanceof Int32Array||t instanceof Uint32Array||t instanceof Float32Array||t instanceof Float64Array)&&(t=new Uint8Array(t.buffer,t.byteOffset,t.byteLength)),t instanceof Uint8Array){for(var r=t.byteLength,e=[],i=0;i<r;i++)e[i>>>2]|=t[i]<<24-i%4*8;n.call(this,e,r)}else n.apply(this,arguments)};o.prototype=i}}(),function(r){function e(t,r,e){return t^r^e}function i(t,r,e){return t&r|~t&e}function n(t,r,e){return(t|~r)^e}function o(t,r,e){return t&e|r&~e}function s(t,r,e){return t^(r|~e)}function a(t,r){return t<<r|t>>>32-r}var c=t,h=c.lib,l=h.WordArray,f=h.Hasher,u=c.algo,d=l.create([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,7,4,13,1,10,6,15,3,12,0,9,5,2,14,11,8,3,10,14,4,9,15,8,1,2,7,0,6,13,11,5,12,1,9,11,10,0,8,12,4,13,3,7,15,14,5,6,2,4,0,5,9,7,12,2,10,14,1,3,8,11,6,15,13]),v=l.create([5,14,7,0,9,2,11,4,13,6,15,8,1,10,3,12,6,11,3,7,0,13,5,10,14,15,8,12,4,9,1,2,15,5,1,3,7,14,6,9,11,8,12,2,10,0,4,13,8,6,4,1,3,11,15,0,5,12,2,13,9,7,10,14,12,15,10,4,1,5,8,7,6,2,13,14,0,3,9,11]),p=l.create([11,14,15,12,5,8,7,9,11,13,14,15,6,7,9,8,7,6,8,13,11,9,7,15,7,12,15,9,11,7,13,12,11,13,6,7,14,9,13,15,14,8,13,6,5,12,7,5,11,12,14,15,14,15,9,8,9,14,5,6,8,6,5,12,9,15,5,11,6,8,13,12,5,12,13,14,11,8,5,6]),_=l.create([8,9,9,11,13,15,15,5,7,7,8,11,14,14,12,6,9,13,15,7,12,8,9,11,7,7,12,7,6,15,13,11,9,7,15,11,8,6,6,14,12,13,5,14,13,13,7,5,15,5,8,11,14,14,6,14,6,9,12,9,12,5,15,8,8,5,12,9,12,5,14,6,8,13,6,5,15,13,11,11]),y=l.create([0,1518500249,1859775393,2400959708,2840853838]),g=l.create([1352829926,1548603684,1836072691,2053994217,0]),B=u.RIPEMD160=f.extend({_doReset:function(){this._hash=l.create([1732584193,4023233417,2562383102,271733878,3285377520])},_doProcessBlock:function(t,r){for(var c=0;c<16;c++){var h=r+c,l=t[h];t[h]=16711935&(l<<8|l>>>24)|4278255360&(l<<24|l>>>8)}var f,u,B,w,k,S,m,x,b,H,z=this._hash.words,A=y.words,C=g.words,D=d.words,R=v.words,E=p.words,M=_.words;S=f=z[0],m=u=z[1],x=B=z[2],b=w=z[3],H=k=z[4];for(var F,c=0;c<80;c+=1)F=f+t[r+D[c]]|0,F+=c<16?e(u,B,w)+A[0]:c<32?i(u,B,w)+A[1]:c<48?n(u,B,w)+A[2]:c<64?o(u,B,w)+A[3]:s(u,B,w)+A[4],F|=0,F=a(F,E[c]),F=F+k|0,f=k,k=w,w=a(B,10),B=u,u=F,F=S+t[r+R[c]]|0,F+=c<16?s(m,x,b)+C[0]:c<32?o(m,x,b)+C[1]:c<48?n(m,x,b)+C[2]:c<64?i(m,x,b)+C[3]:e(m,x,b)+C[4],F|=0,F=a(F,M[c]),F=F+H|0,S=H,H=b,b=a(x,10),x=m,m=F;F=z[1]+B+b|0,z[1]=z[2]+w+H|0,z[2]=z[3]+k+S|0,z[3]=z[4]+f+m|0,z[4]=z[0]+u+x|0,z[0]=F},_doFinalize:function(){var t=this._data,r=t.words,e=8*this._nDataBytes,i=8*t.sigBytes;r[i>>>5]|=128<<24-i%32,r[(i+64>>>9<<4)+14]=16711935&(e<<8|e>>>24)|4278255360&(e<<24|e>>>8),t.sigBytes=4*(r.length+1),this._process();for(var n=this._hash,o=n.words,s=0;s<5;s++){var a=o[s];o[s]=16711935&(a<<8|a>>>24)|4278255360&(a<<24|a>>>8)}return n},clone:function(){var t=f.clone.call(this);return t._hash=this._hash.clone(),t}});c.RIPEMD160=f._createHelper(B),c.HmacRIPEMD160=f._createHmacHelper(B)}(Math),function(){var r=t,e=r.lib,i=e.Base,n=r.enc,o=n.Utf8,s=r.algo;s.HMAC=i.extend({init:function(t,r){t=this._hasher=new t.init,"string"==typeof r&&(r=o.parse(r));var e=t.blockSize,i=4*e;r.sigBytes>i&&(r=t.finalize(r)),r.clamp();for(var n=this._oKey=r.clone(),s=this._iKey=r.clone(),a=n.words,c=s.words,h=0;h<e;h++)a[h]^=1549556828,c[h]^=909522486;n.sigBytes=s.sigBytes=i,this.reset()},reset:function(){var t=this._hasher;t.reset(),t.update(this._iKey)},update:function(t){return this._hasher.update(t),this},finalize:function(t){var r=this._hasher,e=r.finalize(t);r.reset();var i=r.finalize(this._oKey.clone().concat(e));return i}})}(),function(){var r=t,e=r.lib,i=e.Base,n=e.WordArray,o=r.algo,s=o.SHA1,a=o.HMAC,c=o.PBKDF2=i.extend({cfg:i.extend({keySize:4,hasher:s,iterations:1}),init:function(t){this.cfg=this.cfg.extend(t)},compute:function(t,r){for(var e=this.cfg,i=a.create(e.hasher,t),o=n.create(),s=n.create([1]),c=o.words,h=s.words,l=e.keySize,f=e.iterations;c.length<l;){var u=i.update(r).finalize(s);i.reset();for(var d=u.words,v=d.length,p=u,_=1;_<f;_++){p=i.finalize(p),i.reset();for(var y=p.words,g=0;g<v;g++)d[g]^=y[g]}o.concat(u),h[0]++}return o.sigBytes=4*l,o}});r.PBKDF2=function(t,r,e){return c.create(e).compute(t,r)}}(),function(){var r=t,e=r.lib,i=e.Base,n=e.WordArray,o=r.algo,s=o.MD5,a=o.EvpKDF=i.extend({cfg:i.extend({keySize:4,hasher:s,iterations:1}),init:function(t){this.cfg=this.cfg.extend(t)},compute:function(t,r){for(var e=this.cfg,i=e.hasher.create(),o=n.create(),s=o.words,a=e.keySize,c=e.iterations;s.length<a;){h&&i.update(h);var h=i.update(t).finalize(r);i.reset();for(var l=1;l<c;l++)h=i.finalize(h),i.reset();o.concat(h)}return o.sigBytes=4*a,o}});r.EvpKDF=function(t,r,e){return a.create(e).compute(t,r)}}(),function(){var r=t,e=r.lib,i=e.WordArray,n=r.algo,o=n.SHA256,s=n.SHA224=o.extend({_doReset:function(){this._hash=new i.init([3238371032,914150663,812702999,4144912697,4290775857,1750603025,1694076839,3204075428])},_doFinalize:function(){var t=o._doFinalize.call(this);return t.sigBytes-=4,t}});r.SHA224=o._createHelper(s),r.HmacSHA224=o._createHmacHelper(s)}(),function(r){var e=t,i=e.lib,n=i.Base,o=i.WordArray,s=e.x64={};s.Word=n.extend({init:function(t,r){this.high=t,this.low=r}}),s.WordArray=n.extend({init:function(t,e){t=this.words=t||[],e!=r?this.sigBytes=e:this.sigBytes=8*t.length},toX32:function(){for(var t=this.words,r=t.length,e=[],i=0;i<r;i++){var n=t[i];e.push(n.high),e.push(n.low)}return o.create(e,this.sigBytes)},clone:function(){for(var t=n.clone.call(this),r=t.words=this.words.slice(0),e=r.length,i=0;i<e;i++)r[i]=r[i].clone();return t}})}(),function(r){var e=t,i=e.lib,n=i.WordArray,o=i.Hasher,s=e.x64,a=s.Word,c=e.algo,h=[],l=[],f=[];!function(){for(var t=1,r=0,e=0;e<24;e++){h[t+5*r]=(e+1)*(e+2)/2%64;var i=r%5,n=(2*t+3*r)%5;t=i,r=n}for(var t=0;t<5;t++)for(var r=0;r<5;r++)l[t+5*r]=r+(2*t+3*r)%5*5;for(var o=1,s=0;s<24;s++){for(var c=0,u=0,d=0;d<7;d++){if(1&o){var v=(1<<d)-1;v<32?u^=1<<v:c^=1<<v-32}128&o?o=o<<1^113:o<<=1}f[s]=a.create(c,u)}}();var u=[];!function(){for(var t=0;t<25;t++)u[t]=a.create()}();var d=c.SHA3=o.extend({cfg:o.cfg.extend({outputLength:512}),_doReset:function(){for(var t=this._state=[],r=0;r<25;r++)t[r]=new a.init;this.blockSize=(1600-2*this.cfg.outputLength)/32},_doProcessBlock:function(t,r){for(var e=this._state,i=this.blockSize/2,n=0;n<i;n++){var o=t[r+2*n],s=t[r+2*n+1];o=16711935&(o<<8|o>>>24)|4278255360&(o<<24|o>>>8),s=16711935&(s<<8|s>>>24)|4278255360&(s<<24|s>>>8);var a=e[n];a.high^=s,a.low^=o}for(var c=0;c<24;c++){for(var d=0;d<5;d++){for(var v=0,p=0,_=0;_<5;_++){var a=e[d+5*_];v^=a.high,p^=a.low}var y=u[d];y.high=v,y.low=p}for(var d=0;d<5;d++)for(var g=u[(d+4)%5],B=u[(d+1)%5],w=B.high,k=B.low,v=g.high^(w<<1|k>>>31),p=g.low^(k<<1|w>>>31),_=0;_<5;_++){var a=e[d+5*_];a.high^=v,a.low^=p}for(var S=1;S<25;S++){var a=e[S],m=a.high,x=a.low,b=h[S];if(b<32)var v=m<<b|x>>>32-b,p=x<<b|m>>>32-b;else var v=x<<b-32|m>>>64-b,p=m<<b-32|x>>>64-b;var H=u[l[S]];H.high=v,H.low=p}var z=u[0],A=e[0];z.high=A.high,z.low=A.low;for(var d=0;d<5;d++)for(var _=0;_<5;_++){var S=d+5*_,a=e[S],C=u[S],D=u[(d+1)%5+5*_],R=u[(d+2)%5+5*_];a.high=C.high^~D.high&R.high,a.low=C.low^~D.low&R.low}var a=e[0],E=f[c];a.high^=E.high,a.low^=E.low}},_doFinalize:function(){var t=this._data,e=t.words,i=(8*this._nDataBytes,8*t.sigBytes),o=32*this.blockSize;e[i>>>5]|=1<<24-i%32,e[(r.ceil((i+1)/o)*o>>>5)-1]|=128,t.sigBytes=4*e.length,this._process();for(var s=this._state,a=this.cfg.outputLength/8,c=a/8,h=[],l=0;l<c;l++){var f=s[l],u=f.high,d=f.low;u=16711935&(u<<8|u>>>24)|4278255360&(u<<24|u>>>8),d=16711935&(d<<8|d>>>24)|4278255360&(d<<24|d>>>8),h.push(d),h.push(u)}return new n.init(h,a)},clone:function(){for(var t=o.clone.call(this),r=t._state=this._state.slice(0),e=0;e<25;e++)r[e]=r[e].clone();return t}});e.SHA3=o._createHelper(d),e.HmacSHA3=o._createHmacHelper(d)}(Math),function(){function r(){return s.create.apply(s,arguments)}var e=t,i=e.lib,n=i.Hasher,o=e.x64,s=o.Word,a=o.WordArray,c=e.algo,h=[r(1116352408,3609767458),r(1899447441,602891725),r(3049323471,3964484399),r(3921009573,2173295548),r(961987163,4081628472),r(1508970993,3053834265),r(2453635748,2937671579),r(2870763221,3664609560),r(3624381080,2734883394),r(310598401,1164996542),r(607225278,1323610764),r(1426881987,3590304994),r(1925078388,4068182383),r(2162078206,991336113),r(2614888103,633803317),r(3248222580,3479774868),r(3835390401,2666613458),r(4022224774,944711139),r(264347078,2341262773),r(604807628,2007800933),r(770255983,1495990901),r(1249150122,1856431235),r(1555081692,3175218132),r(1996064986,2198950837),r(2554220882,3999719339),r(2821834349,766784016),r(2952996808,2566594879),r(3210313671,3203337956),r(3336571891,1034457026),r(3584528711,2466948901),r(113926993,3758326383),r(338241895,168717936),r(666307205,1188179964),r(773529912,1546045734),r(1294757372,1522805485),r(1396182291,2643833823),r(1695183700,2343527390),r(1986661051,1014477480),r(2177026350,1206759142),r(2456956037,344077627),r(2730485921,1290863460),r(2820302411,3158454273),r(3259730800,3505952657),r(3345764771,106217008),r(3516065817,3606008344),r(3600352804,1432725776),r(4094571909,1467031594),r(275423344,851169720),r(430227734,3100823752),r(506948616,1363258195),r(659060556,3750685593),r(883997877,3785050280),r(958139571,3318307427),r(1322822218,3812723403),r(1537002063,2003034995),r(1747873779,3602036899),r(1955562222,1575990012),r(2024104815,1125592928),r(2227730452,2716904306),r(2361852424,442776044),r(2428436474,593698344),r(2756734187,3733110249),r(3204031479,2999351573),r(3329325298,3815920427),r(3391569614,3928383900),r(3515267271,566280711),r(3940187606,3454069534),r(4118630271,4000239992),r(116418474,1914138554),r(174292421,2731055270),r(289380356,3203993006),r(460393269,320620315),r(685471733,587496836),r(852142971,1086792851),r(1017036298,365543100),r(1126000580,2618297676),r(1288033470,3409855158),r(1501505948,4234509866),r(1607167915,987167468),r(1816402316,1246189591)],l=[];!function(){for(var t=0;t<80;t++)l[t]=r()}();var f=c.SHA512=n.extend({_doReset:function(){this._hash=new a.init([new s.init(1779033703,4089235720),new s.init(3144134277,2227873595),new s.init(1013904242,4271175723),new s.init(2773480762,1595750129),new s.init(1359893119,2917565137),new s.init(2600822924,725511199),new s.init(528734635,4215389547),new s.init(1541459225,327033209)])},_doProcessBlock:function(t,r){for(var e=this._hash.words,i=e[0],n=e[1],o=e[2],s=e[3],a=e[4],c=e[5],f=e[6],u=e[7],d=i.high,v=i.low,p=n.high,_=n.low,y=o.high,g=o.low,B=s.high,w=s.low,k=a.high,S=a.low,m=c.high,x=c.low,b=f.high,H=f.low,z=u.high,A=u.low,C=d,D=v,R=p,E=_,M=y,F=g,P=B,W=w,O=k,U=S,I=m,K=x,X=b,L=H,j=z,N=A,T=0;T<80;T++){var Z=l[T];if(T<16)var q=Z.high=0|t[r+2*T],G=Z.low=0|t[r+2*T+1];else{var J=l[T-15],$=J.high,Q=J.low,V=($>>>1|Q<<31)^($>>>8|Q<<24)^$>>>7,Y=(Q>>>1|$<<31)^(Q>>>8|$<<24)^(Q>>>7|$<<25),tt=l[T-2],rt=tt.high,et=tt.low,it=(rt>>>19|et<<13)^(rt<<3|et>>>29)^rt>>>6,nt=(et>>>19|rt<<13)^(et<<3|rt>>>29)^(et>>>6|rt<<26),ot=l[T-7],st=ot.high,at=ot.low,ct=l[T-16],ht=ct.high,lt=ct.low,G=Y+at,q=V+st+(G>>>0<Y>>>0?1:0),G=G+nt,q=q+it+(G>>>0<nt>>>0?1:0),G=G+lt,q=q+ht+(G>>>0<lt>>>0?1:0);Z.high=q,Z.low=G}var ft=O&I^~O&X,ut=U&K^~U&L,dt=C&R^C&M^R&M,vt=D&E^D&F^E&F,pt=(C>>>28|D<<4)^(C<<30|D>>>2)^(C<<25|D>>>7),_t=(D>>>28|C<<4)^(D<<30|C>>>2)^(D<<25|C>>>7),yt=(O>>>14|U<<18)^(O>>>18|U<<14)^(O<<23|U>>>9),gt=(U>>>14|O<<18)^(U>>>18|O<<14)^(U<<23|O>>>9),Bt=h[T],wt=Bt.high,kt=Bt.low,St=N+gt,mt=j+yt+(St>>>0<N>>>0?1:0),St=St+ut,mt=mt+ft+(St>>>0<ut>>>0?1:0),St=St+kt,mt=mt+wt+(St>>>0<kt>>>0?1:0),St=St+G,mt=mt+q+(St>>>0<G>>>0?1:0),xt=_t+vt,bt=pt+dt+(xt>>>0<_t>>>0?1:0);j=X,N=L,X=I,L=K,I=O,K=U,U=W+St|0,O=P+mt+(U>>>0<W>>>0?1:0)|0,P=M,W=F,M=R,F=E,R=C,E=D,D=St+xt|0,C=mt+bt+(D>>>0<St>>>0?1:0)|0}v=i.low=v+D,i.high=d+C+(v>>>0<D>>>0?1:0),_=n.low=_+E,n.high=p+R+(_>>>0<E>>>0?1:0),g=o.low=g+F,o.high=y+M+(g>>>0<F>>>0?1:0),w=s.low=w+W,s.high=B+P+(w>>>0<W>>>0?1:0),S=a.low=S+U,a.high=k+O+(S>>>0<U>>>0?1:0),x=c.low=x+K,c.high=m+I+(x>>>0<K>>>0?1:0),H=f.low=H+L,f.high=b+X+(H>>>0<L>>>0?1:0),A=u.low=A+N,u.high=z+j+(A>>>0<N>>>0?1:0)},_doFinalize:function(){var t=this._data,r=t.words,e=8*this._nDataBytes,i=8*t.sigBytes;r[i>>>5]|=128<<24-i%32,r[(i+128>>>10<<5)+30]=Math.floor(e/4294967296),r[(i+128>>>10<<5)+31]=e,t.sigBytes=4*r.length,this._process();var n=this._hash.toX32();return n},clone:function(){var t=n.clone.call(this);return t._hash=this._hash.clone(),t},blockSize:32});e.SHA512=n._createHelper(f),e.HmacSHA512=n._createHmacHelper(f)}(),function(){var r=t,e=r.x64,i=e.Word,n=e.WordArray,o=r.algo,s=o.SHA512,a=o.SHA384=s.extend({_doReset:function(){this._hash=new n.init([new i.init(3418070365,3238371032),new i.init(1654270250,914150663),new i.init(2438529370,812702999),new i.init(355462360,4144912697),new i.init(1731405415,4290775857),new i.init(2394180231,1750603025),new i.init(3675008525,1694076839),new i.init(1203062813,3204075428)])},_doFinalize:function(){var t=s._doFinalize.call(this);return t.sigBytes-=16,t}});r.SHA384=s._createHelper(a),r.HmacSHA384=s._createHmacHelper(a)}(),t.lib.Cipher||function(r){var e=t,i=e.lib,n=i.Base,o=i.WordArray,s=i.BufferedBlockAlgorithm,a=e.enc,c=(a.Utf8,a.Base64),h=e.algo,l=h.EvpKDF,f=i.Cipher=s.extend({cfg:n.extend(),createEncryptor:function(t,r){return this.create(this._ENC_XFORM_MODE,t,r)},createDecryptor:function(t,r){return this.create(this._DEC_XFORM_MODE,t,r)},init:function(t,r,e){this.cfg=this.cfg.extend(e),this._xformMode=t,this._key=r,this.reset()},reset:function(){s.reset.call(this),this._doReset()},process:function(t){return this._append(t),this._process()},finalize:function(t){t&&this._append(t);var r=this._doFinalize();return r},keySize:4,ivSize:4,_ENC_XFORM_MODE:1,_DEC_XFORM_MODE:2,_createHelper:function(){function t(t){return"string"==typeof t?m:w}return function(r){return{encrypt:function(e,i,n){return t(i).encrypt(r,e,i,n)},decrypt:function(e,i,n){return t(i).decrypt(r,e,i,n)}}}}()}),u=(i.StreamCipher=f.extend({_doFinalize:function(){var t=this._process(!0);return t},blockSize:1}),e.mode={}),d=i.BlockCipherMode=n.extend({createEncryptor:function(t,r){return this.Encryptor.create(t,r)},createDecryptor:function(t,r){return this.Decryptor.create(t,r)},init:function(t,r){this._cipher=t,this._iv=r}}),v=u.CBC=function(){function t(t,e,i){var n=this._iv;if(n){var o=n;this._iv=r}else var o=this._prevBlock;for(var s=0;s<i;s++)t[e+s]^=o[s]}var e=d.extend();return e.Encryptor=e.extend({processBlock:function(r,e){var i=this._cipher,n=i.blockSize;t.call(this,r,e,n),i.encryptBlock(r,e),this._prevBlock=r.slice(e,e+n)}}),e.Decryptor=e.extend({processBlock:function(r,e){var i=this._cipher,n=i.blockSize,o=r.slice(e,e+n);i.decryptBlock(r,e),t.call(this,r,e,n),this._prevBlock=o}}),e}(),p=e.pad={},_=p.Pkcs7={pad:function(t,r){for(var e=4*r,i=e-t.sigBytes%e,n=i<<24|i<<16|i<<8|i,s=[],a=0;a<i;a+=4)s.push(n);var c=o.create(s,i);t.concat(c)},unpad:function(t){var r=255&t.words[t.sigBytes-1>>>2];t.sigBytes-=r}},y=(i.BlockCipher=f.extend({cfg:f.cfg.extend({mode:v,padding:_}),reset:function(){f.reset.call(this);var t=this.cfg,r=t.iv,e=t.mode;if(this._xformMode==this._ENC_XFORM_MODE)var i=e.createEncryptor;else{var i=e.createDecryptor;this._minBufferSize=1}this._mode&&this._mode.__creator==i?this._mode.init(this,r&&r.words):(this._mode=i.call(e,this,r&&r.words),this._mode.__creator=i)},_doProcessBlock:function(t,r){this._mode.processBlock(t,r)},_doFinalize:function(){var t=this.cfg.padding;if(this._xformMode==this._ENC_XFORM_MODE){t.pad(this._data,this.blockSize);var r=this._process(!0)}else{var r=this._process(!0);t.unpad(r)}return r},blockSize:4}),i.CipherParams=n.extend({init:function(t){this.mixIn(t)},toString:function(t){return(t||this.formatter).stringify(this)}})),g=e.format={},B=g.OpenSSL={stringify:function(t){var r=t.ciphertext,e=t.salt;if(e)var i=o.create([1398893684,1701076831]).concat(e).concat(r);else var i=r;return i.toString(c)},parse:function(t){var r=c.parse(t),e=r.words;if(1398893684==e[0]&&1701076831==e[1]){var i=o.create(e.slice(2,4));e.splice(0,4),r.sigBytes-=16}return y.create({ciphertext:r,salt:i})}},w=i.SerializableCipher=n.extend({cfg:n.extend({format:B}),encrypt:function(t,r,e,i){i=this.cfg.extend(i);var n=t.createEncryptor(e,i),o=n.finalize(r),s=n.cfg;return y.create({ciphertext:o,key:e,iv:s.iv,algorithm:t,mode:s.mode,padding:s.padding,blockSize:t.blockSize,formatter:i.format})},decrypt:function(t,r,e,i){i=this.cfg.extend(i),r=this._parse(r,i.format);var n=t.createDecryptor(e,i).finalize(r.ciphertext);return n},_parse:function(t,r){return"string"==typeof t?r.parse(t,this):t}}),k=e.kdf={},S=k.OpenSSL={execute:function(t,r,e,i){i||(i=o.random(8));var n=l.create({keySize:r+e}).compute(t,i),s=o.create(n.words.slice(r),4*e);return n.sigBytes=4*r,y.create({key:n,iv:s,salt:i})}},m=i.PasswordBasedCipher=w.extend({cfg:w.cfg.extend({kdf:S}),encrypt:function(t,r,e,i){i=this.cfg.extend(i);var n=i.kdf.execute(e,t.keySize,t.ivSize);i.iv=n.iv;var o=w.encrypt.call(this,t,r,n.key,i);return o.mixIn(n),o},decrypt:function(t,r,e,i){i=this.cfg.extend(i),r=this._parse(r,i.format);var n=i.kdf.execute(e,t.keySize,t.ivSize,r.salt);i.iv=n.iv;var o=w.decrypt.call(this,t,r,n.key,i);return o}})}(),t.mode.CFB=function(){function r(t,r,e,i){var n=this._iv;if(n){var o=n.slice(0);this._iv=void 0}else var o=this._prevBlock;i.encryptBlock(o,0);for(var s=0;s<e;s++)t[r+s]^=o[s]}var e=t.lib.BlockCipherMode.extend();return e.Encryptor=e.extend({processBlock:function(t,e){var i=this._cipher,n=i.blockSize;r.call(this,t,e,n,i),this._prevBlock=t.slice(e,e+n)}}),e.Decryptor=e.extend({processBlock:function(t,e){var i=this._cipher,n=i.blockSize,o=t.slice(e,e+n);r.call(this,t,e,n,i),this._prevBlock=o}}),e}(),t.mode.ECB=function(){var r=t.lib.BlockCipherMode.extend();return r.Encryptor=r.extend({processBlock:function(t,r){this._cipher.encryptBlock(t,r)}}),r.Decryptor=r.extend({processBlock:function(t,r){this._cipher.decryptBlock(t,r)}}),r}(),t.pad.AnsiX923={pad:function(t,r){var e=t.sigBytes,i=4*r,n=i-e%i,o=e+n-1;t.clamp(),t.words[o>>>2]|=n<<24-o%4*8,t.sigBytes+=n},unpad:function(t){var r=255&t.words[t.sigBytes-1>>>2];t.sigBytes-=r}},t.pad.Iso10126={pad:function(r,e){var i=4*e,n=i-r.sigBytes%i;r.concat(t.lib.WordArray.random(n-1)).concat(t.lib.WordArray.create([n<<24],1))},unpad:function(t){var r=255&t.words[t.sigBytes-1>>>2];t.sigBytes-=r}},t.pad.Iso97971={pad:function(r,e){r.concat(t.lib.WordArray.create([2147483648],1)),t.pad.ZeroPadding.pad(r,e)},unpad:function(r){t.pad.ZeroPadding.unpad(r),r.sigBytes--}},t.mode.OFB=function(){var r=t.lib.BlockCipherMode.extend(),e=r.Encryptor=r.extend({processBlock:function(t,r){var e=this._cipher,i=e.blockSize,n=this._iv,o=this._keystream;n&&(o=this._keystream=n.slice(0),this._iv=void 0),e.encryptBlock(o,0);for(var s=0;s<i;s++)t[r+s]^=o[s]}});return r.Decryptor=e,r}(),t.pad.NoPadding={pad:function(){},unpad:function(){}},function(r){var e=t,i=e.lib,n=i.CipherParams,o=e.enc,s=o.Hex,a=e.format;a.Hex={stringify:function(t){return t.ciphertext.toString(s)},parse:function(t){var r=s.parse(t);return n.create({ciphertext:r})}}}(),function(){var r=t,e=r.lib,i=e.BlockCipher,n=r.algo,o=[],s=[],a=[],c=[],h=[],l=[],f=[],u=[],d=[],v=[];!function(){for(var t=[],r=0;r<256;r++)r<128?t[r]=r<<1:t[r]=r<<1^283;for(var e=0,i=0,r=0;r<256;r++){var n=i^i<<1^i<<2^i<<3^i<<4;n=n>>>8^255&n^99,o[e]=n,s[n]=e;var p=t[e],_=t[p],y=t[_],g=257*t[n]^16843008*n;a[e]=g<<24|g>>>8,c[e]=g<<16|g>>>16,h[e]=g<<8|g>>>24,l[e]=g;var g=16843009*y^65537*_^257*p^16843008*e;f[n]=g<<24|g>>>8,u[n]=g<<16|g>>>16,d[n]=g<<8|g>>>24,v[n]=g,e?(e=p^t[t[t[y^p]]],i^=t[t[i]]):e=i=1}}();var p=[0,1,2,4,8,16,32,64,128,27,54],_=n.AES=i.extend({_doReset:function(){if(!this._nRounds||this._keyPriorReset!==this._key){for(var t=this._keyPriorReset=this._key,r=t.words,e=t.sigBytes/4,i=this._nRounds=e+6,n=4*(i+1),s=this._keySchedule=[],a=0;a<n;a++)if(a<e)s[a]=r[a];else{var c=s[a-1];a%e?e>6&&a%e==4&&(c=o[c>>>24]<<24|o[c>>>16&255]<<16|o[c>>>8&255]<<8|o[255&c]):(c=c<<8|c>>>24,c=o[c>>>24]<<24|o[c>>>16&255]<<16|o[c>>>8&255]<<8|o[255&c],c^=p[a/e|0]<<24),s[a]=s[a-e]^c}for(var h=this._invKeySchedule=[],l=0;l<n;l++){var a=n-l;if(l%4)var c=s[a];else var c=s[a-4];l<4||a<=4?h[l]=c:h[l]=f[o[c>>>24]]^u[o[c>>>16&255]]^d[o[c>>>8&255]]^v[o[255&c]]}}},encryptBlock:function(t,r){this._doCryptBlock(t,r,this._keySchedule,a,c,h,l,o)},decryptBlock:function(t,r){var e=t[r+1];t[r+1]=t[r+3],t[r+3]=e,this._doCryptBlock(t,r,this._invKeySchedule,f,u,d,v,s);var e=t[r+1];t[r+1]=t[r+3],t[r+3]=e},_doCryptBlock:function(t,r,e,i,n,o,s,a){for(var c=this._nRounds,h=t[r]^e[0],l=t[r+1]^e[1],f=t[r+2]^e[2],u=t[r+3]^e[3],d=4,v=1;v<c;v++){var p=i[h>>>24]^n[l>>>16&255]^o[f>>>8&255]^s[255&u]^e[d++],_=i[l>>>24]^n[f>>>16&255]^o[u>>>8&255]^s[255&h]^e[d++],y=i[f>>>24]^n[u>>>16&255]^o[h>>>8&255]^s[255&l]^e[d++],g=i[u>>>24]^n[h>>>16&255]^o[l>>>8&255]^s[255&f]^e[d++];h=p,l=_,f=y,u=g}var p=(a[h>>>24]<<24|a[l>>>16&255]<<16|a[f>>>8&255]<<8|a[255&u])^e[d++],_=(a[l>>>24]<<24|a[f>>>16&255]<<16|a[u>>>8&255]<<8|a[255&h])^e[d++],y=(a[f>>>24]<<24|a[u>>>16&255]<<16|a[h>>>8&255]<<8|a[255&l])^e[d++],g=(a[u>>>24]<<24|a[h>>>16&255]<<16|a[l>>>8&255]<<8|a[255&f])^e[d++];t[r]=p,t[r+1]=_,t[r+2]=y,t[r+3]=g},keySize:8});r.AES=i._createHelper(_)}(),function(){function r(t,r){var e=(this._lBlock>>>t^this._rBlock)&r;this._rBlock^=e,this._lBlock^=e<<t}function e(t,r){var e=(this._rBlock>>>t^this._lBlock)&r;this._lBlock^=e,this._rBlock^=e<<t;
}var i=t,n=i.lib,o=n.WordArray,s=n.BlockCipher,a=i.algo,c=[57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,27,19,11,3,60,52,44,36,63,55,47,39,31,23,15,7,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,28,20,12,4],h=[14,17,11,24,1,5,3,28,15,6,21,10,23,19,12,4,26,8,16,7,27,20,13,2,41,52,31,37,47,55,30,40,51,45,33,48,44,49,39,56,34,53,46,42,50,36,29,32],l=[1,2,4,6,8,10,12,14,15,17,19,21,23,25,27,28],f=[{0:8421888,268435456:32768,536870912:8421378,805306368:2,1073741824:512,1342177280:8421890,1610612736:8389122,1879048192:8388608,2147483648:514,2415919104:8389120,2684354560:33280,2952790016:8421376,3221225472:32770,3489660928:8388610,3758096384:0,4026531840:33282,134217728:0,402653184:8421890,671088640:33282,939524096:32768,1207959552:8421888,1476395008:512,1744830464:8421378,2013265920:2,2281701376:8389120,2550136832:33280,2818572288:8421376,3087007744:8389122,3355443200:8388610,3623878656:32770,3892314112:514,4160749568:8388608,1:32768,268435457:2,536870913:8421888,805306369:8388608,1073741825:8421378,1342177281:33280,1610612737:512,1879048193:8389122,2147483649:8421890,2415919105:8421376,2684354561:8388610,2952790017:33282,3221225473:514,3489660929:8389120,3758096385:32770,4026531841:0,134217729:8421890,402653185:8421376,671088641:8388608,939524097:512,1207959553:32768,1476395009:8388610,1744830465:2,2013265921:33282,2281701377:32770,2550136833:8389122,2818572289:514,3087007745:8421888,3355443201:8389120,3623878657:0,3892314113:33280,4160749569:8421378},{0:1074282512,16777216:16384,33554432:524288,50331648:1074266128,67108864:1073741840,83886080:1074282496,100663296:1073758208,117440512:16,134217728:540672,150994944:1073758224,167772160:1073741824,184549376:540688,201326592:524304,218103808:0,234881024:16400,251658240:1074266112,8388608:1073758208,25165824:540688,41943040:16,58720256:1073758224,75497472:1074282512,92274688:1073741824,109051904:524288,125829120:1074266128,142606336:524304,159383552:0,176160768:16384,192937984:1074266112,209715200:1073741840,226492416:540672,243269632:1074282496,260046848:16400,268435456:0,285212672:1074266128,301989888:1073758224,318767104:1074282496,335544320:1074266112,352321536:16,369098752:540688,385875968:16384,402653184:16400,419430400:524288,436207616:524304,452984832:1073741840,469762048:540672,486539264:1073758208,503316480:1073741824,520093696:1074282512,276824064:540688,293601280:524288,310378496:1074266112,327155712:16384,343932928:1073758208,360710144:1074282512,377487360:16,394264576:1073741824,411041792:1074282496,427819008:1073741840,444596224:1073758224,461373440:524304,478150656:0,494927872:16400,511705088:1074266128,528482304:540672},{0:260,1048576:0,2097152:67109120,3145728:65796,4194304:65540,5242880:67108868,6291456:67174660,7340032:67174400,8388608:67108864,9437184:67174656,10485760:65792,11534336:67174404,12582912:67109124,13631488:65536,14680064:4,15728640:256,524288:67174656,1572864:67174404,2621440:0,3670016:67109120,4718592:67108868,5767168:65536,6815744:65540,7864320:260,8912896:4,9961472:256,11010048:67174400,12058624:65796,13107200:65792,14155776:67109124,15204352:67174660,16252928:67108864,16777216:67174656,17825792:65540,18874368:65536,19922944:67109120,20971520:256,22020096:67174660,23068672:67108868,24117248:0,25165824:67109124,26214400:67108864,27262976:4,28311552:65792,29360128:67174400,30408704:260,31457280:65796,32505856:67174404,17301504:67108864,18350080:260,19398656:67174656,20447232:0,21495808:65540,22544384:67109120,23592960:256,24641536:67174404,25690112:65536,26738688:67174660,27787264:65796,28835840:67108868,29884416:67109124,30932992:67174400,31981568:4,33030144:65792},{0:2151682048,65536:2147487808,131072:4198464,196608:2151677952,262144:0,327680:4198400,393216:2147483712,458752:4194368,524288:2147483648,589824:4194304,655360:64,720896:2147487744,786432:2151678016,851968:4160,917504:4096,983040:2151682112,32768:2147487808,98304:64,163840:2151678016,229376:2147487744,294912:4198400,360448:2151682112,425984:0,491520:2151677952,557056:4096,622592:2151682048,688128:4194304,753664:4160,819200:2147483648,884736:4194368,950272:4198464,1015808:2147483712,1048576:4194368,1114112:4198400,1179648:2147483712,1245184:0,1310720:4160,1376256:2151678016,1441792:2151682048,1507328:2147487808,1572864:2151682112,1638400:2147483648,1703936:2151677952,1769472:4198464,1835008:2147487744,1900544:4194304,1966080:64,2031616:4096,1081344:2151677952,1146880:2151682112,1212416:0,1277952:4198400,1343488:4194368,1409024:2147483648,1474560:2147487808,1540096:64,1605632:2147483712,1671168:4096,1736704:2147487744,1802240:2151678016,1867776:4160,1933312:2151682048,1998848:4194304,2064384:4198464},{0:128,4096:17039360,8192:262144,12288:536870912,16384:537133184,20480:16777344,24576:553648256,28672:262272,32768:16777216,36864:537133056,40960:536871040,45056:553910400,49152:553910272,53248:0,57344:17039488,61440:553648128,2048:17039488,6144:553648256,10240:128,14336:17039360,18432:262144,22528:537133184,26624:553910272,30720:536870912,34816:537133056,38912:0,43008:553910400,47104:16777344,51200:536871040,55296:553648128,59392:16777216,63488:262272,65536:262144,69632:128,73728:536870912,77824:553648256,81920:16777344,86016:553910272,90112:537133184,94208:16777216,98304:553910400,102400:553648128,106496:17039360,110592:537133056,114688:262272,118784:536871040,122880:0,126976:17039488,67584:553648256,71680:16777216,75776:17039360,79872:537133184,83968:536870912,88064:17039488,92160:128,96256:553910272,100352:262272,104448:553910400,108544:0,112640:553648128,116736:16777344,120832:262144,124928:537133056,129024:536871040},{0:268435464,256:8192,512:270532608,768:270540808,1024:268443648,1280:2097152,1536:2097160,1792:268435456,2048:0,2304:268443656,2560:2105344,2816:8,3072:270532616,3328:2105352,3584:8200,3840:270540800,128:270532608,384:270540808,640:8,896:2097152,1152:2105352,1408:268435464,1664:268443648,1920:8200,2176:2097160,2432:8192,2688:268443656,2944:270532616,3200:0,3456:270540800,3712:2105344,3968:268435456,4096:268443648,4352:270532616,4608:270540808,4864:8200,5120:2097152,5376:268435456,5632:268435464,5888:2105344,6144:2105352,6400:0,6656:8,6912:270532608,7168:8192,7424:268443656,7680:270540800,7936:2097160,4224:8,4480:2105344,4736:2097152,4992:268435464,5248:268443648,5504:8200,5760:270540808,6016:270532608,6272:270540800,6528:270532616,6784:8192,7040:2105352,7296:2097160,7552:0,7808:268435456,8064:268443656},{0:1048576,16:33555457,32:1024,48:1049601,64:34604033,80:0,96:1,112:34603009,128:33555456,144:1048577,160:33554433,176:34604032,192:34603008,208:1025,224:1049600,240:33554432,8:34603009,24:0,40:33555457,56:34604032,72:1048576,88:33554433,104:33554432,120:1025,136:1049601,152:33555456,168:34603008,184:1048577,200:1024,216:34604033,232:1,248:1049600,256:33554432,272:1048576,288:33555457,304:34603009,320:1048577,336:33555456,352:34604032,368:1049601,384:1025,400:34604033,416:1049600,432:1,448:0,464:34603008,480:33554433,496:1024,264:1049600,280:33555457,296:34603009,312:1,328:33554432,344:1048576,360:1025,376:34604032,392:33554433,408:34603008,424:0,440:34604033,456:1049601,472:1024,488:33555456,504:1048577},{0:134219808,1:131072,2:134217728,3:32,4:131104,5:134350880,6:134350848,7:2048,8:134348800,9:134219776,10:133120,11:134348832,12:2080,13:0,14:134217760,15:133152,2147483648:2048,2147483649:134350880,2147483650:134219808,2147483651:134217728,2147483652:134348800,2147483653:133120,2147483654:133152,2147483655:32,2147483656:134217760,2147483657:2080,2147483658:131104,2147483659:134350848,2147483660:0,2147483661:134348832,2147483662:134219776,2147483663:131072,16:133152,17:134350848,18:32,19:2048,20:134219776,21:134217760,22:134348832,23:131072,24:0,25:131104,26:134348800,27:134219808,28:134350880,29:133120,30:2080,31:134217728,2147483664:131072,2147483665:2048,2147483666:134348832,2147483667:133152,2147483668:32,2147483669:134348800,2147483670:134217728,2147483671:134219808,2147483672:134350880,2147483673:134217760,2147483674:134219776,2147483675:0,2147483676:133120,2147483677:2080,2147483678:131104,2147483679:134350848}],u=[4160749569,528482304,33030144,2064384,129024,8064,504,2147483679],d=a.DES=s.extend({_doReset:function(){for(var t=this._key,r=t.words,e=[],i=0;i<56;i++){var n=c[i]-1;e[i]=r[n>>>5]>>>31-n%32&1}for(var o=this._subKeys=[],s=0;s<16;s++){for(var a=o[s]=[],f=l[s],i=0;i<24;i++)a[i/6|0]|=e[(h[i]-1+f)%28]<<31-i%6,a[4+(i/6|0)]|=e[28+(h[i+24]-1+f)%28]<<31-i%6;a[0]=a[0]<<1|a[0]>>>31;for(var i=1;i<7;i++)a[i]=a[i]>>>4*(i-1)+3;a[7]=a[7]<<5|a[7]>>>27}for(var u=this._invSubKeys=[],i=0;i<16;i++)u[i]=o[15-i]},encryptBlock:function(t,r){this._doCryptBlock(t,r,this._subKeys)},decryptBlock:function(t,r){this._doCryptBlock(t,r,this._invSubKeys)},_doCryptBlock:function(t,i,n){this._lBlock=t[i],this._rBlock=t[i+1],r.call(this,4,252645135),r.call(this,16,65535),e.call(this,2,858993459),e.call(this,8,16711935),r.call(this,1,1431655765);for(var o=0;o<16;o++){for(var s=n[o],a=this._lBlock,c=this._rBlock,h=0,l=0;l<8;l++)h|=f[l][((c^s[l])&u[l])>>>0];this._lBlock=c,this._rBlock=a^h}var d=this._lBlock;this._lBlock=this._rBlock,this._rBlock=d,r.call(this,1,1431655765),e.call(this,8,16711935),e.call(this,2,858993459),r.call(this,16,65535),r.call(this,4,252645135),t[i]=this._lBlock,t[i+1]=this._rBlock},keySize:2,ivSize:2,blockSize:2});i.DES=s._createHelper(d);var v=a.TripleDES=s.extend({_doReset:function(){var t=this._key,r=t.words;this._des1=d.createEncryptor(o.create(r.slice(0,2))),this._des2=d.createEncryptor(o.create(r.slice(2,4))),this._des3=d.createEncryptor(o.create(r.slice(4,6)))},encryptBlock:function(t,r){this._des1.encryptBlock(t,r),this._des2.decryptBlock(t,r),this._des3.encryptBlock(t,r)},decryptBlock:function(t,r){this._des3.decryptBlock(t,r),this._des2.encryptBlock(t,r),this._des1.decryptBlock(t,r)},keySize:6,ivSize:2,blockSize:2});i.TripleDES=s._createHelper(v)}(),function(){function r(){for(var t=this._S,r=this._i,e=this._j,i=0,n=0;n<4;n++){r=(r+1)%256,e=(e+t[r])%256;var o=t[r];t[r]=t[e],t[e]=o,i|=t[(t[r]+t[e])%256]<<24-8*n}return this._i=r,this._j=e,i}var e=t,i=e.lib,n=i.StreamCipher,o=e.algo,s=o.RC4=n.extend({_doReset:function(){for(var t=this._key,r=t.words,e=t.sigBytes,i=this._S=[],n=0;n<256;n++)i[n]=n;for(var n=0,o=0;n<256;n++){var s=n%e,a=r[s>>>2]>>>24-s%4*8&255;o=(o+i[n]+a)%256;var c=i[n];i[n]=i[o],i[o]=c}this._i=this._j=0},_doProcessBlock:function(t,e){t[e]^=r.call(this)},keySize:8,ivSize:0});e.RC4=n._createHelper(s);var a=o.RC4Drop=s.extend({cfg:s.cfg.extend({drop:192}),_doReset:function(){s._doReset.call(this);for(var t=this.cfg.drop;t>0;t--)r.call(this)}});e.RC4Drop=n._createHelper(a)}(),t.mode.CTRGladman=function(){function r(t){if(255===(t>>24&255)){var r=t>>16&255,e=t>>8&255,i=255&t;255===r?(r=0,255===e?(e=0,255===i?i=0:++i):++e):++r,t=0,t+=r<<16,t+=e<<8,t+=i}else t+=1<<24;return t}function e(t){return 0===(t[0]=r(t[0]))&&(t[1]=r(t[1])),t}var i=t.lib.BlockCipherMode.extend(),n=i.Encryptor=i.extend({processBlock:function(t,r){var i=this._cipher,n=i.blockSize,o=this._iv,s=this._counter;o&&(s=this._counter=o.slice(0),this._iv=void 0),e(s);var a=s.slice(0);i.encryptBlock(a,0);for(var c=0;c<n;c++)t[r+c]^=a[c]}});return i.Decryptor=n,i}(),function(){function r(){for(var t=this._X,r=this._C,e=0;e<8;e++)a[e]=r[e];r[0]=r[0]+1295307597+this._b|0,r[1]=r[1]+3545052371+(r[0]>>>0<a[0]>>>0?1:0)|0,r[2]=r[2]+886263092+(r[1]>>>0<a[1]>>>0?1:0)|0,r[3]=r[3]+1295307597+(r[2]>>>0<a[2]>>>0?1:0)|0,r[4]=r[4]+3545052371+(r[3]>>>0<a[3]>>>0?1:0)|0,r[5]=r[5]+886263092+(r[4]>>>0<a[4]>>>0?1:0)|0,r[6]=r[6]+1295307597+(r[5]>>>0<a[5]>>>0?1:0)|0,r[7]=r[7]+3545052371+(r[6]>>>0<a[6]>>>0?1:0)|0,this._b=r[7]>>>0<a[7]>>>0?1:0;for(var e=0;e<8;e++){var i=t[e]+r[e],n=65535&i,o=i>>>16,s=((n*n>>>17)+n*o>>>15)+o*o,h=((4294901760&i)*i|0)+((65535&i)*i|0);c[e]=s^h}t[0]=c[0]+(c[7]<<16|c[7]>>>16)+(c[6]<<16|c[6]>>>16)|0,t[1]=c[1]+(c[0]<<8|c[0]>>>24)+c[7]|0,t[2]=c[2]+(c[1]<<16|c[1]>>>16)+(c[0]<<16|c[0]>>>16)|0,t[3]=c[3]+(c[2]<<8|c[2]>>>24)+c[1]|0,t[4]=c[4]+(c[3]<<16|c[3]>>>16)+(c[2]<<16|c[2]>>>16)|0,t[5]=c[5]+(c[4]<<8|c[4]>>>24)+c[3]|0,t[6]=c[6]+(c[5]<<16|c[5]>>>16)+(c[4]<<16|c[4]>>>16)|0,t[7]=c[7]+(c[6]<<8|c[6]>>>24)+c[5]|0}var e=t,i=e.lib,n=i.StreamCipher,o=e.algo,s=[],a=[],c=[],h=o.Rabbit=n.extend({_doReset:function(){for(var t=this._key.words,e=this.cfg.iv,i=0;i<4;i++)t[i]=16711935&(t[i]<<8|t[i]>>>24)|4278255360&(t[i]<<24|t[i]>>>8);var n=this._X=[t[0],t[3]<<16|t[2]>>>16,t[1],t[0]<<16|t[3]>>>16,t[2],t[1]<<16|t[0]>>>16,t[3],t[2]<<16|t[1]>>>16],o=this._C=[t[2]<<16|t[2]>>>16,4294901760&t[0]|65535&t[1],t[3]<<16|t[3]>>>16,4294901760&t[1]|65535&t[2],t[0]<<16|t[0]>>>16,4294901760&t[2]|65535&t[3],t[1]<<16|t[1]>>>16,4294901760&t[3]|65535&t[0]];this._b=0;for(var i=0;i<4;i++)r.call(this);for(var i=0;i<8;i++)o[i]^=n[i+4&7];if(e){var s=e.words,a=s[0],c=s[1],h=16711935&(a<<8|a>>>24)|4278255360&(a<<24|a>>>8),l=16711935&(c<<8|c>>>24)|4278255360&(c<<24|c>>>8),f=h>>>16|4294901760&l,u=l<<16|65535&h;o[0]^=h,o[1]^=f,o[2]^=l,o[3]^=u,o[4]^=h,o[5]^=f,o[6]^=l,o[7]^=u;for(var i=0;i<4;i++)r.call(this)}},_doProcessBlock:function(t,e){var i=this._X;r.call(this),s[0]=i[0]^i[5]>>>16^i[3]<<16,s[1]=i[2]^i[7]>>>16^i[5]<<16,s[2]=i[4]^i[1]>>>16^i[7]<<16,s[3]=i[6]^i[3]>>>16^i[1]<<16;for(var n=0;n<4;n++)s[n]=16711935&(s[n]<<8|s[n]>>>24)|4278255360&(s[n]<<24|s[n]>>>8),t[e+n]^=s[n]},blockSize:4,ivSize:2});e.Rabbit=n._createHelper(h)}(),t.mode.CTR=function(){var r=t.lib.BlockCipherMode.extend(),e=r.Encryptor=r.extend({processBlock:function(t,r){var e=this._cipher,i=e.blockSize,n=this._iv,o=this._counter;n&&(o=this._counter=n.slice(0),this._iv=void 0);var s=o.slice(0);e.encryptBlock(s,0),o[i-1]=o[i-1]+1|0;for(var a=0;a<i;a++)t[r+a]^=s[a]}});return r.Decryptor=e,r}(),function(){function r(){for(var t=this._X,r=this._C,e=0;e<8;e++)a[e]=r[e];r[0]=r[0]+1295307597+this._b|0,r[1]=r[1]+3545052371+(r[0]>>>0<a[0]>>>0?1:0)|0,r[2]=r[2]+886263092+(r[1]>>>0<a[1]>>>0?1:0)|0,r[3]=r[3]+1295307597+(r[2]>>>0<a[2]>>>0?1:0)|0,r[4]=r[4]+3545052371+(r[3]>>>0<a[3]>>>0?1:0)|0,r[5]=r[5]+886263092+(r[4]>>>0<a[4]>>>0?1:0)|0,r[6]=r[6]+1295307597+(r[5]>>>0<a[5]>>>0?1:0)|0,r[7]=r[7]+3545052371+(r[6]>>>0<a[6]>>>0?1:0)|0,this._b=r[7]>>>0<a[7]>>>0?1:0;for(var e=0;e<8;e++){var i=t[e]+r[e],n=65535&i,o=i>>>16,s=((n*n>>>17)+n*o>>>15)+o*o,h=((4294901760&i)*i|0)+((65535&i)*i|0);c[e]=s^h}t[0]=c[0]+(c[7]<<16|c[7]>>>16)+(c[6]<<16|c[6]>>>16)|0,t[1]=c[1]+(c[0]<<8|c[0]>>>24)+c[7]|0,t[2]=c[2]+(c[1]<<16|c[1]>>>16)+(c[0]<<16|c[0]>>>16)|0,t[3]=c[3]+(c[2]<<8|c[2]>>>24)+c[1]|0,t[4]=c[4]+(c[3]<<16|c[3]>>>16)+(c[2]<<16|c[2]>>>16)|0,t[5]=c[5]+(c[4]<<8|c[4]>>>24)+c[3]|0,t[6]=c[6]+(c[5]<<16|c[5]>>>16)+(c[4]<<16|c[4]>>>16)|0,t[7]=c[7]+(c[6]<<8|c[6]>>>24)+c[5]|0}var e=t,i=e.lib,n=i.StreamCipher,o=e.algo,s=[],a=[],c=[],h=o.RabbitLegacy=n.extend({_doReset:function(){var t=this._key.words,e=this.cfg.iv,i=this._X=[t[0],t[3]<<16|t[2]>>>16,t[1],t[0]<<16|t[3]>>>16,t[2],t[1]<<16|t[0]>>>16,t[3],t[2]<<16|t[1]>>>16],n=this._C=[t[2]<<16|t[2]>>>16,4294901760&t[0]|65535&t[1],t[3]<<16|t[3]>>>16,4294901760&t[1]|65535&t[2],t[0]<<16|t[0]>>>16,4294901760&t[2]|65535&t[3],t[1]<<16|t[1]>>>16,4294901760&t[3]|65535&t[0]];this._b=0;for(var o=0;o<4;o++)r.call(this);for(var o=0;o<8;o++)n[o]^=i[o+4&7];if(e){var s=e.words,a=s[0],c=s[1],h=16711935&(a<<8|a>>>24)|4278255360&(a<<24|a>>>8),l=16711935&(c<<8|c>>>24)|4278255360&(c<<24|c>>>8),f=h>>>16|4294901760&l,u=l<<16|65535&h;n[0]^=h,n[1]^=f,n[2]^=l,n[3]^=u,n[4]^=h,n[5]^=f,n[6]^=l,n[7]^=u;for(var o=0;o<4;o++)r.call(this)}},_doProcessBlock:function(t,e){var i=this._X;r.call(this),s[0]=i[0]^i[5]>>>16^i[3]<<16,s[1]=i[2]^i[7]>>>16^i[5]<<16,s[2]=i[4]^i[1]>>>16^i[7]<<16,s[3]=i[6]^i[3]>>>16^i[1]<<16;for(var n=0;n<4;n++)s[n]=16711935&(s[n]<<8|s[n]>>>24)|4278255360&(s[n]<<24|s[n]>>>8),t[e+n]^=s[n]},blockSize:4,ivSize:2});e.RabbitLegacy=n._createHelper(h)}(),t.pad.ZeroPadding={pad:function(t,r){var e=4*r;t.clamp(),t.sigBytes+=e-(t.sigBytes%e||e)},unpad:function(t){for(var r=t.words,e=t.sigBytes-1;!(r[e>>>2]>>>24-e%4*8&255);)e--;t.sigBytes=e+1}},t});
//# sourceMappingURL=crypto-js.min.js.map</script>

<script>
    const errors = [
      'Sorry.',
      'Caps lock?',
      'Try again.',
      'Incorrect.',
      'That’s not right.',
      'Wrong.',
    ];

    var cryptoEngine = ((function(){
  const exports = {};
  
/**
 * Salt and encrypt a msg with a password.
 * Inspired by https://github.com/adonespitogo
 */
function encrypt(msg, hashedPassphrase) {
  var iv = CryptoJS.lib.WordArray.random(128 / 8);

  var encrypted = CryptoJS.AES.encrypt(msg, hashedPassphrase, {
    iv: iv,
    padding: CryptoJS.pad.Pkcs7,
    mode: CryptoJS.mode.CBC,
  });

  // iv will be hex 16 in length (32 characters)
  // we prepend it to the ciphertext for use in decryption
  return iv.toString() + encrypted.toString();
}
exports.encrypt = encrypt;

/**
 * Decrypt a salted msg using a password.
 * Inspired by https://github.com/adonespitogo
 *
 * @param {string} encryptedMsg
 * @param {string} hashedPassphrase
 * @returns {string}
 */
function decrypt(encryptedMsg, hashedPassphrase) {
  var iv = CryptoJS.enc.Hex.parse(encryptedMsg.substr(0, 32));
  var encrypted = encryptedMsg.substring(32);

  return CryptoJS.AES.decrypt(encrypted, hashedPassphrase, {
    iv: iv,
    padding: CryptoJS.pad.Pkcs7,
    mode: CryptoJS.mode.CBC,
  }).toString(CryptoJS.enc.Utf8);
}
exports.decrypt = decrypt;

/**
 * Salt and hash the passphrase so it can be stored in localStorage without opening a password reuse vulnerability.
 *
 * @param {string} passphrase
 * @param {string} salt
 * @returns string
 */
function hashPassphrase(passphrase, salt) {
  // we hash the passphrase in two steps: first 1k iterations, then we add iterations. This is because we used to use 1k,
  // so for backwards compatibility with remember-me/autodecrypt links, we need to support going from that to more
  // iterations
  var hashedPassphrase = hashLegacyRound(passphrase, salt);

  return hashSecondRound(hashedPassphrase, salt);
}
exports.hashPassphrase = hashPassphrase;

/**
 * This hashes the passphrase with 1k iterations. This is a low number, we need this function to support backwards
 * compatibility.
 *
 * @param {string} passphrase
 * @param {string} salt
 * @returns {string}
 */
function hashLegacyRound(passphrase, salt) {
  return CryptoJS.PBKDF2(passphrase, salt, {
    keySize: 256 / 32,
    iterations: 1000,
  }).toString();
}
exports.hashLegacyRound = hashLegacyRound;

/**
 * Add a second round of iterations. This is because we used to use 1k, so for backwards compatibility with
 * remember-me/autodecrypt links, we need to support going from that to more iterations.
 *
 * @param hashedPassphrase
 * @param salt
 * @returns {string}
 */
function hashSecondRound(hashedPassphrase, salt) {
  return CryptoJS.PBKDF2(hashedPassphrase, salt, {
    keySize: 256 / 32,
    iterations: 14000,
    hasher: CryptoJS.algo.SHA256,
  }).toString();
}
exports.hashSecondRound = hashSecondRound;

function generateRandomSalt() {
  return CryptoJS.lib.WordArray.random(128 / 8).toString();
}
exports.generateRandomSalt = generateRandomSalt;

function getRandomAlphanum() {
    var possibleCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    var byteArray;
    var parsedInt;

    // Keep generating new random bytes until we get a value that falls
    // within a range that can be evenly divided by possibleCharacters.length
    do {
        byteArray = CryptoJS.lib.WordArray.random(1);
        // extract the lowest byte to get an int from 0 to 255 (probably unnecessary, since we're only generating 1 byte)
        parsedInt = byteArray.words[0] & 0xff;
    } while (parsedInt >= 256 - (256 % possibleCharacters.length));

    // Take the modulo of the parsed integer to get a random number between 0 and totalLength - 1
    var randomIndex = parsedInt % possibleCharacters.length;

    return possibleCharacters[randomIndex];
}

/**
 * Generate a random string of a given length.
 *
 * @param {int} length
 * @returns {string}
 */
function generateRandomString(length) {
    var randomString = '';

    for (var i = 0; i < length; i++) {
      randomString += getRandomAlphanum();
    }

    return randomString;
}
exports.generateRandomString = generateRandomString;

function signMessage(hashedPassphrase, message) {
  return CryptoJS.HmacSHA256(
    message,
    CryptoJS.SHA256(hashedPassphrase).toString()
  ).toString();
}
exports.signMessage = signMessage;

  return exports;
})())
    var codec = ((function(){
  const exports = {};
  /**
 * Initialize the codec with the provided cryptoEngine - this return functions to encode and decode messages.
 *
 * @param cryptoEngine - the engine to use for encryption / decryption
 */
function init(cryptoEngine) {
  // TODO: remove on next major version bump. This is a hack to make the salt available in all functions here in a
  //  backward compatible way (not requiring to  change the password_template).
  const backwardCompatibleSalt = 'a881887e30ba1a1360b2b3ff9f79821f';

  const exports = {};

  /**
   * Top-level function for encoding a message.
   * Includes password hashing, encryption, and signing.
   *
   * @param {string} msg
   * @param {string} password
   * @param {string} salt
   * @param {boolean} isLegacy - whether to use the legacy hashing algorithm (1k iterations) or not
   *
   * @returns {string} The encoded text
   */
  function encode(msg, password, salt, isLegacy = false) {
    // TODO: remove in the next major version bump. This is to not break backwards compatibility with the old way of hashing
    const hashedPassphrase = isLegacy
        ? cryptoEngine.hashLegacyRound(password, salt)
        : cryptoEngine.hashPassphrase(password, salt);
    const encrypted = cryptoEngine.encrypt(msg, hashedPassphrase);
    // we use the hashed password in the HMAC because this is effectively what will be used a password (so we can store
    // it in localStorage safely, we don't use the clear text password)
    const hmac = cryptoEngine.signMessage(hashedPassphrase, encrypted);

    return hmac + encrypted;
  }
  exports.encode = encode;

  /**
   * Top-level function for decoding a message.
   * Includes signature check and decryption.
   *
   * @param {string} signedMsg
   * @param {string} hashedPassphrase
   * @param {string} backwardCompatibleHashedPassword
   *
   * @returns {Object} {success: true, decoded: string} | {success: false, message: string}
   */
  function decode(signedMsg, hashedPassphrase, backwardCompatibleHashedPassword = '') {
    const encryptedHMAC = signedMsg.substring(0, 64);
    const encryptedMsg = signedMsg.substring(64);
    const decryptedHMAC = cryptoEngine.signMessage(hashedPassphrase, encryptedMsg);

    if (decryptedHMAC !== encryptedHMAC) {
      // TODO: remove in next major version bump. This is to not break backwards compatibility with the old 1k
      //  iterations in PBKDF2 - if the key we try isn't working, it might be because it's a remember-me/autodecrypt
      //  link key, generated with 1k iterations. Try again with the updated iteration count.
      if (!backwardCompatibleHashedPassword) {
        return decode(
            signedMsg,
            cryptoEngine.hashSecondRound(hashedPassphrase, backwardCompatibleSalt),
            hashedPassphrase
        );
      }

      return { success: false, message: "Signature mismatch" };
    }

    // TODO: remove in next major version bump. If we're trying to double hash for backward compatibility reasons,
    //  and the attempt is successful, we check if we should update the stored password in localStorage. This avoids
    //  having to compute the upgrade each time.
    if (backwardCompatibleHashedPassword) {
      if (window && window.localStorage) {
        const storedPassword = window.localStorage.getItem('staticrypt_passphrase');

        // check the stored password is actually the backward compatible one, so we don't save the new one and trigger
        // the "remember-me" by mistake, leaking the password
        if (storedPassword === backwardCompatibleHashedPassword) {
          window.localStorage.setItem('staticrypt_passphrase', hashedPassphrase);
        }
      }
    }

    return {
      success: true,
      decoded: cryptoEngine.decrypt(encryptedMsg, hashedPassphrase),
    };
  }
  exports.decode = decode;

  return exports;
}
exports.init = init;

  return exports;
})())
    var decode = codec.init(cryptoEngine).decode;

    // variables to be filled when generating the file
    var encryptedMsg = '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',
        salt = 'a881887e30ba1a1360b2b3ff9f79821f',
        labelError = 'Sorry, Ella says no. Try again.',
        isRememberEnabled = true,
        rememberDurationInDays = 0; // 0 means forever

    // constants
    var rememberPassphraseKey = 'staticrypt_passphrase',
        rememberExpirationKey = 'staticrypt_expiration';

    /**
     * Decrypt our encrypted page, replace the whole HTML.
     *
     * @param  hashedPassphrase
     * @returns 
     */
    function decryptAndReplaceHtml(hashedPassphrase) {
        var result = decode(encryptedMsg, hashedPassphrase);
        if (!result.success) {
            return false;
        }
        var plainHTML = result.decoded;

        document.write(plainHTML);
        document.close();
        return true;
    }

    /**
     * Clear localstorage from staticrypt related values
     */
    function clearLocalStorage() {
        localStorage.removeItem(rememberPassphraseKey);
        localStorage.removeItem(rememberExpirationKey);
    }

    /**
     * To be called on load: check if we want to try to decrypt and replace the HTML with the decrypted content, and
     * try to do it if needed.
     *
     * @returns  true if we derypted and replaced the whole page, false otherwise
     */
    function decryptOnLoadFromRememberMe() {
        if (!isRememberEnabled) {
            return false;
        }

        // show the remember me checkbox
        document.getElementById('staticrypt-remember-label').classList.remove('hidden');

        // if we are login out, clear the storage and terminate
        var queryParams = new URLSearchParams(window.location.search);

        if (queryParams.has("staticrypt_logout")) {
            clearLocalStorage();
            return false;
        }

        // if there is expiration configured, check if we're not beyond the expiration
        if (rememberDurationInDays && rememberDurationInDays > 0) {
            var expiration = localStorage.getItem(rememberExpirationKey),
                isExpired = expiration && new Date().getTime() > parseInt(expiration);

            if (isExpired) {
                clearLocalStorage();
                return false;
            }
        }

        var hashedPassphrase = localStorage.getItem(rememberPassphraseKey);

        if (hashedPassphrase) {
            // try to decrypt
            var isDecryptionSuccessful = decryptAndReplaceHtml(hashedPassphrase);

            // if the decryption is unsuccessful the password might be wrong - silently clear the saved data and let
            // the user fill the password form again
            if (!isDecryptionSuccessful) {
                clearLocalStorage();
                return false;
            }

            return true;
        }

        return false;
    }

    function decryptOnLoadFromQueryParam() {
        var queryParams = new URLSearchParams(window.location.search);
        var hashedPassphrase = queryParams.get("staticrypt_pwd");

        if (hashedPassphrase) {
            return decryptAndReplaceHtml(hashedPassphrase);
        }

        return false;
    }

    // try to automatically decrypt on load if there is a saved password
    window.onload = function () {
        var hasDecrypted = decryptOnLoadFromQueryParam();

        if (!hasDecrypted) {
            hasDecrypted = decryptOnLoadFromRememberMe();
        }

        // if we didn't decrypt anything, show the password prompt. Otherwise the content has already been replaced, no
        // need to do anything
        if (!hasDecrypted) {
            document.getElementById("staticrypt_loading").classList.add("hidden");
            document.getElementById("staticrypt_content").classList.remove("hidden");
            document.getElementById("staticrypt-password").focus();
        }
    }

    // handle password form submission
    document.getElementById('staticrypt-form').addEventListener('submit', function (e) {
        e.preventDefault();

        var passphrase = document.getElementById('staticrypt-password').value,
            shouldRememberPassphrase = document.getElementById('staticrypt-remember').checked;

        // decrypt and replace the whole page
        var hashedPassphrase = cryptoEngine.hashPassphrase(passphrase, salt);
        var isDecryptionSuccessful = decryptAndReplaceHtml(hashedPassphrase);

        if (isDecryptionSuccessful) {
            // remember the hashedPassphrase and set its expiration if necessary
            if (isRememberEnabled && shouldRememberPassphrase) {
                window.localStorage.setItem(rememberPassphraseKey, hashedPassphrase);

                // set the expiration if the duration isn't 0 (meaning no expiration)
                if (rememberDurationInDays > 0) {
                    window.localStorage.setItem(
                        rememberExpirationKey,
                        (new Date().getTime() + rememberDurationInDays * 24 * 60 * 60 * 1000).toString()
                    );
                }
            }
        } else {
            alert(labelError);
        }
    });
</script>
</body>
</html>