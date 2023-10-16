//::///////////////////////////////////////////////
//:: Sensei Dharvana, PC has learned her True Name (Condition Script)
//:: H2c_Sens_Named.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     the Sensei's True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_SenseiNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
