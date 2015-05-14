package ti.raven;

import org.appcelerator.kroll.KrollExceptionHandler;

import net.kencochrane.raven.event.Event;
import net.kencochrane.raven.event.EventBuilder;

public class RavenTitaniumExceptionHandler implements KrollExceptionHandler
{
	public RavenTitaniumExceptionHandler()
	{
		super();
	}

	@Override
	public void handleException(ExceptionMessage ex) {
		if (RavenTitaniumModule.client == null) return;

		EventBuilder eventBuilder = new EventBuilder();
		eventBuilder.setMessage(ex.message);
		eventBuilder.setLevel(Event.Level.FATAL);
		eventBuilder.addExtra("title", ex.title);
		eventBuilder.addExtra("sourceName", ex.sourceName);
		eventBuilder.addExtra("line", ex.lineSource + " - " + ex.line + " : " + ex.lineOffset);

		RavenTitaniumModule.client.sendEvent(eventBuilder.build());
	}
}

