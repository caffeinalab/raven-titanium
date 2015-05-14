package ti.raven;

import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.KrollRuntime;
import org.appcelerator.kroll.KrollLogging;
import org.appcelerator.kroll.annotations.Kroll;

import net.kencochrane.raven.Raven;
import net.kencochrane.raven.RavenFactory;
import net.kencochrane.raven.DefaultRavenFactory;


@Kroll.module(name="RavenTitanium", id="ti.raven")
public class RavenTitaniumModule extends KrollModule
{

	public static Raven client = null;

	public RavenTitaniumModule()
	{
		super();
	}

	@Kroll.method
	public void initialize(String dsn)
	{
		RavenFactory.registerFactory(new DefaultRavenFactory());
		client = RavenFactory.ravenInstance(dsn);

		KrollRuntime.addAdditionalExceptionHandler(new RavenTitaniumExceptionHandler(), "raven");
		KrollLogging.getDefault().setLogListener(new RavenTitaniumLogListener());
	}

	@Kroll.method
	public void log(String message) {
		if (client == null) return;
		client.sendMessage(message);
	}

}

