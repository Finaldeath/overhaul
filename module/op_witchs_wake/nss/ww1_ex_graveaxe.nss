//::///////////////////////////////////////////////
//:: Witc's Wake 1: Grave Axe Trigger (OnExit)
//:: WW1_Ex_GraveAxe.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Punish any paladins that try to steal grave
     axe.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 26, 2004
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetExitingObject();
    int bGraveAxeFall = GetLocalInt(oPC, "bGraveAxeFall");
    object oGraveAxe = GetItemPossessedBy(oPC, "ww1_graveaxe");

    if (bGraveAxeFall == FALSE &
        oGraveAxe != OBJECT_INVALID)
    {
        PaladinFalls(oPC);
        SetLocalInt(oPC, "bGraveAxeFall", TRUE);
    }
}
