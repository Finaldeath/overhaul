//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, 30,000 Grinder Repair Price (Condition Script)
//:: H2c_Gruul_30000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has promised to pay
     30,000 gp for repair of Grinder 5
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iCost = GetLocalInt(OBJECT_SELF, "iGrinderRepairPrice");

    if (iCost == 30000)
    {
        return TRUE;
    }
    return FALSE;
}


