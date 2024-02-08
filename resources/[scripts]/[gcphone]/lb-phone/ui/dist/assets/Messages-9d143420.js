var Ue=Object.defineProperty;var Ie=(t,n,d)=>n in t?Ue(t,n,{enumerable:!0,configurable:!0,writable:!0,value:d}):t[n]=d;var J=(t,n,d)=>(Ie(t,typeof n!="symbol"?n+"":n,d),d);import{r as h,j as e,F as te,a as c}from"./jsx-runtime-7cf68bf7.js";import{f as y,b as _,u as Q,l as De,A as Pe,a6 as Le,L as l,e as V,aq as ke,G as ye,i as Ae,Q as ie,x as Z,ar as Me,C as Y,c as ee,as as Re,at as pe,au as Se,d as q,j as B,w as _e,av as fe,aw as $e,a as x,ax as Ve,E as Ee,z as Fe,B as Ye,m as le,ay as ce,ab as je,ag as xe,az as He,ai as Be,aj as Xe,aA as qe,a8 as be,ad as W,aB as Qe,aC as We,aD as Ke}from"./PhoneProvider-d476cfa1.js";import{r as ge,f as Ne}from"./number-28525126.js";const ve=(t,n=25,d=7,f=360,r=120)=>new Promise((a,o)=>{let i=document.createElement("canvas");i.width=f,i.height=r;let u=i.getContext("2d");u.fillStyle="#000";let O=new AudioContext;t.arrayBuffer().then(P=>O.decodeAudioData(P)).then(P=>{let G=(i.width-(n-1)*d)/n,U=i.height/2,D=Math.floor(P.length/n),E=P.getChannelData(0);for(let C=0;C<n;C++){let T=1,L=.1;for(let w=0;w<D;w++){let p=E[C*D+w];p<T&&(T=p),p>L&&(L=p)}let k=(1+T)*U,R=(L-T)*U;u.beginPath(),u.moveTo(C*(G+d),k),u.lineTo(C*(G+d),k+R),u.lineTo(C*(G+d)+G,k+R),u.lineTo(C*(G+d)+G,k),u.closePath(),u.fill()}i.toBlob(C=>a({blob:C,base64:i.toDataURL()}))})});class ze{constructor(){J(this,"recorder");J(this,"chunks");J(this,"mute",()=>{this.recorder&&this.recorder.stream.getTracks().forEach(n=>n.enabled=!1)});J(this,"unmute",()=>{this.recorder&&this.recorder.stream.getTracks().forEach(n=>n.enabled=!0)});this.recorder=null,this.chunks=[]}start(n){this.recorder=new MediaRecorder(n),this.recorder.ondataavailable=d=>this.chunks.push(d.data),this.chunks=[],this.recorder.start(),y("isTalking").then(d=>{d?this.unmute():this.mute()})}stop(){const{recorder:n,chunks:d}=this;return new Promise(f=>{n.onstop=()=>{const r=new Blob(d,{type:n.mimeType}),a=new Audio;a.src=URL.createObjectURL(r);let o={blob:r};ve(r).then(i=>{ve(r,60,7,960,200).then(u=>{o.waveform={message:i.blob,placeholder:u.base64},a.duration===1/0?(a.currentTime=Number.MAX_SAFE_INTEGER,a.ontimeupdate=()=>f({...o,duration:Math.floor(a.duration+.5)})):f({...o,duration:Math.floor(a.duration+.5)})})})},n.stop()})}}function Je(){const{User:t,View:n,UnreadMessages:d}=h.useContext(K),f=_(x.Settings),r=_(x.PhoneNumber),[a,o]=t,[i,u]=n,[O,P]=d,G=_(Y.Emoji),[U,D]=h.useState(!1),[E,C]=h.useState(null),[T,L]=h.useState(!1),[k,R]=h.useState(!1),[w,p]=h.useState(0),[j,H]=h.useState(0),[g,S]=h.useState(!1),[A,b]=h.useState(!1),[N,v]=h.useState([]),[F,se]=h.useState(null),ae=h.useRef(null),[$,z]=h.useState({content:"",attachments:[]}),ne=_(ee);h.useEffect(()=>{y("Messages",{action:"getMessages",page:0,id:a.id}).then(s=>{if(s&&s.length>0){v([...s.reverse()]);let m=document.querySelector(".message-container");m.scrollTop=m.scrollHeight}else S(!0)})},[]);const re=h.useRef(!1),oe=()=>{if($.content.length>0||$.attachments.length>0||F){let s={sender:r,timestamp:Date.now(),id:a.id,content:$.content,attachments:$.attachments};if(f.airplaneMode)return v(m=>[...m,{...s,delivered:!1}]);if(F){if(re.current)return;re.current=!0,Se("Image",F.waves.message).then(m=>{Se("Audio",F.blob).then(M=>{s.content=`<!AUDIO-MESSAGE-IMAGE="${m}"-AUDIO="${M}"-DURATION="${F.duration}"!>`,y("Messages",{action:"sendMessage",number:a.number,content:s.content,id:a.id}).then(I=>{v(I?X=>[...X,s]:X=>[...X,{...s,delivered:!1}]),re.current=!1,se(null)})})});return}if(F)return;y("Messages",{action:"sendMessage",number:a.number,content:$.content,attachments:$.attachments,id:a.id}).then(m=>{m?(v(M=>[...M,s]),se(null)):v(M=>[...M,{...s,delivered:!1}]),z({content:"",attachments:[]}),ae.current&&(ae.current.value=""),q("info","Updating recent message cache state"),B.APPS.MESSAGES.messages.set(B.APPS.MESSAGES.messages.value.map(M=>M.id===a.id?{...M,timestamp:new Date().getTime(),lastMessage:s.content}:M))})}},de=s=>{if(!(!s&&s<=0)){if(s>(ne.MaxTransferAmount??Number.MAX_SAFE_INTEGER))return q("error","Amount is too high");Y.PopUp.set({title:l("APPS.MESSAGES.PAY.SEND_TITLE").format({amount:ne.CurrencyFormat.replace("%s",s.toString())}),description:l("APPS.MESSAGES.PAY.SEND_DESCRIPTION").format({amount:ne.CurrencyFormat.replace("%s",s.toString()),name:a.name??V(a.number)}),buttons:[{title:l("APPS.MESSAGES.PAY.SEND_BUTTON_CANCEL")},{title:l("APPS.MESSAGES.PAY.SEND_BUTTON_SEND"),cb:()=>{y("Wallet",{action:"sendPayment",number:a.number,amount:s}).then(m=>{if(!m.success)return q("error","Failed to send payment");let M={id:a.id,sender:r,content:`<!SENT-PAYMENT-${s}!>`,attachments:[],timestamp:Date.now()};v(I=>[...I,M])})}}]})}},Ce=s=>{if(!s&&s<=0)return;let m={sender:r,content:`<!REQUESTED-PAYMENT-${s}!>`,attachments:[],timestamp:Date.now()};y("Messages",{action:"sendMessage",number:a.number,content:m.content,attachments:[]}).then(M=>{v(M?I=>[...I,m]:I=>[...I,{...m,delivered:!1}])})},me=()=>{Y.PopUp.set({title:l("APPS.MESSAGES.SEND_LOCATION_POPUP.TITLE"),description:l("APPS.MESSAGES.SEND_LOCATION_POPUP.TEXT"),buttons:[{title:l("APPS.MESSAGES.SEND_LOCATION_POPUP.CANCEL")},{title:l("APPS.MESSAGES.SEND_LOCATION_POPUP.SEND"),cb:()=>{y("Maps",{action:"getCurrentLocation"}).then(s=>{if(!s)return;let m={id:a.id,sender:r,content:`<!SENT-LOCATION-X=${ge(s.x,2)}Y=${ge(s.y,2)}!>`,attachments:[],timestamp:Date.now()};y("Messages",{action:"sendMessage",number:a.number,content:m.content,attachments:m.attachments,id:m.id}).then(M=>{v(M?I=>[...I,m]:I=>[...I,{...m,delivered:!1}])})})}}]})},we=()=>{if(g||A)return;let s=document.querySelector("#last");if(!s)return;!_e(s)&&(b(!0),y("Messages",{action:"getMessages",page:j+1,id:a.id}).then(M=>{M&&M.length>0?(v([...M.reverse(),...N]),b(!1)):S(!0)}),H(M=>M+1))};Q("messages:newMessage",s=>{if(a.id!==s.id||f.airplaneMode)return;v(M=>[...M,{...s,timestamp:Date.now()}]);let m=document.querySelector(".message-container");m.scrollTop=m.scrollHeight}),Q("messages:renameGroup",s=>{a.id===s.channelId&&(f.airplaneMode||o(m=>({...m,name:s.name})))}),Q("messages:messageDeleted",s=>{s&&(f.airplaneMode||v(N.filter(m=>m.id!==s)))}),Q("messages:removeMember",s=>{a.id===s.channelId&&(f.airplaneMode||s.number===r&&(u("userlist"),o(null)))});const Te=De(s=>{let m=s.target;for(;!m.classList.contains("message");)m=m.parentElement;let M=m.getAttribute("data-id");if(!M)return;let I=N.find(X=>X.id===M);I&&I.sender===r&&(ue(I.content)||Ge(I.content)||he(I.content)||Y.ContextMenu.set({buttons:[{title:l("APPS.MESSAGES.DELETE"),color:"red",cb:()=>{y("Messages",{action:"deleteMessage",id:M}).then(X=>{})}}]}))}),Ge=s=>{if(s)return/<!SENT-PAYMENT-(\d*)!>/.test(s)?!0:!!/<!REQUESTED-PAYMENT-(\d*)!>/.test(s)},ue=s=>{if(s)return/<!SENT-LOCATION-X=(-?\d*\.?\d*)Y=(-?\d*\.?\d*)!>/.test(s)},he=s=>{if(s)return s==="<!CALL-NO-ANSWER!>"},Oe=s=>{if(s)return/<!AUDIO-MESSAGE-IMAGE="(.*)"-AUDIO="(.*)"-DURATION="(.*)"!>/.test(s)};return e(te,{children:c("div",{className:"animation-slide left",children:[c(Pe,{children:[U&&e(nt,{setShow:D,setShowUserInfo:C,sendLocation:me,setData:o,data:a}),E&&e(at,{setShow:C,user:a!=null&&a.isGroup?E:a})]}),c("div",{className:"message-header",children:[c("div",{className:"back",onClick:()=>{u("userlist"),o(null),a.unread&&(y("Messages",{action:"markRead",id:a.id}),P(s=>s-1))},children:[e(Le,{}),O>0&&e("span",{className:"back-title",children:O})]}),c("div",{className:"user",onClick:()=>{a.isGroup?D(!0):C(!0)},children:[a.isGroup?e("div",{className:"group-avatar",children:a.members.sort((s,m)=>s.avatar?1:-1).map((s,m)=>e("img",{src:s.avatar??"./assets/img/no-pfp.png",alt:""},m)).slice(0,5)}):e("img",{src:a.avatar??"./assets/img/no-pfp.png",className:"avatar"}),e("div",{className:"name",children:a.isGroup?a.name??`${a.members.length} ${l("APPS.MESSAGES.PEOPLE")}`:a.name??V(a.number)})]}),e(ke,{className:`facetime ${a.isGroup?"hidden":""}`,onClick:()=>{a.isGroup||ye({number:a.number,videoCall:!0})}})]}),e("div",{className:"message-container",onScroll:we,style:k||T?{height:"48%"}:{},children:e("div",{className:"message-body",children:N.map((s,m)=>e(Ze,{index:m,messages:N,message:s,longPressEvent:Te,func:{isMissed:he,isLocation:ue,isVoiceMessage:Oe,pay:de}}))})}),e("div",{className:"attachments",children:$.attachments.map((s,m)=>c("div",{className:"attachment",children:[Ae(s)?e("video",{src:s,muted:!0,controls:!1,loop:!0,autoPlay:!0}):e("img",{src:s}),e(ie,{onClick:()=>{z({...$,attachments:$.attachments.filter((M,I)=>I!==m)})}})]},m))}),c("div",{className:"message-bottom",style:k||T?{height:"18%"}:{},children:[e("div",{className:"upper",children:c("div",{className:"input","data-border":!F,children:[F?c("div",{className:"audio-message",children:[e(ie,{onClick:()=>se(null)}),e("div",{className:"audio-waves",children:e("img",{src:F.waves.placeholder})})]}):e(Z,{placeholder:l("APPS.MESSAGES.PLACEHOLDER"),ref:ae,value:$.content,onChange:s=>{z({content:s.target.value,attachments:$.attachments})},onKeyDown:s=>{s.key=="Enter"&&oe()}}),($.content.length>0||$.attachments.length>0||F)&&e("div",{className:"send",onClick:()=>oe(),children:e(Me,{})})]})}),e("div",{className:"actions-wrapper",children:c("div",{className:"actions",children:[e("div",{className:"action",onClick:()=>{if(G)return Y.Emoji.reset();Y.Emoji.set({onSelect:s=>z(m=>({content:`${m.content}${s.emoji}`,attachments:m.attachments}))})},children:e("img",{src:"./assets/img/icons/messages/emoji.png"})}),e("div",{className:"action",onClick:()=>{var s,m,M;$.attachments.length<3&&Y.Gallery.set({includeVideos:!0,allowExternal:(M=(m=(s=ee)==null?void 0:s.value)==null?void 0:m.AllowExternal)==null?void 0:M.Messages,onSelect:I=>z({...$,attachments:[...$.attachments,I.src]})})},children:e("img",{src:"./assets/img/icons/messages/gallery.png"})}),!a.isGroup&&e("div",{className:"action black",onClick:()=>{L(!1),R(s=>!s)},children:"$"}),e("div",{className:"action",onClick:()=>me(),children:e(Re,{})}),e("div",{className:"action blue",onClick:()=>{R(!1),L(s=>!s)},children:e(pe,{})})]})}),k&&e(tt,{paymentAmount:w,setPaymentAmount:p,pay:de,request:Ce}),T&&e(et,{onEnd:s=>{s&&(se({src:URL.createObjectURL(s.blob),blob:s.blob,waves:s.waveform,duration:s.duration}),L(!1))}})]})]})})}const Ze=({messages:t,message:n,index:d,longPressEvent:f,func:r})=>{var k,R;const{User:a}=h.useContext(K),o=_(x.PhoneNumber),[i]=a,u=_(ee);let O,P,G,U,D,E,C=d===0?"last":"",T=n.sender===o?"self":"other",L=((k=t[d+1])==null?void 0:k.sender)===o?"self":"other";if(t[d+1]?G=Math.abs(n.timestamp-t[d+1].timestamp)/36e5:L=void 0,i.isGroup)O=(R=i.members.find(w=>w.number===n.sender))==null?void 0:R.name,P=!t[d-1]||t[d-1].sender!==n.sender;else if(n.content)if(r.isMissed(n.content))if(T==="other")n.content=l("APPS.MESSAGES.MISSED_CALL").format({number:n.sender});else return null;else/<!SENT-PAYMENT-(\d*)!>/.test(n.content)?U={amount:n.content.match(/\d/g).join(""),request:!1}:/<!REQUESTED-PAYMENT-(\d*)!>/.test(n.content)&&(U={amount:n.content.match(/\d/g).join(""),request:!0});if(r.isLocation(n.content)){let w=n.content.match(/X=(-?\d*\.?\d*)Y/)[1],p=n.content.match(/Y=(-?\d*\.?\d*)!>/)[1];D={x:w,y:p}}return r.isVoiceMessage(n.content)&&(E={wave:n.content.match(/AUDIO-MESSAGE-IMAGE="([^"]+)"/)[1],src:n.content.match(/AUDIO="([^"]+)"/)[1],duration:n.content.match(/DURATION="([^"]+)"/)[1]}),c("div",{className:`message ${T}`,id:C,"data-id":n.id,...f,children:[P&&T=="other"&&e("div",{className:"user",children:O??V(n.sender)}),n.delivered===!1?c("div",{className:"content-wrapper",children:[U&&e("div",{className:"payment",children:u.CurrencyFormat.replace("%s",U.amount)}),e("div",{className:"content",children:fe(n.content)}),e($e,{})]}):U||D||E?c(te,{children:[D&&c("div",{className:"location",onClick:()=>{x.App.set({name:"Maps",data:{location:[D.y,D.x],name:`${O??V(n.sender)}'s location`,icon:i.avatar}})},children:[e("div",{className:"img",style:{backgroundImage:'url("https://img.gta5-mods.com/q95/images/mirror-park-garden/2b72f9-20160428154103_1.jpg")'}}),T==="other"&&c("div",{className:"sender",children:[O??V(n.sender)," ",l("APPS.MESSAGES.SENT_LOCATION")]})]}),U&&e("div",{className:"payment",children:U.request?c("div",{className:`request ${T}`,children:[c("div",{className:"title",children:[u.CurrencyFormat.replace("%s",Ne(U.amount))," ",l("APPS.MESSAGES.PAY.REQUESTED")]}),T==="other"&&e("div",{className:"button",onClick:()=>r.pay(U.amount),children:l("APPS.MESSAGES.PAY.PAY")})]}):e("div",{className:"sent",children:u.CurrencyFormat.replace("%s",Ne(U.amount))})}),E&&e(st,{data:E,sender:T})]}):n.content&&e("div",{className:"content",children:fe(n.content)}),n.attachments&&n.attachments.length>0&&e("div",{className:"attatchments",children:n.attachments.map((w,p)=>Ae(w)?e("video",{src:w,controls:!1,loop:!0,autoPlay:!0,muted:!0,onClick:j=>{Y.FullscreenImage.set({display:!0,image:w})}},p):e(Ve,{src:w,onClick:()=>{Y.FullscreenImage.set({display:!0,image:w})}},p))}),n.delivered===!1?e("div",{className:"status",children:l("APPS.MESSAGES.NOT_DELIVERED")}):t[d+1]&&G>6?e("div",{className:"date",children:Ee(n.timestamp)}):T!==L&&e("div",{className:"date",children:Ee(n.timestamp)})]},d)},et=({onEnd:t})=>{const[n,d]=h.useState(!1),f=h.useRef(null);return h.useEffect(()=>{f.current=new ze},[]),Q("camera:toggleMicrophone",r=>{f!=null&&f.current&&(r?f.current.unmute():f.current.mute())}),e("div",{className:"audioMessage-container",children:e("div",{className:"audioMessage-button","data-recording":n,onClick:()=>{var a;if(!((a=navigator.mediaDevices)!=null&&a.getUserMedia)||!(f!=null&&f.current))return q("error","No media devices found!");let r=f.current;n?r.stop().then(o=>{t(o),d(i=>!i)}):navigator.mediaDevices.getUserMedia({audio:!0}).then(o=>{r.start(o),d(i=>!i)})},children:n?e(ie,{}):e(pe,{})})})},tt=({paymentAmount:t,setPaymentAmount:n,request:d,pay:f})=>{const r=_(ee);return c("div",{className:"payment-container",children:[c("div",{className:"payment-wrapper",children:[e("div",{className:"button",onClick:()=>t>0&&n(a=>a-1),children:"-"}),e("div",{className:"amount",children:e(Z,{type:"number",value:t,onChange:a=>{a.target.value.match(/^[0-9]+$/)&&parseFloat(a.target.value)>0&&parseFloat(a.target.value)<(r.MaxTransferAmount??Number.MAX_SAFE_INTEGER)?n(parseFloat(a.target.value)):n(0)}})}),e("div",{className:"button",onClick:()=>n(a=>a+1),children:"+"})]}),c("div",{className:"payment-buttons",children:[e("div",{className:"button",onClick:()=>d(t),children:l("APPS.MESSAGES.PAY.REQUEST")}),e("div",{className:"button",onClick:()=>f(t),children:l("APPS.MESSAGES.PAY.SEND")})]})]})},st=({data:t,sender:n})=>{var o;const[d,f]=h.useState(!1),r=h.useRef(null);h.useEffect(()=>{r.current&&(r.current.onended=()=>{f(!1)})},[r]);const a=i=>{i=Math.floor(i);const u=Math.floor(i/60),O=i-u*60;return`${u<10?"0"+u:u}:${O<10?"0"+O:O}`};return c("div",{className:`voice-message ${n}`,children:[e("a",{onClick:()=>{r.current&&(d?(r.current.pause(),r.current.currentTime=0):r.current.play(),f(i=>!i))},children:d?e(Fe,{}):e(Ye,{})}),e("div",{className:"wave",children:e("img",{src:t.wave,alt:"wave"})}),e("div",{className:"duration",children:a(d&&Math.floor(((o=r.current)==null?void 0:o.currentTime)+.5)!==0?r.current.currentTime:t.duration)}),e("audio",{ref:r,children:e("source",{src:t.src,type:"audio/mpeg"})})]})},at=({user:t,setShow:n})=>c(le.div,{...ce,className:"info-panel",children:[e("div",{className:"info-panel-header",children:e("div",{className:"done",onClick:()=>n(!1),children:l("APPS.MESSAGES.DONE")})}),c("div",{className:"info-panel-body",children:[c("div",{className:"info-panel-top",children:[t.avatar?e("div",{className:"profile-image bigger",style:{backgroundImage:`url(${t.avatar})`}}):t.name?e("div",{className:"profile-image bigger",children:je(t.name)}):e("img",{src:t.avatar??"./assets/img/no-pfp.png",className:"avatar"}),e("div",{className:"name",children:t.name??V(t.number)})]}),e("div",{className:"items",children:!t.company&&c(te,{children:[t.name&&e("div",{className:"info-section",children:e("div",{className:"item blue",onClick:()=>xe(t.number),children:V(t.number)})}),e("div",{className:"info-section",children:t.name?e("div",{className:"item blue",onClick:()=>{Y.Share.set({type:"contact",data:{firstname:t.firstname,lastname:t.lastname,number:t.number,avatar:t.avatar}})},children:l("APPS.PHONE.CONTACTS.SHARE_CONTACT")}):e("div",{className:"item blue",onClick:()=>{x.App.set({name:"Phone",view:"newContact",data:t.number})},children:l("APPS.PHONE.CONTACTS.ADD_CONTACT")})})]})})]})]}),nt=t=>{const{View:n}=h.useContext(K),[d,f]=n,[r,a]=h.useState(!1),[o,i]=h.useState(null);let u=t.data,O=!u.members.find(P=>P.isOwner);return c(te,{children:[e(Pe,{children:r&&e(rt,{setShow:a,members:u.members,id:u.id})}),c(le.div,{...ce,className:"info-panel",children:[e("div",{className:"info-panel-header",children:e("div",{className:"done",onClick:()=>{o&&o!==""&&o!==u.name?y("Messages",{action:"renameGroup",id:u.id,name:o}).then(P=>{t.setShow(!1)}):t.setShow(!1)},children:l("APPS.MESSAGES.DONE")})}),c("div",{className:"info-panel-body",children:[c("div",{className:"info-panel-top",children:[e("div",{className:"group-avatar",children:u.members.sort((P,G)=>P.avatar?1:-1).slice(0,10).map(P=>e("img",{src:P.avatar??"./assets/img/no-pfp.png",alt:""}))}),c("div",{className:"members",children:[u.members.length," ",l("APPS.MESSAGES.MEMBERS")]})]}),c("div",{className:"items",children:[e("div",{className:"info-section",children:c("div",{className:"item blue",children:[e(He,{className:"add"}),e(Z,{defaultValue:u.name??"Group Name",onChange:P=>i(P.target.value)})]})}),c("div",{className:"info-section",children:[u.members.sort((P,G)=>P.name&&!G.name?-1:!P.name&&G.name?1:P.name<G.name?-1:P.name>G.name?1:0).map(P=>c("div",{className:"item",children:[O&&e(Be,{className:"remove",onClick:()=>{Y.PopUp.set({title:l("APPS.MESSAGES.REMOVE_POPUP.TITLE"),description:l("APPS.MESSAGES.REMOVE_POPUP.TEXT").format({name:P.name??V(P.number)}),buttons:[{title:l("APPS.MESSAGES.CANCEL")},{title:l("APPS.MESSAGES.REMOVE_POPUP.REMOVE"),color:"red",cb:()=>{y("Messages",{action:"removeMember",number:P.number,id:u.id}).then(G=>{G&&(t.setData(U=>{let D=U;return D.members=D.members.filter(E=>E.number!==P.number),D}),t.setShow(!1))})}}]})}}),e("img",{src:P.avatar??"./assets/img/no-pfp.png",alt:""}),e("div",{className:"name",children:P.name??V(P.number)}),e(Xe,{className:"info",onClick:()=>{t.setShowUserInfo({...P})}})]})),c("div",{className:"item blue",onClick:()=>a(!0),children:[e(qe,{className:"add"}),l("APPS.MESSAGES.ADD_MEMBER")]})]}),e("div",{className:"info-section",children:e("div",{className:"item blue",onClick:()=>t.sendLocation(),children:l("APPS.MESSAGES.SHARE_LOCATION")})}),e("div",{className:"info-section",onClick:()=>{Y.PopUp.set({title:l("APPS.MESSAGES.LEAVE_POPUP.TITLE"),description:l("APPS.MESSAGES.LEAVE_POPUP.TEXT"),buttons:[{title:l("APPS.MESSAGES.CANCEL")},{title:l("APPS.MESSAGES.LEAVE_POPUP.LEAVE"),color:"red",cb:()=>{y("Messages",{action:"leaveGroup",id:u.id}).then(P=>{if(!P)return q("info","Failed to leave group, server didnt callback request");f("userlist"),t.setShow(!1)})}}]})},children:e("div",{className:"item red",children:l("APPS.MESSAGES.LEAVE_GROUP")})})]})]})]})]})},rt=t=>{const n=_(x.PhoneNumber),[d,f]=h.useState(""),r=_(B.APPS.PHONE.contacts);let a=t.members;return c(le.div,{...ce,className:"add-member-container",children:[c("div",{className:"add-member-header",children:[c("div",{className:"top",children:[e("span",{}),e("div",{className:"title",children:l("APPS.MESSAGES.ADD_MEMBER")}),e("div",{className:"button",onClick:()=>t.setShow(!1),children:l("APPS.MESSAGES.CANCEL")})]}),e(be,{placeholder:l("APPS.MESSAGES.SEARCH"),onChange:o=>f(o.target.value)})]}),e("div",{className:"contacts",children:r.filter(o=>!o.company).sort((o,i)=>o.firstname&&!i.firstname?-1:!o.firstname&&i.firstname?1:o.firstname<i.firstname?-1:o.firstname>i.firstname?1:0).filter(o=>!a.find(i=>i.number===o.number)||o.number===n).filter(o=>{var i,u;return o.firstname.toLowerCase().includes(d.toLowerCase())||((u=(i=o==null?void 0:o.lastname)==null?void 0:i.toLowerCase())==null?void 0:u.includes(d.toLowerCase()))}).map(o=>{let i=W(o.firstname,o.lastname);return c("div",{className:"contact",onClick:()=>{Y.PopUp.set({title:l("APPS.MESSAGES.ADD_POPUP.TITLE"),description:l("APPS.MESSAGES.ADD_POPUP.TEXT").format({name:i}),buttons:[{title:l("APPS.MESSAGES.CANCEL")},{title:l("APPS.MESSAGES.ADD_POPUP.ADD"),cb:()=>{y("Messages",{action:"addMember",number:o.number,id:t.id}).then(u=>{u&&t.setShow(!1)})}}]})},children:[e("img",{src:o.avatar??"./assets/img/no-pfp.png"}),c("div",{className:"user",children:[e("div",{className:"name",children:i}),e("div",{className:"number",children:V(o.number)})]})]})})})]})};function it(){const{User:t,View:n,Newmessage:d,ImportedUser:f}=h.useContext(K),[r,a]=t,[o,i]=n,[u,O]=f,P=_(x.PhoneNumber),[G,U]=d,D=_(B.APPS.PHONE.contacts),[E,C]=h.useState([]),T=h.useRef(null),[L,k]=h.useState(""),[R,w]=h.useState([]),[p,j]=h.useState({content:"",attachments:[]});h.useEffect(()=>{u&&(C([u]),O(null))},[u]);const H=()=>{(p.content.length>0||p.attachments.length>0)&&(E.length>1?y("Messages",{action:"createGroup",members:E,content:p.content,attachments:p.attachments}).then(g=>{g&&(a({isGroup:!0,members:E,lastMessage:p.content,timestamp:Date.now(),id:g}),i("messages"),U(!1))}):y("Messages",{action:"sendMessage",number:E[0].number,content:p.content,attachments:p.attachments}).then(g=>{var S,A,b,N;if(g){let v;E[0].name?v=E[0].name:(S=E[0])!=null&&S.firstname&&(v=W((A=E[0])==null?void 0:A.firstname,(b=E[0])==null?void 0:b.lastname));let F={number:E[0].number,name:v,avatar:(N=E[0])==null?void 0:N.avatar};a({...F,lastMessage:p.content,timestamp:Date.now(),id:g}),i("messages"),U(!1)}}))};return h.useEffect(()=>{if(L.length>0){if(D){const g=D.filter(S=>{let A=W(S.firstname,S.lastname);return A&&A.toLowerCase().includes(L.toLowerCase())&&!S.company});w(g)}}else w([])},[L]),c("div",{className:"new-message-container",children:[c("div",{className:"new-message-header",children:[e("span",{}),e("div",{className:"title",children:l("APPS.MESSAGES.NEW_MESSAGE")}),e("div",{className:"button",onClick:()=>{E.length>0&&(p.content.length>0||p.attachments.length>0)?H():U(!1)},children:E.length>0&&(p.content.length>0||p.attachments.length>0)?l("APPS.MESSAGES.SEND"):l("APPS.MESSAGES.CANCEL")})]}),c("div",{className:"new-message-body",children:[c("div",{className:"new-message-search",children:[c("div",{className:"to",children:[l("APPS.MESSAGES.TO"),":"]}),e("div",{className:"contacts",children:E.map((g,S)=>{let A=W(g.firstname,g.lastname),b=A!=="Unknown";return e("div",{className:`contact ${b?"green":"blue"}`,onClick:()=>{Y.PopUp.set({title:l("APPS.MESSAGES.REMOVE_POPUP.TITLE"),description:l("APPS.MESSAGES.REMOVE_POPUP.TEXT").format({NAME:A??V(g.number)}),buttons:[{title:l("APPS.MESSAGES.CANCEL")},{title:l("APPS.MESSAGES.REMOVE_POPUP.REMOVE"),color:"red",cb:()=>{let N=E.filter(v=>v.number!==g.number);C(N)}}]})},children:b?A:V(g.number)},S)})}),e(Z,{type:"text",ref:T,onChange:g=>{if(k(g.target.value),g.target.value.length==P.length&&/^\d+$/g.test(g.target.value)){if(g.target.value===P)return;C([...E,{number:g.target.value}]),T.current.value="",k("")}},onKeyDown:g=>{var S;g.key=="Backspace"&&L.length==0?((S=E[E.length-1])==null?void 0:S.name)===void 0?(T.current.value=E[E.length-1].number,C(E.slice(0,E.length-1))):C(E.slice(0,-1)):g.key=="Tab"&&(g.preventDefault(),R.length==1&&(C([...E,R[0]]),T.current.value="",k("")))}})]}),e("div",{className:"search-results",children:R&&R.filter(g=>!E.find(S=>S.number==g.number)).map((g,S)=>{let A=W(g.firstname,g.lastname);return c("div",{className:"contact",onClick:()=>{E.find(N=>N.number==g.number)||(C([...E,g]),T.current.value="",k(""))},children:[e("img",{src:g.avatar??"./assets/img/no-pfp.png"}),c("div",{className:"user",children:[e("div",{className:"name",children:A}),e("div",{className:"number",children:V(g.number)})]})]},S)})})]}),E.length>0&&R.length===0&&e("div",{className:"message-bottom absolute",children:e("div",{className:"upper",children:c("div",{className:"input",children:[e(Z,{placeholder:l("APPS.MESSAGES.PLACEHOLDER"),value:p.content,onChange:g=>{j({content:g.target.value??"",attachments:p.attachments})},onKeyDown:g=>{g.key=="Enter"&&H()}}),(p.content.length>0||p.attachments.length>0)&&e("div",{className:"send",onClick:()=>H(),children:e(Me,{})})]})})})]})}function lt(){const{User:t,View:n,Newmessage:d,UnreadMessages:f,ImportedUser:r}=h.useContext(K),a=_(x.PhoneNumber),o=_(x.Settings),i=_(x.App),[u,O]=t,[P,G]=n,[U,D]=r,[E,C]=d,[T,L]=f,k=_(B.APPS.PHONE.contacts),R=_(B.APPS.MESSAGES.messages),[w,p]=h.useState(""),[j,H]=h.useState([]);h.useEffect(()=>{R?(q("info","Using cache for recent messages"),H(R),L(j.filter(S=>S.unread).length)):y("Messages",{action:"getRecentMessages"}).then(S=>{let A=S.map(b=>{if(b.isGroup)return b.members=b.members.filter(N=>N.number!==a).map(N=>{let v=k.find(F=>F.number===N.number);return{name:v&&v.firstname?W(v==null?void 0:v.firstname,v==null?void 0:v.lastname):void 0,avatar:v==null?void 0:v.avatar,blocked:v==null?void 0:v.blocked,favourite:v==null?void 0:v.favourite,number:N.number,isOwner:N.isOwner}}),b;{let N=k.find(v=>v.number===b.number);return b.name=N!=null&&N.lastname?`${N.firstname} ${N.lastname}`:N==null?void 0:N.firstname,b.avatar=N==null?void 0:N.avatar,b}});L(A.filter(b=>b.unread).length),H(A),q("info","setting cache"),B.APPS.MESSAGES.messages.set(A)})},[R]);let g=h.useRef(!1);return h.useEffect(()=>{if(!g.current&&i!=null&&i.data&&(g.current=!0,i!=null&&i.data&&i.view=="messages")){let S=j.find(A=>A.number===i.data.number);S?(O(S),G("messages")):(C(!0),D({number:i.data.number,name:i.data.name,avatar:i.data.avatar})),x.App.set({name:i.name})}},[i==null?void 0:i.data,j]),Q("messages:newMessage",S=>{let A=JSON.parse(JSON.stringify(j)),b=A.findIndex(N=>N.id===S.id);o.airplaneMode||(b!==-1&&A.unshift(A.splice(b,1)[0]),A[0].lastMessage=S.content,A[0].timestamp=new Date,H(A))}),c(te,{children:[E&&e(it,{}),c("div",{className:`animation-slide ${j.length>0?"right":""}`,children:[c("div",{className:"messages-header",children:[e("div",{className:"title",children:l("APPS.MESSAGES.TITLE")}),e(Qe,{onClick:()=>C(!0)})]}),e(be,{placeholder:l("SEARCH"),onChange:S=>p(S.target.value)}),e("div",{className:"users-list",children:j.filter(S=>{var A;return(S.isGroup?S.members.find(b=>{var N;return((N=b.name)==null?void 0:N.toLowerCase().includes(w.toLowerCase()))||b.number.includes(w)}):((A=S.name)==null?void 0:A.toLowerCase().includes(w.toLowerCase()))||S.number.includes(w))||S.lastMessage.toLowerCase().includes(w.toLowerCase())}).sort((S,A)=>A.timestamp-S.timestamp).map((S,A)=>e(ct,{user:S,onClick:()=>{if(O(S),G("messages"),S.unread){y("Messages",{action:"markRead",id:S.id}),L(N=>N-1);let b=B.APPS.MESSAGES.messages.value;B.APPS.MESSAGES.messages.set(b.map(N=>(N.id===S.id&&(N.unread=!1),N)))}}},A))})]})]})}const ct=({user:t,onClick:n})=>{const d=_(ee);let f;if(t.isGroup?t.name?f=t.name:f=t.members.sort((r,a)=>r.name&&!a.name?-1:!r.name&&a.name?1:r.name<a.name?-1:r.name>a.name?1:0).map((r,a)=>{if(a<2)return r.name?r.name:V(r.number);if(a===2)return`+${t.members.length-2} ${l("APPS.MESSAGES.OTHER").toLowerCase()}`}).join(" "):f=t.name,t.lastMessage==="Attachment"&&(t.lastMessage=l("APPS.MESSAGES.SENT_A_PHOTO")),/<!SENT-PAYMENT-(\d*)!>/.test(t.lastMessage)){let r=t.lastMessage.match(/\d/g).join("");t.lastMessage=`${l("APPS.MESSAGES.SENT")} ${d.CurrencyFormat.replace("%s",r)}`}else if(/<!REQUESTED-PAYMENT-(\d*)!>/.test(t.lastMessage)){let r=t.lastMessage.match(/\d/g).join("");t.lastMessage=`${l("APPS.MESSAGES.REQUESTED")} $${r}`}else if(/<!SENT-LOCATION-X=(-?\d*\.?\d*)Y=(-?\d*\.?\d*)!>/.test(t.lastMessage))t.lastMessage=`${l("APPS.MESSAGES.SENT_LOCATION_SHORT")}`;else if(t.lastMessage.startsWith('<!AUDIO-MESSAGE-IMAGE="'))t.lastMessage="sent an audio message";else if(t.lastMessage==="<!CALL-NO-ANSWER!>")t.lastMessage=`${V(t.number)} tried to call you`;else if(t.lastMessage==="")return;return c("div",{className:"user",onClick:()=>n(),children:[e("div",{className:`read${t.unread?" unread":""}`}),t.isGroup?e("div",{className:"avatar group",children:t.members.map((r,a)=>{if(a<=4)return r.avatar?e("div",{style:{backgroundImage:`url(${r.avatar})`}},a):r.name?e("div",{children:r.name.charAt(0)},a):e("div",{className:"unknown"},a)})}):e("img",{className:"avatar",src:t.avatar??"assets/img/no-pfp.png"}),c("div",{className:"user-body",children:[c("div",{className:"user-header",children:[e("div",{className:"name",children:f??V(t.number)}),c("div",{className:"right",children:[e("div",{className:"time",children:We(t.timestamp)}),e(Ke,{})]})]}),e("div",{className:"content",children:t.lastMessage.length>40?t.lastMessage.substring(0,40)+"...":t.lastMessage})]})]})};const K=h.createContext(null);function ht(){const[t,n]=h.useState(null),[d,f]=h.useState("userlist"),[r,a]=h.useState(null),[o,i]=h.useState(0),[u,O]=h.useState(!1);return e("div",{className:"messages-container",children:e(K.Provider,{value:{User:[t,n],View:[d,f],Newmessage:[u,O],ImportedUser:[r,a],UnreadMessages:[o,i]},children:d=="userlist"?e(lt,{}):e(Je,{})})})}export{K as MessagesContext,ht as default};