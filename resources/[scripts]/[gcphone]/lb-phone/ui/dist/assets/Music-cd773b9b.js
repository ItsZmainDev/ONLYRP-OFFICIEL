import{r as m,a as l,j as e}from"./jsx-runtime-7cf68bf7.js";import{f as w,m as D,a6 as O,C as T,L as h,aD as L,b as U,bu as k,M as b,aL as q,z as $,B as E,a5 as V,x as _,y as Y,D as j,V as y,a as x,X as F,bv as G,bw as H,a8 as B,A as W}from"./PhoneProvider-d476cfa1.js";import{g as X}from"./color-e1a4c391.js";import"./number-28525126.js";function z(){const{Data:N,Playlist:v}=m.useContext(M),[a,s]=v,[g,d]=N,[t,n]=m.useState([]);m.useEffect(()=>{w("Music",{action:"getPlaylists"}).then(i=>{i&&n(i.map(u=>({...u,Songs:u.Songs.map(o=>{var S;return{...g.Songs.find(I=>I.Path===o),Cover:(S=g.Songs.find(I=>I.Path===o&&(g.Albums[I.Album]??g.Songs[o])))==null?void 0:S.Cover,Path:o}})})))})},[]);const r=(i,u)=>{!i||!u||w("Music",{action:"addSong",id:i,song:u}).then(o=>{o&&s(null)})};return l(D.div,{className:"add-playlist-container",initial:{opacity:0,y:"100%"},animate:{opacity:1,y:0},exit:{opacity:1,y:"100%"},children:[e("div",{className:"music-header",children:e("div",{className:"left",children:e(O,{onClick:()=>s(null)})})}),e("div",{className:"music-body",children:e("div",{className:"library",children:t.map((i,u)=>l("div",{className:"playlist",onClick:()=>{i.Songs.includes(a.Path)?T.PopUp.set({title:h("APPS.MUSIC.SONG_EXISTS_POPUP.TITLE"),description:h("APPS.MUSIC.SONG_EXISTS_POPUP.DESCRIPTION"),buttons:[{title:h("APPS.MUSIC.SONG_EXISTS_POPUP.CANCEL")}]}):r(i.Id,a.Path)},children:[l("div",{className:"playlist-details",children:[i.cover?e("img",{src:i.Cover}):i.Songs.length>0?e("div",{className:"playlist-cover","data-grid":i.Songs.filter(o=>o.Cover).length>=4,children:i.Songs.filter(o=>o.Cover).length>=4?i.Songs.filter((o,S)=>S<4).map((o,S)=>e("img",{src:o.Cover})):e("img",{src:i.Songs[0].Cover})}):e("img",{src:"./assets/img/icons/music/unknown.png"}),l("div",{className:"text",children:[e("div",{className:"title",children:i.Title}),l("div",{className:"subtitle",children:[i.Songs.length," ",h("APPS.MUSIC.SONGS").toLowerCase()]})]})]}),e(L,{})]},u))})})]})}function Q(){const{View:N,SelectedData:v,Func:a}=m.useContext(M),s=U(b),[g,d]=N,[t]=v;return e("div",{className:"slide left",children:e("div",{className:"music-body",children:l("div",{className:"artist-profile",children:[l("div",{className:"avatar",style:{backgroundImage:`url(${t.Avatar})`},children:[e("div",{className:"top",children:e(O,{onClick:()=>d("search")})}),e("div",{className:"title",children:t.Name})]}),l("div",{className:"category",children:[l("div",{className:"title",children:[h("APPS.MUSIC.SONGS"),e(L,{})]}),e("section",{children:t.songs.map((n,r)=>{var u;let i=((u=s==null?void 0:s.song)==null?void 0:u.Path)===n.Path;return l("div",{className:"song","data-playing":i,onClick:()=>{a.play({song:n,queue:[...t.songs.filter((o,S)=>S>r)]})},children:[l("div",{className:"song-info",children:[e("img",{src:n.Cover??"./assets/img/icons/music/unknown.png",alt:""}),l("div",{className:"text",children:[e("div",{className:"title",children:n.Title}),n.Album&&e("div",{className:"subtitle",children:n.Album})]})]}),e(k,{onClick:o=>{o.stopPropagation(),a.setContext(n)}})]},r)})})]}),l("div",{className:"category",children:[l("div",{className:"title",children:[h("APPS.MUSIC.ALBUMS"),e(L,{})]}),e("section",{className:"albums",children:t.albums.map((n,r)=>l("div",{className:"album",onClick:()=>{a.fetchAndSet(n.Title,"Albums")},children:[e("img",{src:n.Cover,alt:""}),e("div",{className:"title",children:n.Title})]},r))})]})]})})})}function J(){const{Func:N,Data:v}=m.useContext(M),[a,s]=m.useState(""),[g]=v,[d,t]=m.useState(null);return m.useEffect(()=>{w("Music",{action:"getPlaylists"}).then(n=>{n&&t(n.map(r=>({...r,Songs:r.Songs.map(i=>{var u;return{...g.Songs.find(o=>o.Path===i),Cover:(u=g.Songs.find(o=>o.Path===i&&(g.Albums[o.Album]??g.Songs[i])))==null?void 0:u.Cover,Path:i}})})))})},[]),l("div",{className:"slide right",children:[e("div",{className:"music-header",children:l("div",{className:"space",children:[e("div",{className:"title",children:h("APPS.MUSIC.LIBRARY")}),e(q,{onClick:()=>{T.PopUp.set({title:h("APPS.MUSIC.NEW_PLAYLIST_POPUP.TITLE"),description:h("APPS.MUSIC.NEW_PLAYLIST_POPUP.DESCRIPTION"),input:{placeholder:h("APPS.MUSIC.NEW_PLAYLIST_POPUP.PLACEHOLDER"),type:"text",minCharacters:1,onChange:n=>s(n)},buttons:[{title:h("APPS.MUSIC.NEW_PLAYLIST_POPUP.CANCEL")},{title:h("APPS.MUSIC.NEW_PLAYLIST_POPUP.PROCEED"),cb:()=>{s(n=>(w("Music",{action:"createPlaylist",name:n}).then(r=>{r&&t(i=>[...i,{id:r,Title:n,Songs:[]}])}),n))}}]})}})]})}),e("div",{className:"music-body",children:e("div",{className:"library",children:d&&d.map((n,r)=>l("div",{className:"playlist",onClick:()=>N.fetchAndSet(n,"playlist",!0),children:[l("div",{className:"playlist-details",children:[n.Cover?e("img",{src:n.Cover??"./assets/img/icons/music/unknown.png"}):n.Songs.length>0?e("div",{className:"playlist-cover","data-grid":n.Songs.filter(i=>i.Cover).length>=4,children:n.Songs.filter(i=>i.Cover).length>=4?n.Songs.filter((i,u)=>u<4).map((i,u)=>e("img",{src:i.Cover})):e("img",{src:n.Songs[0].Cover??"./assets/img/icons/music/unknown.png"})}):e("img",{src:"./assets/img/icons/music/unknown.png"}),l("div",{className:"text",children:[e("div",{className:"title",children:n.Title}),l("div",{className:"subtitle",children:[n.Songs.length," songs"]})]})]}),e(L,{})]},r))})})]})}function K(){var r,i,u,o;const{View:N,Player:v}=m.useContext(M),a=U(b),[s,g]=N,[d,t]=v;let n=[{icon:e(E,{}),value:"library",label:h("APPS.MUSIC.LIBRARY")},{icon:e(V,{}),value:"search",label:h("APPS.MUSIC.SEARCH")}];return l("div",{className:"music-footer",children:[l("div",{className:"music-playing",onClick:()=>{a&&t(!0)},children:[l("div",{className:"song-info",children:[e("img",{src:((r=a==null?void 0:a.song)==null?void 0:r.Cover)??"./assets/img/icons/music/unknown.png",alt:""}),l("div",{className:"text",children:[e("div",{className:"title",children:((i=a==null?void 0:a.song)==null?void 0:i.Title)??h("APPS.MUSIC.NOT_PLAYING")}),((u=a==null?void 0:a.song)==null?void 0:u.Artist)&&e("div",{className:"subtitle",children:(o=a==null?void 0:a.song)==null?void 0:o.Artist})]})]}),e("div",{className:"controls",onClick:S=>{S.stopPropagation(),a&&b.patch({playing:!a.playing})},children:a&&a.playing?e($,{}):e(E,{})})]}),e("div",{className:"items",children:n.map((S,I)=>l("div",{className:"item","data-active":s===S.value,onClick:()=>g(S.value),children:[S.icon,S.label]},I))})]})}function Z(){var I,c,P,A;const{View:N,Player:v}=m.useContext(M),a=U(x.Settings),s=U(b),[g,d]=v,[t,n]=m.useState(!1),[r,i]=m.useState(null),[u,o]=m.useState("rgb(170, 170, 170)");m.useEffect(()=>{var C;s&&((C=s==null?void 0:s.song)!=null&&C.Cover)&&X(s.song.Cover).then(f=>{f&&o(`
                    linear-gradient(0deg,
                        ${f.dominant} 0%,
                        ${f.average} 50%,
                        ${f.muted} 100%
                    )
                `)})},[(I=s==null?void 0:s.song)==null?void 0:I.Cover]);const S=C=>{if(!C)return"0:00";let f=Math.floor(C/60),p=Math.floor(C-f*60),R=p<10?"0"+p:p;return f+":"+R};return l(D.div,{className:"music-player",style:{background:u},initial:{y:"100%"},animate:{y:0},exit:{y:"100%"},transition:{duration:.3},children:[e("div",{className:"music-player-header",onClick:()=>d(!1)}),l("div",{className:"music-player-body",children:[e("img",{className:"cover",src:((c=s==null?void 0:s.song)==null?void 0:c.Cover)??"./assets/img/icons/music/unknown.png"}),l("div",{className:"song-info",children:[e("div",{className:"title",children:((P=s==null?void 0:s.song)==null?void 0:P.Title)??h("APPS.MUSIC.NOT_PLAYING")}),e("div",{className:"subtitle",children:((A=s==null?void 0:s.song)==null?void 0:A.Artist)??""})]}),l("div",{className:"duration",children:[e(_,{type:"range",min:0,max:100,value:s?r||((s==null?void 0:s.current)??0/(s==null?void 0:s.duration)??0)*100:0,style:{background:s!=null&&s.current?`linear-gradient(to right, rgb(255, 255, 255) 0%, rgb(255, 255, 255) ${Math.floor(r||s.current/s.duration*100)}%, rgba(255, 255, 255, 0.3) ${Math.floor(r||s.current/s.duration*100)}%, rgba(255, 255, 255, 0.3) 100%)`:"rgba(255, 255, 255, 0.3)"},onMouseDown:()=>n(!0),onMouseUp:C=>{n(!1),r&&s&&(s.goTo(s.duration/100*r),i(null))},onChange:C=>i(C.target.value)}),l("div",{className:"time",children:[e("div",{className:"current",children:S(r?(s==null?void 0:s.duration)/100*r:s==null?void 0:s.current)}),e("div",{className:"total",children:S(s==null?void 0:s.duration)})]})]}),l("div",{className:"controls",children:[e(Y,{onClick:()=>s==null?void 0:s.previous()}),e("div",{className:"play",onClick:()=>{s&&b.patch({playing:!s.playing})},children:s!=null&&s.playing?e($,{}):e(E,{})}),e(j,{onClick:()=>s==null?void 0:s.next()})]}),l("div",{className:"volume",children:[e(y,{}),e(_,{type:"range",min:0,max:1,step:.05,style:{background:`linear-gradient(to right, rgb(255, 255, 255) 0%, rgb(255, 255, 255) ${a.sound.volume*100}%, rgba(255, 255, 255, 0.3) ${a.sound.volume*100}%, rgba(255, 255, 255, 0.3) 100%)`},value:a.sound.volume,onChange:C=>{x.Settings.patch({sound:{...x.Settings.value.sound,volume:C.target.value}})}}),e(F,{})]})]})]})}function ee(){const{View:N,SelectedData:v,Func:a}=m.useContext(M),s=U(b),[g,d]=N,[t]=v,[n]=m.useState(!!t.Artist);return l("div",{className:"slide left",children:[e("div",{className:"music-header",children:l("div",{className:"space",children:[e(O,{onClick:()=>t.Artist?d("search"):d("library")}),!n&&e(G,{onClick:r=>{r.stopPropagation(),T.ContextMenu.set({buttons:[{title:h("APPS.MUSIC.DELETE_PLAYLIST"),color:"red",cb:()=>{w("Music",{action:"deletePlaylist",id:t.Id}).then(i=>{i&&d("library")})}}]})}})]})}),e("div",{className:"music-body",children:l("div",{className:"playlist-wrapper",children:[l("div",{className:"playlist-details",children:[t.Cover?e("img",{src:t.Cover}):t.Songs.length>0?e("div",{className:"playlist-cover","data-grid":t.Songs.filter(r=>r.Cover).length>=4,children:t.Songs.filter(r=>r.Cover).length>=4?t.Songs.filter((r,i)=>i<4).map((r,i)=>e("img",{src:r.Cover})):e("img",{src:t.Songs[0].Cover??"./assets/img/icons/music/unknown.png"})}):e("img",{src:"./assets/img/icons/music/unknown.png"}),l("div",{className:"text",children:[e("div",{className:"title",children:t.Title}),e("div",{className:"subtitle",children:n?t.Artist:`${Object.keys(t.Songs).length} ${h("APPS.MUSIC.SONGS").toLowerCase()}`})]}),l("div",{className:"buttons",children:[l("div",{className:"button",onClick:()=>{a.play({song:t.Songs[0],queue:[...t.Songs.filter((r,i)=>i>0)]})},children:[e(E,{})," ",h("APPS.MUSIC.PLAY")]}),l("div",{className:"button",onClick:()=>{a.play({song:t.Songs[Math.floor(Math.random()*t.Songs.length)],queue:[...t.Songs.filter((r,i)=>i>0)].sort(()=>Math.random()-.5)})},children:[e(H,{}),h("APPS.MUSIC.SHUFFLE")]})]})]}),e("div",{className:"playlist-tracks",children:t.Songs.map((r,i)=>{var o;let u=((o=s==null?void 0:s.song)==null?void 0:o.Path)===r.Path;return l("div",{className:"track","data-album":n,"data-playing":u,onClick:()=>{a.play({song:r,queue:[...t.Songs.filter((S,I)=>I>i)]})},children:[l("div",{className:"track-info",children:[n?e("div",{className:"index",children:i+1}):e("img",{src:r.Cover??"./assets/img/icons/music/unknown.png"}),l("div",{className:"text",children:[e("div",{className:"title",children:r.Title}),e("div",{className:"subtitle",children:n?t.Artist:r.Artist})]})]}),e(k,{onClick:S=>{S.stopPropagation(),a.setContext(r)}})]},i)})})]})})]})}function se(){const{Func:N,Data:v}=m.useContext(M),a=U(b),[s,g]=m.useState(""),[d]=v;return l("div",{className:"slide right",children:[e("div",{className:"music-header",children:l("div",{className:"search",children:[e("div",{className:"title",children:h("APPS.MUSIC.SEARCH")}),e(B,{placeholder:h("APPS.MUSIC.SEARCH_PLACEHOLDER"),onChange:t=>g(t.target.value)})]})}),e("div",{className:"music-body",children:e("div",{className:"search-results",children:s.length>0&&Object.keys(d).map(t=>Object.keys(d[t]).filter(n=>{switch(t){case"Artists":return n.toLowerCase().includes(s.toLowerCase());case"Albums":return n.toLowerCase().includes(s.toLowerCase());case"Songs":return d[t][n].Title.toLowerCase().includes(s.toLowerCase())}}).map((n,r)=>{var u;let i;return t==="Songs"&&(i=((u=a==null?void 0:a.song)==null?void 0:u.Path)===d[t][n].Path),l("div",{className:"item","data-playing":i,onClick:()=>{t==="Songs"?N.play({song:d[t][n],queue:[...d.Songs.filter((o,S)=>d[t][n].Path!==o.Path&&S>r)]}):N.fetchAndSet(n,t)},children:[l("div",{className:"item-info",children:[e("img",{src:(t==="Artists"?d[t][n].Avatar:d[t][n].Cover)??"./assets/img/icons/music/unknown.png","data-artist":t==="Artists"}),l("div",{className:"text",children:[e("div",{className:"title",children:t==="Songs"?d[t][n].Title:n}),l("div",{className:"subtitle",children:[t==="Artists"&&h("APPS.MUSIC.ARTIST"),t==="Albums"&&`${h("APPS.MUSIC.ALBUM")} • ${d[t][n].Artist}`,t==="Songs"&&`${h("APPS.MUSIC.SONG")} • ${d[t][n].Artist}`]})]})]}),e("div",{className:"item-actions",children:t==="Songs"?e(k,{onClick:o=>{o.stopPropagation(),N.setContext(d[t][n])}}):e(L,{})})]})}))})})]})}const M=m.createContext(null);function le(){const[N,v]=m.useState("search"),[a,s]=m.useState(null),[g,d]=m.useState(null),[t,n]=m.useState(!1),[r,i]=m.useState(null),u={search:e(se,{}),artist:e(Q,{}),library:e(J,{}),playlist:e(ee,{})},o=(c,P,A)=>{if(c&&!(!a[P]&&!A))if(P==="Albums"){let C=Object.keys(a.Songs).filter(f=>a.Songs[f].Album===c).map(f=>a.Songs[f]);d({...a[P][c],Songs:C,Title:c}),v("playlist")}else if(P==="Artists"){let C=Object.keys(a.Songs).filter(p=>a.Songs[p].Artist===c).map(p=>a.Songs[p]),f=Object.keys(a.Albums).filter(p=>a.Albums[p].Artist===c).map(p=>({...a.Albums[p],Title:p}));d({...a[P][c],Name:c,songs:C,albums:f}),v("artist")}else P==="playlist"&&(d(c),v("playlist"))},S=c=>{var P,A;!c||!c.song||(b.value?b.patch({playing:!0,song:c.song,queue:c.queue??((P=b.value)==null?void 0:P.queue)??[]}):b.set({playing:!0,song:c.song,queue:c.queue??((A=b.value)==null?void 0:A.queue)??[]}))},I=c=>{if(!c)return;let P=[{title:h("APPS.MUSIC.ADD_QUEUE"),color:null,cb:()=>{b.patch({queue:[...b.value.queue,c]})}},{title:h("APPS.MUSIC.ADD_PLAYLIST"),color:null,cb:()=>{i(c)}}];g.IsOwner&&P.push({title:h("APPS.MUSIC.REMOVE_SONG"),color:"red",cb:()=>{w("Music",{action:"removeSong",id:g.Id,song:c.Path}).then(A=>{A&&d(C=>{let f=C.Songs.filter(p=>p.Path!==c.Path);return{...C,Songs:f}})})}}),T.ContextMenu.set({buttons:P})};return m.useEffect(()=>{w("Music",{action:"getConfig"}).then(c=>{if(!c)return;let P=Object.keys(c.Songs).map(A=>({...c.Songs[A],Cover:c.Songs[A].Album&&c.Albums[c.Songs[A].Album]?c.Albums[c.Songs[A].Album].Cover:c.Songs[A].Cover,Path:A}));s({...c,Songs:P})})},[]),e("div",{className:"music-container",children:l(M.Provider,{value:{View:[N,v],Data:[a,s],SelectedData:[g,d],Player:[t,n],Playlist:[r,i],Func:{fetchAndSet:o,play:S,setContext:I}},children:[l(W,{initial:!1,children:[t&&e(Z,{}),r&&e(z,{})]}),u[N],e(K,{})]})})}export{M as MusicContext,le as default};
