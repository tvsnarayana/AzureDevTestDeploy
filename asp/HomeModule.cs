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
            var uri = "http://tutorialstage.cloudapp.net:8080/JerseyHelloWorld/rest/helloworld";
            httpClient.DefaultRequestHeaders.UserAgent.Add(new ProductInfoHeaderValue("MyClient", "1.0"));
            var result = await httpClient.GetStringAsync(uri);
            return result;
        }
    }
}
