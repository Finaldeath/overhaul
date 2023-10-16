//::///////////////////////////////////////////////
//:: Name q2betraycurse
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The curse of the Valsharess - if the PC has
    promised to betray the rebels and then doesn't
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner/ Georg Zoeller
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////
#include "x2_inc_itemprop"

void main()
{
   object oPC =  OBJECT_SELF;
   object oRobe = GetItemInSlot(INVENTORY_SLOT_CHEST,oPC);

   FloatingTextStrRefOnCreature(85588,oPC);

   // We have the robe of the Valsharess equipped
   if (GetIsObjectValid(oRobe) && GetTag(oRobe) == "x2_dreamrobe")
   {
        // make sure its worthless
        IPRemoveAllItemProperties(oRobe,DURATION_TYPE_PERMANENT);
        // Curse the player for defying our deal
        effect eCurse = EffectCurse(0,0,0,5,5,5);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eCurse, oPC);
   }
   else
   {
        // even if the robe is not equipped, make sure the player can
        // not sell it
        oRobe = GetItemPossessedBy(oPC,"x2_dreamrobe");
        if (GetIsObjectValid(oRobe))
        {
            IPRemoveAllItemProperties(oRobe,DURATION_TYPE_PERMANENT);
        }
   }
}

