//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Reaper Has Been Named (Condition Script)
//:: H2c_Gruul_Reaper.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     the Reaper's True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_GatekeeperNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

