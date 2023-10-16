//::///////////////////////////////////////////////
//:: q2_hb_candelabra
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Heartbeat script for Candelabra
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLocalObject(OBJECT_SELF,"OS_PC_CANDELABRA");
    if(GetLocalInt(OBJECT_SELF,"OS_CANDELABRA")==10)
    {
        ClearAllActions();
        ActionForceMoveToObject(oPC,FALSE,2.0);
    }
}
