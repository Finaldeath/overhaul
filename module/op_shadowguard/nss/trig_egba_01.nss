#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object o = GetNearestObjectByTag("CT_UNIQ_NT_EGBA", oPC);

        SceneSpeak(o, "C'mon, ye maggots!  We got a whole lot more of this filth to clear out before ye can start slackin' off!  Now get yerselves back to work!");
    }
}
