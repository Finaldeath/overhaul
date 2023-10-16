//::///////////////////////////////////////////////
//:: Lazy the Imp, Asleep (Condition Script)
//:: H2c_Lazy_Asleep.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Lazy is currently asleep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAwake = GetLocalInt(OBJECT_SELF, "bAwake");

    if (bAwake == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
