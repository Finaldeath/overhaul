//::///////////////////////////////////////////////
//:: Know Goblin Caves
//:: act_ser_knwgob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about the goblin caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oDoor = GetObjectByTag("q1ab_at_q3ag");
    object oMap = GetObjectByTag("q1ab_mn_serahcave");
    SetMapPinEnabled(oMap,1);
    SetLocked(oDoor,FALSE);
    if(GetLocalInt(oPC,"os_serahcaves")==0)
    {
        SetLocalInt(oPC,"os_serahcaves",10);
    }
}
