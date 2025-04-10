package io.loopcamp.tests;

import com.intuit.karate.junit5.Karate;

public class KarateRunner {
    @Karate.Test
    public Karate runMinionTag() {
        return new Karate().relativeTo(getClass());
        // TODO: If you want to add tags like we did in CukesRunner you can do here as well.
        // TODO: Basically you can do anything you do with your other framework here as well. like in CI/CD pipeline,cross-browser or parallel execution and etc.
        // return Karate.run("get_minions").tags("minion").relativeTo(getClass());
    }
}
