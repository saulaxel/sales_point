const CACHE_NAME = 'papeleria-julia-pwa-v1'
const urlsToCache = [
    '/',
    '/static/css/style.css',
    '/static/js/main.js',
    '/static/iconos/web-app-manifest-192x192.png',
    '/static/iconos/web-app-manifest-512x512.png',
];

// Install event: cache assets
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME)
        .then(cache => {
            return cache.addAll(urlsToCache);
        })
    );
});

// activate event: cleanup old caches
self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.filter(name => name !== CACHE_NAME) // Delete old caches
                .map(name => caches.delete(name))
            );
        })
    );
});

// fetch event: serve cached assets
self.addEventListener('fetch', (event) => {
    event.respondWith(
        caches.match(event.request)
        .then(response => {
            return response || fetch(event.request); // Use cache first, then network
        })
    );
});
