//::///////////////////////////////////////////////
//:: Witc's Wake 1: Grave Swords Trigger (OnExit)
//:: WW1_Ex_GraveSwrd.nss
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
    int bGraveSwordsFall = GetLocalInt(oPC, "bGravSwordsFall");
    object oGraveSword = GetItemPossessedBy(oPC, "ww1_gravesword");

    if (bGraveSwordsFall == FALSE &
        oGraveSword != OBJECT_INVALID)
    {
        PaladinFalls(oPC);
        SetLocalInt(oPC, "bGraveSwordsFall", TRUE);
    }
}
