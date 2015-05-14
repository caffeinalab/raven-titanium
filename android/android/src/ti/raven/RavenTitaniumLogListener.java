package ti.raven;


import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.KrollLogging;
import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.common.Log;

import net.kencochrane.raven.event.Event;
import net.kencochrane.raven.event.EventBuilder;

public class RavenTitaniumLogListener implements KrollLogging.LogListener
{

	public RavenTitaniumLogListener()
	{
		super();
	}

	@Override
	public void onLog(int severity, String msg) {
		if (RavenTitaniumModule.client == null) return;
		if (severity != KrollLogging.CRITICAL && severity != KrollLogging.FATAL && severity != KrollLogging.ERROR) return;

		Event.Level level = (severity == KrollLogging.FATAL) ? Event.Level.FATAL : Event.Level.ERROR;
		EventBuilder eventBuilder = new EventBuilder();
		eventBuilder.setMessage(msg);
		eventBuilder.setLevel(level);
		RavenTitaniumModule.client.sendEvent(eventBuilder.build());
	}

}

