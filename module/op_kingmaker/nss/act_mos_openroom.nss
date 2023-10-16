//::///////////////////////////////////////////////
//:: Opens PC's Room
//:: act_mos_openroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the door to the pc's room
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    //If PC has 10 gold, unlock door, permanently
    SetLocalInt(OBJECT_SELF,"OS_MOSSYROOM",10);
    object oDoor1 = GetObjectByTag("q2_pcmossy");
    object oDoor2 = GetObjectByTag("q2ab14b_at_q2ab14a");
    object oDoor3 = GetObjectByTag("q2ab14a_at_q2ab14b");

    SetLocked(oDoor1, FALSE);
    SetLocked(oDoor2, FALSE);
    SetLocked(oDoor3, FALSE);
}
