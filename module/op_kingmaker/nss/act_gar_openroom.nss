//::///////////////////////////////////////////////
//:: PC Rents Room
//:: act_gar_openroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC rents a room from Garrot
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor1 = GetObjectByTag("q2_pcsilver");
    object oDoor2 = GetObjectByTag("q2ac16a_at_q2ac16b");

    SetLocked(oDoor1, FALSE);
    SetLocked(oDoor2, FALSE);

    SetLocalInt(OBJECT_SELF,"OS_SILVER_ROOM",10);
}
