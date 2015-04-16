// ajax 모듈 파일 (ajax.js)

var httpRequest = null;

	function getXMLHttpRequest(){
			if(window.ActiveXObject){
				try{
					return new ActiveXObject("MSXML2.XMLHTTP");
					}
				catch(e){
					return new ActiveXObject("Microsoft.XMLHTTP");
					}
				}
			else if(window.XMLHttpRequest){
				return new XMLHttpRequest();
			}
			else{
				return null;
			}
		}

	function sendRequest(url, params, callback, method){
	
		httpRequest = getXMLHttpRequest();
		
		var httpMethod = method ? method : "GET"; // true method, false면 "GET"
			if(httpMethod != "GET" && httpMethod != "POST"){
				httpMethod = "GET";
				}

			var httpParams = (params == null || params == "") ? null : params; // true면 null, false params

			var httpUrl = url;
			if(httpMethod == "GET" && httpParams != null){
				httpUrl = httpUrl + "?" + httpParams;
				}

			httpRequest.open(httpMethod, httpUrl, true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charaset=UTF-8");
			httpRequest.onreadystatechange = callback;
			httpRequest.send(httpMethod == "POST" ? httpParams : null);	
	}                                                                 