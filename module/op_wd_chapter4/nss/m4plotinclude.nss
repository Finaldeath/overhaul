//::///////////////////////////////////////////////
//:: M4PlotInclude.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the plot include for Chapter 4
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////

int HasWordOfPower(object oThing)
{
    return GetIsObjectValid(GetItemPossessedBy(oThing, "MPlUsWordofPoQ6"));
}
void DestroyWordOfPower(object oThing)
{
    if (HasWordOfPower(oThing) == TRUE)
    {
       DestroyObject(GetItemPossessedBy(oThing, "MPlUsWordofPoQ6"));
    }
}

//::///////////////////////////////////////////////
//:: GetHasQuillAndInk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:     Brent
//:: Created On:     Febuary 2002
//:://////////////////////////////////////////////
int GetHasQuillAndInk(object oPC)
{
    if (GetIsObjectValid(GetItemPossessedBy(oPC,"M4Q1C16_INKWELL")) &&
        GetIsObjectValid(GetItemPossessedBy(oPC,"M4Q1C16_QUILL"))
        )
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: ResetPastLife
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void ResetPastLife(object oPC, int Deja=FALSE)
{
   if (Deja == TRUE)
   {
    SetLocalInt(oPC, "NW_L_M4Q01TALKDEJAVU",GetLocalInt(oPC, "NW_L_M4Q01TALKDEJAVU") + 1);
   }
   SetLocalInt(oPC, "NW_L_TALKPAST",0);
   SetLocalInt(oPC, "NW_L_RAVENCHECK", 0);
   SetLocalInt(oPC, "NW_L_TALKSPY",0);

   int nValue = GetLocalInt(GetModule(), "NW_G_WRITENOTE");
   if (nValue == 1 || nValue == 3)
   {
    SetLocalInt(GetModule(), "NW_G_WRITENOTE", 2);
   }

   object oChest = GetObjectByTag("M4Q1C15_BULL");
   if (GetIsObjectValid(oChest) == TRUE)
   {
    // * if no bull's strength potion then create one
    if (GetIsObjectValid(GetItemPossessedBy(oChest, "NW_IT_MPOTION015")) == FALSE)
    {
       CreateItemOnObject("NW_IT_MPOTION015", oChest);
    }
   }
   oChest = GetObjectByTag("M4Q1C15_INK");
   if (GetIsObjectValid(oChest) == TRUE)
   {
    // * if no inkwell then create one
    if (GetIsObjectValid(GetItemPossessedBy(oChest, "M4Q1C16_INKWELL")) == FALSE)
    {
       CreateItemOnObject("M4Q1C16_INKWELL", oChest);
    }
   }
   oChest = GetObjectByTag("M4Q1C15_QUILL");
   if (GetIsObjectValid(oChest) == TRUE)
   {
    // * if no quill then create one
    if (GetIsObjectValid(GetItemPossessedBy(oChest, "M4Q1C16_QUILL")) == FALSE)
    {
       CreateItemOnObject("M4Q1C16_QUILL", oChest);
    }
    // * if no key then create one
    if (GetIsObjectValid(GetItemPossessedBy(oChest, "M4Q1C14_MKEY")) == FALSE)
    {
       CreateItemOnObject("M4Q1C14_MKEY", oChest);
    }
   }
      oChest = GetObjectByTag("M4Q1C15_LOCK");
   if (GetIsObjectValid(oChest) == TRUE)
   {
    // * if no lockpicks then create one
    if (GetIsObjectValid(GetItemPossessedBy(oChest, "NW_IT_PICKS004")) == FALSE)
    {
       CreateItemOnObject("NW_IT_PICKS004", oChest);
    }
   }

}

//::///////////////////////////////////////////////
//:: StripAllEquipment
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Moves all equipment from oPC to the specified container
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void StripAllEquipmentTo(object oPC, object oContainer)
{
    object oItem = GetFirstItemInInventory(oPC);
    // * get rid of unequipped items
    while (GetIsObjectValid(oItem) == TRUE)
    {
        AssignCommand(oContainer, ActionTakeItem(oItem, oPC));
     //   DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);

    }
    // * get rid of equipped items
    int i = 0;
    for (i=INVENTORY_SLOT_HEAD; i<=INVENTORY_SLOT_BULLETS; i++)
    {
        oItem = GetItemInSlot(i, oPC)   ;
        if (GetIsObjectValid(oItem) == TRUE)
        {
              AssignCommand(oContainer, ActionTakeItem(oItem, oPC));
       //     DestroyObject(oItem);
        }
    }
}

//::///////////////////////////////////////////////
//:: FollowPlayer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Follows the nearest player if not in combat
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void FollowPlayer(object oFollow=OBJECT_INVALID)
{
    if (!GetIsInCombat() && !IsInConversation(OBJECT_SELF))
    {
        // *
        // * If no object is passed in then follow the nearest player
        // *
        object oPC;
        if (oFollow == OBJECT_INVALID)
        {
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        }
        else
        {
            oPC = oFollow;
        }
        ActionForceMoveToObject(oPC, TRUE, 8.0, 5.0);
    }

}
