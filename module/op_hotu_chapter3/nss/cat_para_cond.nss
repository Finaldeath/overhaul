//::///////////////////////////////////////////////
//:: Catapults!: Paralyzation Condition Script
//:: Cat_Parar_Cond.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE the catapult is currently
    PARALYZED.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bParalyzed = GetLocalInt(OBJECT_SELF, "bParalyzed");

    if (bParalyzed == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
