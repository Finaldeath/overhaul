//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Leak Condition
//:: WW_EtherealLeakC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this Ethereal Leak has not
     already been activated previously.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bUsed = GetLocalInt(OBJECT_SELF, "bUsed");

    if (bUsed == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
