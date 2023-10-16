//::///////////////////////////////////////////////
//:: Name: q2a_wellopen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Durnan will now allow the well to be used...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 29/02
//:://////////////////////////////////////////////

void main()
{
    object oWrit = GetObjectByTag("KhelbensWrit");
    SetLocalInt(GetModule(), "NW_WELLROOMOPEN", 10);
    ActionTakeItem(oWrit,GetPCSpeaker());
}
