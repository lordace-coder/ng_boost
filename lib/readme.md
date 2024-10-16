   function openApp() {
            var androidPackage = 'com.example.ngboost';
            var iosUrlScheme = 'ngboost://';
            var downloadUrl = 'https://example.com/download'; // Your app's download page

            var fallbackTimer;
            
            function clearFallbackTimer() {
                clearTimeout(fallbackTimer);
            }

            function handleAndroid() {
                window.location.href = 'intent://#Intent;scheme=ngboost;package=' + androidPackage + ';end';
                fallbackTimer = setTimeout(function() {
                    window.location.href = downloadUrl;
                }, 2000);
            }

            function handleIOS() {
                window.location.href = iosUrlScheme;
                fallbackTimer = setTimeout(function() {
                    window.location.href = downloadUrl;
                }, 2000);
            }

            var userAgent = navigator.userAgent || navigator.vendor || window.opera;
            if (/android/i.test(userAgent)) {
                handleAndroid();
            } else if (/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream) {
                handleIOS();
            } else {
                window.location.href = downloadUrl;
            }

            window.onblur = clearFallbackTimer;
        }

        window.onload = openApp;
    