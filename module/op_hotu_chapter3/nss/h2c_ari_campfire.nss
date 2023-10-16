//::///////////////////////////////////////////////
//:: Aribeth, Campfire (Condition Script)
//:: H2c_Ari_Campfire.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the conversation is held by
     a placeable object and Aribeth is not yet
     thawed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iObjectType = GetObjectType(OBJECT_SELF);
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bThawed = GetLocalInt(oAribeth, "bThawed");
    if (iObjectType == OBJECT_TYPE_PLACEABLE &&
        bThawed == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
