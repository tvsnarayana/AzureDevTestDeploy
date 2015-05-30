#define Staging

using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;

namespace asp
{
    using Nancy;
    
    public class HomeModule : NancyModule
    {
        public HomeModule()
        {            
            Get["/", true] = async (parameters, ct) => await GetRestData(ct);
        }
    
        private async Task<String> GetRestData(CancellationToken ct)
        {
            var httpClient = new HttpClient();
            var result = "<h1>ASP application<h1>";
            var uri = "http://tutorialstage.cloudapp.net/JerseyHelloWorld/rest/helloworld";

            #if Staging
              result = result + "<h2>Staged version</h2>";
              uri = "http://tutorialstage.cloudapp.net:5050/JerseyHelloWorld/rest/helloworld";
            #endif

            httpClient.DefaultRequestHeaders.UserAgent.Add(new ProductInfoHeaderValue("MyClient", "1.0"));
            result = result + "<p><a href='http://tutorialstage.cloudapp.net:5050/JerseyHelloWorld/rest/helloworld'>Java API</a> says: ";
            result = result + await httpClient.GetStringAsync(uri) + "<p>";
            return result;
        }
    }
}
