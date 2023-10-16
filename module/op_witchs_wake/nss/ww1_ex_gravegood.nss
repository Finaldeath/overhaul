//::///////////////////////////////////////////////
//:: Witc's Wake 1: Grave Goods Trigger (OnExit)
//:: WW1_Ex_GraveGood.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Punish any paladins that try to steal grave
     goods.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 26, 2004
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetExitingObject();
    int bGraveGoodsFall = GetLocalInt(oPC, "bGraveGoodsFall");
    object oGraveHelm = GetItemPossessedBy(oPC, "ww1_gravehelm");
    object oGraveAxe = GetItemPossessedBy(oPC, "ww1_graveaxe");
    object oGraveSword = GetItemPossessedBy(oPC, "ww1_gravesword");

    if (bGraveGoodsFall == FALSE &
        (oGraveHelm != OBJECT_INVALID ||
         oGraveAxe != OBJECT_INVALID ||
         oGraveSword != OBJECT_INVALID))
    {
        PaladinFalls(oPC);
        SetLocalInt(oPC, "bGraveGoodsFall", TRUE);
    }
}
