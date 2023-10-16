//::///////////////////////////////////////////////
//:: Witch Wake 1: WW Handler, No Target C
//:: WW_WWH_NoTarget.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Handler was used on an
     invalid target.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");

    if (oTarget == OBJECT_INVALID ||
        GetObjectType(oTarget) != OBJECT_TYPE_CREATURE)
    {
        return TRUE;
    }
    return FALSE;
}
