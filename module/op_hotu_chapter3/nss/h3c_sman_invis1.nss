//::///////////////////////////////////////////////
//:: Sleeping Man, Invisible Object Do Once (Condition Script)
//:: H3c_SMan_Invis1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this line is being spoken by
     an invisible object and has not been spoken
     before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 26, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bObjectType = GetObjectType(OBJECT_SELF);
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bDoOnce = GetLocalInt(oMan, "bInvisDoOnce");
    if (bObjectType == OBJECT_TYPE_PLACEABLE &&
        bDoOnce == FALSE)
    {
        SetLocalInt(oMan, "bInvisDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
