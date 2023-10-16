#include "help_general"

void main()
{
    object o = GetLastUnlocked();

    int nLocks = GetLocalInt(OBJECT_SELF, "N_LOCKS");

    nLocks++;

    if ((5 - nLocks) > 0)
    {
        SetLocalInt(OBJECT_SELF, "N_LOCKS", nLocks);

        SceneSpeak(OBJECT_SELF, "[" + IntToString(nLocks) + " of the 5 locks guarding the door have been overcome, but it still remains tightly closed...]");

        SetLocked(OBJECT_SELF, TRUE);
    }

    else
    {
        SetLocalInt(GetModule(), "N_ST_1_GH_GH_DOOR_OPEN", 1);
        SceneSpeak(OBJECT_SELF, "[With a click, the last lock guarding the door falls to the ground, leaving the Grand Hall open for entry...]");
    }
}
