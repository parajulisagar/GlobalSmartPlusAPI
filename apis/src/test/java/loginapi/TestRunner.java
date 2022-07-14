package loginapi;
import com.intuit.karate.junit5.Karate;

public class TestRunner {
	@Karate.Test
	Karate getAPITest() {
		return Karate.run("simple").relativeTo(getClass());
	}
	@Karate.Test
	Karate postAPITest() {
		return Karate.run("randomemail").relativeTo(getClass());
	}
	@Karate.Test
	Karate deleteAPITest() {
		return Karate.run("deleteuser").relativeTo(getClass());
	}
	@Karate.Test
	Karate chainingAPITest() {
		return Karate.run("apichaining").relativeTo(getClass());
	}
}
