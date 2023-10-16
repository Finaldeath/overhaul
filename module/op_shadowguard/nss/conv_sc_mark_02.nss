#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    AddJournalSingle("JT_ST_0_MAIN", 9, oPC);

    object oLyen = GetNearestObjectByTag("CT_UNIQ_SG_LYEN");

    object oWP = GetNearestObjectByTag("WP_EXIT");

    object o;

    o = OBJECT_SELF;
    AssignCommand(o, ActionMoveToObject(oWP, TRUE));
    DestroyObject(o, 4.0);

    o = oLyen;
    AssignCommand(o, ActionMoveToObject(oWP, TRUE));
    DestroyObject(o, 4.0);

    object oDoor = GetNearestObjectByTag("DOOR_010_1_1");

    SetLocked(oDoor, FALSE);

    DelayCommand(3.8, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
}
