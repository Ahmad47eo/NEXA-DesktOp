const startMenu=document.querySelector("#start-menu");
const appWindow=document.querySelector("#app-window");
const windowTitle=document.querySelector("#window-title");
const windowSymbol=document.querySelector("#window-symbol");
const windowContent=document.querySelector("#window-content");
const content={
 about:{title:"About NEXA",symbol:"✦",html:'<h2>Welcome to NEXA Desktop</h2><p>A desktop-inspired interface experiment for iPhone. This is the first UI prototype, not a full Windows environment.</p><span class="status-pill">Runtime not connected</span><p>Next: build the native iOS shell, then investigate compatible runtime components.</p>'},
 files:{title:"Files",symbol:"▰",html:'<h2>Your workspace</h2><p>This demo does not access your iPhone files. A future native version will need explicit file-picker permission for user-selected files.</p><p><strong>Locations</strong><br>Recent · On My iPhone · Downloads</p>'},
 games:{title:"Game Library",symbol:"▶",html:'<h2>Game Library</h2><p>No games are installed or launched by this prototype.</p><p><strong>Planned compatibility research:</strong> Portal 2 and other games, subject to runtime, graphics, input, and device limitations.</p><span class="status-pill">No runtime available</span>'}
};
function openApp(name){const item=content[name];if(!item)return;windowTitle.textContent=item.title;windowSymbol.textContent=item.symbol;windowContent.innerHTML=item.html;appWindow.classList.remove("hidden");startMenu.classList.add("hidden")}
document.querySelectorAll("[data-open]").forEach(button=>button.addEventListener("click",()=>openApp(button.dataset.open)));
document.querySelector("#start-button").addEventListener("click",()=>{startMenu.classList.toggle("hidden");appWindow.classList.add("hidden")});
document.querySelector("#search-button").addEventListener("click",()=>{startMenu.classList.remove("hidden");appWindow.classList.add("hidden")});
document.querySelector("#close-window").addEventListener("click",()=>appWindow.classList.add("hidden"));
function updateClock(){document.querySelector("#clock").textContent=new Intl.DateTimeFormat([], {hour:"2-digit",minute:"2-digit"}).format(new Date())}
updateClock();setInterval(updateClock,30000);
document.addEventListener("keydown",event=>{if(event.key==="Escape"){startMenu.classList.add("hidden");appWindow.classList.add("hidden")}});
