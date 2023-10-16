//::///////////////////////////////////////////////
//:: Sleeping Man, Invisible Object 2nd Time Talked To (Condition Script)
//:: H3c_SMan_Invis2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this line is being spoken by
     an invisible object.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 26, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bObjectType = GetObjectType(OBJECT_SELF);
    if (bObjectType == OBJECT_TYPE_PLACEABLE)
    {
        return TRUE;
    }
    return FALSE;
}
