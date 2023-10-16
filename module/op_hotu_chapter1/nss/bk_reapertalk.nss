//::///////////////////////////////////////////////
//:: bk_reapertalk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The reaper will talk to the player when
    they step onto this.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
    {
        return;
    }
    object oGatekeeper = GetNearestObjectByTag("x2reaper", oPC);
    if (GetIsObjectValid(oGatekeeper) == TRUE)
    {
        AssignCommand(oGatekeeper, DelayCommand(3.0, ActionStartConversation(oPC)));
    }
    DestroyObject(OBJECT_SELF, 0.5);
}
