'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "29292e3ff4d43cceee9e6b9cd6b3a4ba",
"index.html": "cee228d99936791baed01ca4599e216c",
"/": "cee228d99936791baed01ca4599e216c",
"main.dart.js": "e47ba55949571a9de9df93feb54acae4",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "b510ffb49e0be181de2c08b55128c240",
"icons/Icon-192.png": "4db750474e0188413f9ae94ef2d3728b",
"icons/Icon-maskable-192.png": "4db750474e0188413f9ae94ef2d3728b",
"icons/Icon-maskable-512.png": "289b9c39fa784b8f20c43f44c656715f",
"icons/Icon-512.png": "289b9c39fa784b8f20c43f44c656715f",
"manifest.json": "71e8ef17d1f88a131b03d999214beedc",
".git/config": "4a015d2c785cb325e8db2aaff9f8aaa7",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/57/d492fbc5e03ce6dfd9d69a60b2c4d7839d6607": "ff17a9562b37a679cb881bcc61f9f2be",
".git/objects/3c/b3b53a24ee4712b8463133dca203ddd72fb43b": "c3066eae2c84f5465b93f0624f5ecfa6",
".git/objects/3d/d7945dd6e5475452e5791b061071b6c84a90f3": "86b88caf748e6486ca15d5fd938ca5f5",
".git/objects/3d/2dda9ff55a042571611a637dd74fc75fa51a32": "721b27e8978cdfe0414b9f8550986773",
".git/objects/67/708abd81d47c16ce17cb23bd6e53b997de51f8": "1e194bf7a14ac796bd28390711c2a304",
".git/objects/0e/7f94a258e35280b840ce4b92eeae746ff2fbb4": "8195046ab4112c03ba9f79d4fd6a96f0",
".git/objects/ac/dff003233d90b91aebe67dcd38d5049aacda7b": "6fea100e06e06948e49143e92be1a8dd",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f5/4e2e5db5cf94fdffaa5e9b78d7f5d8fb174c14": "07dd0ff46ebb7eda2bdc11bc61073533",
".git/objects/fb/80ea06dbe8e04d13dd40896297a40dba439f70": "910349376acba8f01bd6501260803d44",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/11/ebe0abf0e894a859e0fb58e7eae195cda45183": "a448adc1da0456db701dc50d773d932a",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/29/8c2ac732ea195a1f89b0c57738fee4d7d53a29": "773248694061b5ccaf200bd2a4c3a921",
".git/objects/1f/6aa86c1e08e3bffea4cafb26385a7dda309f88": "97056bbb082e371c53cbab9dae3c0bca",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/10/f620e09f682d65505abccf56a687c069b465d1": "d27c71303ecb1c7c05c84f71d0b77ba3",
".git/objects/4c/8389d2c7b2393a012b797a6af67defa8630546": "581a2f97aebe0e2520d2d9c07b2d8078",
".git/objects/72/fd1e4fc824d93c89a87860c62d6fffa6cc019a": "a7e427c04685af08c2930f3496740ee1",
".git/objects/43/4b36f899fbc96714a8ae39fb0a54966c583218": "a11522081572653047c54edb06fca403",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/53/92d6d44d66f822bff262348c607b4c1f9574b1": "2dd08744cbfd4d140c680a80735610f8",
".git/objects/6d/a752e0c689def8fb58d1a8a6146136ddac9c72": "2023984fd91861a88ff0fa6240faf549",
".git/objects/6c/0c89293f87e1608a9ba6916285e2b3443bf91d": "75fa8483f1ae6289a5677e3653a212ea",
".git/objects/39/378a622ca45bb56d0fd02abb577aba55f9e4c2": "7735202da40a71aa08cced56e79fda25",
".git/objects/a7/881e6949f3e47f0cffd33753a0445886b5ca71": "48649c4ecf3ae89de3f7a865302122fa",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/de/1310565e96824b318361867d4aba46689f3e8a": "dd32e3b7ef84726b65b36cc6b42436e8",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/ef/23e12ae99715cb9b6d2187ea8c170d38894c77": "6e11e429da0a3c6b7c20a0029060a776",
".git/objects/cd/22076013ce8b84475eae9bb4cd6c60b5460fbe": "81c620e2d6cbe5638d6c90ee25886389",
".git/objects/ff/80ea98570eb2aad01a94584c9d3f03836f604f": "117766f3cfb5d76d30bebe4c661bf6c1",
".git/objects/c5/c97d61f79f218200829ffb86aa7fa098902fe2": "39af346a76f30a6a03b3e55ffb5381c1",
".git/objects/f6/7f533074037ae0ff3c9f882bd9dbee9c7915c8": "b1395f4be24ccdf3f3dd5ce4d85e2c2b",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/cb/3efb2915d3d59014bf8f6da04df7eb0034d34a": "26bfa8d23bbd124c791c512aded8987e",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/12/15a709e679bee1a340e8e8cc7874dfa3228c39": "a07805504d4040109595a5b8c2c00639",
".git/objects/8c/a540664c463b97f585e67c72202fb87cebf3ca": "81693c1f232a6edeb6fd2842bcf5a3c1",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/8e/de6f4ad2c98c5cecb3c3d9748bcb00c9712782": "8cbab6da3005ef8a4dfdb9fc20d36975",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "1da77df0974571eb3954257614ee398d",
".git/logs/refs/heads/main": "05c3332b6c525505fb9431cee76dfbfc",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "6ac6cdbdc562cc74cf3f2bac92484aec",
".git/index": "a1da6560b7bf6a9e8638ee72686ce39c",
".git/COMMIT_EDITMSG": "ced50175170d6f274de6934592c4cf1b",
"assets/AssetManifest.json": "1ebd20f2cb555fd87c48f46f5d39a81e",
"assets/NOTICES": "4fc58b4242d337891724bb1e1b519f05",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/cool_alert/assets/flare/warning_check.flr": "ff4a110b8d905dedb4d4639a17399703",
"assets/packages/cool_alert/assets/flare/loading.flr": "b6987a8e6de74062b8c002539d2d043e",
"assets/packages/cool_alert/assets/flare/info_check.flr": "f6b81c2aa3ae36418c13bfd36d11ac04",
"assets/packages/cool_alert/assets/flare/success_check.flr": "9d163bcc6f6b58566e0abde7761a67a0",
"assets/packages/cool_alert/assets/flare/error_check.flr": "d9f54791d0d79935d22206966707e4b3",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/map_style.txt": "0e0308b3b7ea62e4134885754a192228",
"assets/assets/images/biji.png": "ba24af56414d113b569a1df58a39648b",
"assets/assets/images/logo.png": "8e4b6f25449e40be34d02dded564d664",
"assets/assets/images/jaison.png": "77f97eec7f9b970731470bf5e551f40d",
"assets/assets/images/police.png": "1c209ab0963d6f6004453327950ccd8d",
"assets/assets/images/rain.png": "48490eba6d5fcabf149a982865a9caef",
"assets/assets/images/loginBG.jpeg": "f22a4b866669046441237d2365da0785",
"assets/assets/images/bg.jpg": "3e30f1fdb9778b1d57fa5e6c572bc492",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
