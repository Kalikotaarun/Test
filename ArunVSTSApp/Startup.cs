using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ArunVSTSApp.Startup))]
namespace ArunVSTSApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
