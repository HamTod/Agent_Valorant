'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2e970a37ed15065e032108c737ce94c5",
"assets/assets/images/%255BOriginals%255D/Astra.jpg": "524cbb56adff2e6139f77550992fba62",
"assets/assets/images/%255BOriginals%255D/Breach.png": "f741b38ddf3a9a2623573c2a5a5ab04d",
"assets/assets/images/%255BOriginals%255D/Brimstone.png": "bb5c7f3794324e7763297003e68f6943",
"assets/assets/images/%255BOriginals%255D/Cypher.png": "17d9321bfdf6223efe42c7bbcda85a9c",
"assets/assets/images/%255BOriginals%255D/Jett.png": "4f8b7f35b1b66f8327161cd40568082c",
"assets/assets/images/%255BOriginals%255D/KAYO.jpg": "0386d88e7e68f843efe2f75687c155b3",
"assets/assets/images/%255BOriginals%255D/Killjoy.png": "b9f492c4628d2b1c1138f7735284d984",
"assets/assets/images/%255BOriginals%255D/Omen.png": "a90c890f020f010740c17efc280de32a",
"assets/assets/images/%255BOriginals%255D/Phoenix.png": "17bd80796d6ed848191afd953d4935ac",
"assets/assets/images/%255BOriginals%255D/Raze.png": "c78349c369bf5f2535a8021b1aa6e4ba",
"assets/assets/images/%255BOriginals%255D/Reyna.png": "7daf8c101969a126c0fc686a1fc055ea",
"assets/assets/images/%255BOriginals%255D/Sage.png": "e6550bca5ff294d9fd213f1a1364f07d",
"assets/assets/images/%255BOriginals%255D/Skye.png": "2b3ce9863fa652970f60a061f8b5263e",
"assets/assets/images/%255BOriginals%255D/Sova.png": "4feb86c8f82835945170e93e88d6e5be",
"assets/assets/images/%255BOriginals%255D/Viper.png": "1074c324ad673cbe22c32a4f81425556",
"assets/assets/images/Astra.jpg": "ec2111364efe29d99b85603820fa830b",
"assets/assets/images/bg.jpg": "65af72556460dab1266c1f1ade324937",
"assets/assets/images/Breach.png": "a1b327de9260b7eadb225316a30b625c",
"assets/assets/images/Brimstone.png": "9ed70f8849b45b0b7db38d2940228751",
"assets/assets/images/Cypher.png": "03a509cae6a96a634b899b0c6d9c42d0",
"assets/assets/images/Jett.png": "a652bfe6aea2067ea68fb8c086f24473",
"assets/assets/images/KAYO.jpg": "89fb538694248692b90364bc857e6efb",
"assets/assets/images/Killjoy.png": "09433e96eb3bc388e06981b72e0c4ad9",
"assets/assets/images/logo.png": "09d64285e058e8840bdfee39ca8c6c8a",
"assets/assets/images/logo2.png": "c26aa90a2706dfadd2787aec992be0db",
"assets/assets/images/logo3.png": "7a1e0804d2a236489e87726ed6a9a061",
"assets/assets/images/Omen.png": "1eb956c7b070dd1604d0e7777fb48e3a",
"assets/assets/images/Phoenix.png": "2c2922f1c2e31d8abb5ca4c144f99300",
"assets/assets/images/Raze.png": "2ff735816878b0132902cbdbcf63a1fd",
"assets/assets/images/Reyna.png": "8233fd635bd5679651bc21884d0b0f31",
"assets/assets/images/Sage.png": "52c636e8abeac1a4eda127e73d6b0114",
"assets/assets/images/Skye.png": "9ec660439c736cc117dfe66c1a5e3ea7",
"assets/assets/images/Sova.png": "35216a1de80179cf2f524bbb4875ff6b",
"assets/assets/images/Viper.png": "93d679965437023c563fb41f808fe38a",
"assets/assets/images/yoru.jpg": "85dd4c56672bead41bc6a94c5d2893a0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "50bcedb7f412078f61febe324eb5675c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f70928aaa4a125b88e5870622105e37c",
"/": "f70928aaa4a125b88e5870622105e37c",
"main.dart.js": "b774d4ef71664e69957d84aefe83e787",
"manifest.json": "2e5afb3ca558d9315eb353401b068a44",
"version.json": "3c471181ea24c59da5d9693831b7beec"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
