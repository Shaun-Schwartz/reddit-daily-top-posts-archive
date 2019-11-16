const hostname = window.location.hostname;
var api_url;
if (hostname === 'localhost') {
  api_url = 'http://localhost:3000/api';
} else {
  api_url = 'https://topofreddit.shaunschwartz.com/api';
}
export const BASE_URL = api_url;
