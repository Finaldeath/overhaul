#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();


    object oWP = GetNearestObjectByTag("WP_LYON_MAN_2");
    location lWP = GetLocation(oWP);

    object o;

    o = GetNearestObjectByTag("CT_UNIQ_EG_TARG", oPC);

    SetLocalInt(o, "N_DONT_SPEAK", 1);
    AssignCommand(o, ActionMoveToLocation(lWP));
    DestroyObject(o, 3.0);

    o = GetNearestObjectByTag("CT_UNIQ_EG_LARS", oPC);

    SetLocalInt(o, "N_DONT_SPEAK", 1);
    AssignCommand(o, ActionMoveToLocation(lWP));
    DestroyObject(o, 3.0);

    AddJournalSingle("JT_MAIN", 7, oPC);
    AddJournalSingle("JT_TARGAS", 2, oPC);

}
