import{r as a,j as s,a as E,F as b}from"./jsx-runtime-7cf68bf7.js";import{f as C,L as m,aU as _,C as N,w as H,b as M,A as k,m as D,a6 as B,aV as U,c as X,a as F,o as x}from"./PhoneProvider-d476cfa1.js";import{r as z}from"./number-28525126.js";import{C as V}from"./Check-f7d9fe79.js";function J(){const h=a.useRef(null),[v,S]=a.useState(!1),[i,P]=a.useState([]),[d,T]=a.useState(null),[u,p]=a.useState([]),[f,y]=a.useState(0),[l,O]=a.useState(!1),[w,L]=a.useState(!1),n=c=>{if(c){let r=u.filter(e=>e.src===c)[0];C("Camera",{action:"deleteFromGallery",links:r.src}).then(()=>{p(u.filter(e=>e.src!==c)),T(null),window.postMessage({action:"phone:updateStorage",add:!1,size:r.size})})}else C("Camera",{action:"deleteFromGallery",links:i.map(r=>r.src)}).then(()=>{p(u.filter(e=>!i.find(t=>e.src===t.src))),P([]);let r=0;i.forEach(e=>{r+=e.size}),window.postMessage({action:"phone:updateStorage",add:!1,size:r})})};a.useEffect(()=>{C("Camera",{action:"getImages",page:0,filter:{showVideos:!0,showPhotos:!0}}).then(c=>{c&&p(c)})},[]);const g=c=>{if(w||l)return;let r=document.querySelector("#last");if(!r)return;!H(r)&&(O(!0),C("Camera",{action:"getImages",page:f+1,filter:{showVideos:!0,showPhotos:!0}}).then(t=>{t&&t.length>0?(p([...u,...t]),O(!1),t.length<25&&L(!0)):L(!0)}),y(t=>t+1))};return s("div",{className:"photos-container",children:d?s(G,{image:d,images:u,setActiveImage:T,handleDelete:n}):E("div",{className:"zoomOut",children:[E("div",{className:"photos-header",children:[s("div",{}),s("div",{className:"title",children:m("APPS.PHOTOS.TITLE")}),s("div",{className:"select",onClick:()=>S(!v),children:v?m("APPS.PHOTOS.CANCEL"):m("APPS.PHOTOS.SELECT")})]}),E("div",{className:"photos-content",onScroll:g,children:[s("div",{className:"images",ref:h,children:u.sort((c,r)=>r.timestamp-c.timestamp).map((c,r)=>{let e=r===u.length-1?"last":"";return E("div",{id:e,className:"image",onClick:()=>{if(v){const t=i.find(o=>o.src===c.src);P(t?i.filter(o=>o.src!==c.src):[...i,c])}else T(c)},children:[c.isVideo?s(R,{src:c.src,editMode:v}):s("div",{className:"img",style:{backgroundImage:`url(${c.src})`}}),s("div",{className:"checkbox",children:v&&(i.find(t=>t.src===c.src)?s(V,{checked:!0}):s(V,{checked:!1}))})]},r)})}),s("div",{className:"info",children:m("APPS.PHOTOS.PHOTO_COUNT").format({count:u.length})})]}),v&&E("div",{className:"photos-bottom",children:[s("span",{}),s("div",{className:"selected",children:i.length>0?m("APPS.PHOTOS.SELECTED_COUNT").format({count:i.length}):m("APPS.PHOTOS.SELECT_ITEMS")}),i.length>0?s(_,{onClick:()=>{N.PopUp.set({title:m("APPS.PHOTOS.DELETE_TITLE").format({count:i.length}),description:m("APPS.PHOTOS.DELETE_TEXT").format({count:i.length}),buttons:[{title:m("APPS.PHOTOS.DELETE_BUTTON_CANCEL")},{title:m("APPS.PHOTOS.DELETE_BUTTON_DELETE"),color:"red",cb:()=>{n()}}]})}}):s("span",{})]})]})})}const G=h=>{var r;const v=M(X),S=M(F.Settings),[i,P]=a.useState(new Date(((r=h==null?void 0:h.image)==null?void 0:r.timestamp)/1e3)),[d,T]=a.useState(!0),[u,p]=a.useState(0),f=a.useRef(null),y=a.useRef(null),[l,O]=a.useState(h.image),[w,L]=a.useState([]);let n=h.images;a.useEffect(()=>{if(l&&l.isVideo){const e=document.getElementById(l.src);if(!e)return;e.volume=S.sound.volume}},[S.sound.volume]),a.useEffect(()=>{var t;let e=n.findIndex(o=>o.src===l.src);if(p(e),l.isVideo){const o=document.getElementById(l.src);if(!o)return;o.play(),o.volume=S.sound.volume}if(n.length>0){let o=[];e===0?o=n.slice(0,12):e===n.length-1?o=n.slice(n.length-12,n.length):e<6?o=n.slice(0,12):e>n.length-6?o=n.slice(n.length-12,n.length):o=n.slice(e-6,e+6),P(new Date(((t=n==null?void 0:n[e])==null?void 0:t.timestamp)/1e3)),L(o)}},[l]);const g={pos:{startLeft:0,startX:0},onMouseDown:e=>{g.pos={startLeft:f.current.scrollLeft,startX:e.clientX},f.current.style.userSelect="none",document.addEventListener("mouseup",g.onMouseUp),document.addEventListener("mousemove",g.onMove)},onMove:e=>{if(!f.current)return;const t=(e.clientX-g.pos.startX)/x(S.display.size);f.current.scrollLeft=g.pos.startLeft-t;const o=f.current.getBoundingClientRect();(o.left-5>e.clientX||e.clientX>o.right-5)&&g.onMouseUp()},onMouseUp:()=>{if(!f.current)return;f.current.style.removeProperty("user-select"),document.removeEventListener("mouseup",g.onMouseUp),document.removeEventListener("mousemove",g.onMove);const e=f.current.clientWidth;let t=u;const o=f.current.scrollLeft-g.pos.startLeft;if(o>e/2&&t<n.length?t++:o<-e/2&&t>0&&t--,l.src!==n[t].src&&l.isVideo){const A=document.getElementById(l.src);A&&(A.pause(),A.currentTime=0)}O(n[t]),document.getElementById(n[t].src).scrollIntoView({behavior:"smooth",block:"center"})}},c=e=>{l.isVideo&&document.getElementById(l.src).pause(),O(e),document.getElementById(e.src).scrollIntoView({behavior:"smooth",block:"center"})};return E("div",{className:"activephoto-container",children:[s(k,{children:d&&E(D.div,{className:"photo-top",initial:{opacity:0},animate:{opacity:1},exit:{opacity:0},transition:{duration:.2,ease:"easeInOut"},children:[s("div",{className:"back",onClick:()=>{N.Share.reset(),h.setActiveImage(null)},children:s(B,{})}),E("div",{className:"date",children:[i.toLocaleString([],{day:"2-digit",month:"long"}),s("span",{children:i.toLocaleTimeString(v.DateLocale,{hour:"numeric",minute:"numeric",hour12:S.time.twelveHourClock})})]}),s("div",{})]})}),s("div",{className:"image-overflow",ref:f,onMouseDown:g.onMouseDown,onClick:()=>T(!d),children:n.map((e,t)=>{const o=e.src===l.src;return e.isVideo?s("video",{src:e.src,className:o?"active":null,id:e.src,crossOrigin:"anonymous",loop:!0,onLoadedMetadata:I=>{o&&(I.target.scrollIntoView({block:"center"}),I.target.play())}},t):s("img",{id:e.src,src:e.src,alt:"photo",className:o?"active":null,onLoad:I=>{o&&I.target.scrollIntoView({block:"center"})}},t)})}),s(k,{children:d&&E(D.div,{className:"photo-bottom-wrapper",initial:{opacity:0},animate:{opacity:1},exit:{opacity:0},transition:{duration:.2,ease:"easeInOut"},children:[s("div",{className:"photo-carousel",ref:y,children:w.map((e,t)=>e.isVideo?s("video",{src:e.src,"data-carousel":t,controls:!1,muted:!0,onClick:o=>c(e)},t):s("img",{src:e.src,"data-carousel":t,onClick:o=>c(e)},t))}),E("div",{className:"photo-bottom",children:[s(U,{onClick:()=>{N.Share.set({type:"image",data:{src:l.src,isVideo:l.isVideo}})}}),s(_,{onClick:()=>{N.PopUp.set({title:m("APPS.PHOTOS.DELETE_IMAGE_TITLE"),description:m("APPS.PHOTOS.DELETE_IMAGE_TEXT"),buttons:[{title:m("APPS.PHOTOS.DELETE_IMAGE_BUTTON_CANCEL")},{title:m("APPS.PHOTOS.DELETE_IMAGE_BUTTON_DELETE"),color:"red",cb:()=>{h.handleDelete(h.image.src)}}]})}})]})]})})]})},R=({src:h,editMode:v})=>{const[S,i]=a.useState(null);return E(b,{children:[s("video",{src:h,crossOrigin:"anonymous",controls:!1,onMouseOver:d=>d.currentTarget.play(),onMouseOut:d=>d.currentTarget.pause(),muted:!0,onLoadedMetadata:d=>{i(d.currentTarget.duration)}}),S&&!v&&s("div",{className:"video-duration",children:(d=>{const T=Math.floor(d/60),u=z(d-T*60,0);return`${T}:${u<10?"0"+u:u}`})(S)})]})};export{J as default};
