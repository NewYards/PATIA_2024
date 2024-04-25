package sokoban;

public class Case {
    String name;
    boolean free;
    boolean pusher;
    boolean walled;
    String box;
    boolean target;

    public Case(String name, boolean free, boolean pusher, boolean walled, String box, boolean target)
    {
        this.name = name;
        this.free = free;
        this.pusher = pusher;
        this.walled = walled;
        this.box = box;
        this.target = target;
    }

    public String getName() {
        return name;
    }

    public boolean isFree() {
        return free;
    }

    public boolean isPusher() {
        return pusher;
    }

    public boolean isWalled() {
        return walled;
    }

    public String getBox() {
        return box;
    }

    public boolean isTarget() {
        return target;
    }
}
