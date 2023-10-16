//::///////////////////////////////////////////////
//:: Henchman Death Script
//::
//:: NW_CH_AC7.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:: <description>
//:://////////////////////////////////////////////
//::
//:: Created By:
//:: Modified by:   Brent, April 3 2002
//::                Removed delay in respawning
//::                the henchman - caused bugs
//:: Modified November 14 2002
//::  - Henchem will now stay dead. Need to be raised
//:://////////////////////////////////////////////

//::///////////////////////////////////////////////
//:: Greater Restoration
//:: NW_S0_GrRestore.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Removes all negative effects of a temporary nature
    and all permanent effects of a supernatural nature
    from the character. Does not remove the effects
    relating to Mind-Affecting spells or movement alteration.
    Heals target for 5d8 + 1 point per caster level.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 7, 2002
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001
#include "nw_i0_generic"
#include "nw_i0_plot"



void main()
{
    // * This is used by the advanced henchmen
    // * Let Brent know if it interferes with animal
    // * companions et cetera
    // Destroy controlling amulet
    object oMaster = GetMaster(OBJECT_SELF);
    if(oMaster == OBJECT_INVALID)
        oMaster = GetLocalObject(OBJECT_SELF, "MASTER");
    if(oMaster == OBJECT_INVALID)
        oMaster = GetFirstPC();

    object oAmulet;
    oAmulet = GetItemPossessedBy(oMaster, "q4d_GolemAmulet2");
    if(oAmulet == OBJECT_INVALID)
        oAmulet = GetObjectByTag("q4d_GolemAmulet2");


    SetPlotFlag(oAmulet, FALSE);
    DestroyObject(oAmulet);

    if (GetAssociateType(OBJECT_SELF) == ASSOCIATE_TYPE_HENCHMAN)
    {
       SetLocalInt(OBJECT_SELF, "X2_L_IJUSTDIED", 10);
    }
    RemoveHenchman(GetMaster(), OBJECT_SELF);
}


