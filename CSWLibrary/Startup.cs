using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CSWLibrary.Startup))]
namespace CSWLibrary
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
