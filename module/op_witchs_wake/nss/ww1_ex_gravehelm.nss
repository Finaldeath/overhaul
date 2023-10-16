//::///////////////////////////////////////////////
//:: Witc's Wake 1: Grave Helm Trigger (OnExit)
//:: WW1_Ex_GraveHelm.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Punish any paladins that try to steal the
     grave helm.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 26, 2004
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetExitingObject();
    int bGraveHelmFall = GetLocalInt(oPC, "bGraveHelmFall");
    object oGraveHelm = GetItemPossessedBy(oPC, "ww1_gravehelm");

    if (bGraveHelmFall == FALSE &
        oGraveHelm != OBJECT_INVALID)
    {
        PaladinFalls(oPC);
        SetLocalInt(oPC, "bGraveHelmFall", TRUE);
    }
}
