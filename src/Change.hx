// -*- mode:java; tab-width:4; c-basic-offset:4; indent-tabs-mode:nil -*-

class Change {
    // toy
    public var change : String;
    public var parent : Datum;
    public var local : Datum;
    public var remote : Datum;
    public var mode : ChangeType;

    public function new(?txt : String) : Void {
        if (txt!=null) {
            mode = NOTE_CHANGE;
            change = txt;
        } else {
            mode = NO_CHANGE;
        }
    }

    public function toString() : String {
        return switch(mode) {
        case NO_CHANGE: "no change";
        case LOCAL_CHANGE: "local change: " + remote + " -> " + local;
        case REMOTE_CHANGE: "remote change: " + local + " -> " + remote;
        case BOTH_CHANGE: "conflicting change: " + parent + " -> " + local + " / " + remote;
        case SAME_CHANGE: "same change: " + parent + " -> " + local + " / " + remote;
        case NOTE_CHANGE: change;
        }
    }
}