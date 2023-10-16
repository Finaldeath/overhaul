//::///////////////////////////////////////////////
//:: Generic Devils, Slaadi Quarry Slave (Condition Script)
//:: H2c_Devils_Slaad.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC is a Slaadi Quarry
     Slave.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sTag = GetTag(OBJECT_SELF);
    if (sTag == "H2_Devil_Slaad")
    {
        return TRUE;
    }
    return FALSE;
}
