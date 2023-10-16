//::///////////////////////////////////////////////
//:: Heartbeat
//:: m1s4Claudus_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Claudus talks to the PC after being defeated.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 31, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetItemPossessor(GetObjectByTag("M1S04IBADGELVL04"));
    if (GetIsObjectValid(oPC) &&
        GetLocalInt(OBJECT_SELF,"NW_L_Defeated") == 0 &&
        GetObjectSeen(oPC))
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Defeated",1);
        ActionStartConversation(oPC);
    }
}
