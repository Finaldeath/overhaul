// Pausanias's equipping code.

#include "magic_identify"

// Check to see if the item was successfully equipped.
void CheckIsEquipped(object oItem, int iSlot, string sDescr)
{

  object oWorn = GetItemInSlot(iSlot);

  if (oWorn != oItem) {
    if (oWorn == OBJECT_INVALID ||
 GetGoldPieceValue(oWorn) < GetGoldPieceValue(oItem))
      SpeakString("I was physically unable to equip the "+
    sDescr+"! I'll keep it in my backpack.");
    else
      SpeakString("I decided not to equip the "+sDescr+". It's in my backpack.");
  } else
    SpeakString("I managed to equip the "+sDescr+".");
}


// Equip an item in iSlot, or optionally in iOtherSlot if iSlot is full.
void EquipIfWorthIt(object oItem, int iSlot, string sDescr,
 int iOtherSlot=500)
{
    string sName;

    // These variables store the value of the most valuable
    // object in the NPC's inventory examined thus far. They are set
    // to -1 at the beginning of inventory control.
    string sSlotVar = "Invent"+IntToString(iSlot);
    string sSlotVarName = "InventName"+IntToString(iSlot);
    string sOtherVar = "Invent"+IntToString(iOtherSlot);
    int iStoredValue = GetLocalInt(OBJECT_SELF,sSlotVar);
    int iOtherValue = GetLocalInt(OBJECT_SELF,sOtherVar);
    int iNewValue = 0;

    // Don't want to reveal the object's name unless it's already
    // identified. Again, assign unidentified items a nominal value of 1.
    if (GetIdentified(oItem)) {
      sName = GetName(oItem);
      iNewValue = GetGoldPieceValue(oItem);
    }
    else {
      sName = "unidentified "+sDescr;
      iNewValue = 1;
    }

    // If we are already equipping something in the given slot, get its value.
    // Unidentified items have a nominal value of 1. Note: this only works with
    // items equipped before inventory control.
    if (iStoredValue == -1) {
      object oOld = GetItemInSlot(iSlot);
      if (GetIsObjectValid(oOld) && !GetLocalInt(oOld,"DestroyItem") &&
   oOld != GetLocalObject(OBJECT_SELF,"Decency")) {
        TalentIdentifyItem(oOld);
 //SpeakString(GetName(oOld)+GetName(oItem)+IntToString(GetGoldPieceValue(oOld))+
        //            " "+IntToString(GetGoldPieceValue(oItem)));
 if (GetIdentified(oOld)) {
   iStoredValue = GetGoldPieceValue(oOld);
          SetLocalString(OBJECT_SELF,sSlotVarName,GetName(oOld));
        }
 else {
   iStoredValue = 1;
          SetLocalString(OBJECT_SELF,sSlotVarName,"unidentifed "+GetName(oOld));
        }
 SetLocalInt(OBJECT_SELF,sSlotVar,iStoredValue);
      }
    }

    // If we already have considered an item of this type, we need to
    // juggle the inventory.
    if (iStoredValue >= 0) {

      // If we have another slot in which we can equip this item,
      // and if the item in the other slot is not better than the item in
      // the current iSlot, then run the function on that other slot.

      if (iNewValue > iOtherValue && iOtherSlot != 500)
 if (iOtherValue < iStoredValue) {
   EquipIfWorthIt(oItem,iOtherSlot,sDescr);
   return;
 }

      // If the item is better than what we had before, tell the player so and
      // store its value. Otherwise, tell the player and do nothing else.

      if (iNewValue > iStoredValue)
 SpeakString("I really like the "+sName+".");
      else if (iNewValue < iStoredValue) {
 SpeakString("I like my "+GetLocalString(OBJECT_SELF,sSlotVarName)+
                    " better than the "+sName+".");
 return;
      }
      else if (iStoredValue > 0)
        SpeakString("Hmmm, decisions, decisions...");
    }

    // Now attempt to equip the items, and after a suitable time, check
    // to see if the the attempt succeeds.
    SetLocalInt(OBJECT_SELF,sSlotVar,iNewValue);

    SetLocalString(OBJECT_SELF,sSlotVarName,sName);
    ActionDoCommand(ActionEquipItem(oItem,iSlot));
    DelayCommand(2.,CheckIsEquipped(oItem,iSlot,sName));

}

// Try to figure out what to do with an item.
void EquipItems(object oSource)
{

  int i;
  int nIdentify;
  object oItem;

  oItem = GetFirstItemInInventory(oSource);
  while (GetIsObjectValid(oItem))
  {
      if (oItem != GetLocalObject(oSource,"Decency"))
      {
       DelayCommand(0.3,EquipItems(oSource));
       return;
      }
      else
       oItem = GetNextItemInInventory(oSource);
   }

  DestroyObject(oSource,0.0);

  for (i = 0; i < NUM_INVENTORY_SLOTS; ++i)
    SetLocalInt(OBJECT_SELF,"Invent"+IntToString(i),-1);

  SetLocalInt(OBJECT_SELF,"GotAWeapon",FALSE);

  oItem = GetFirstItemInInventory();

  while (GetIsObjectValid(oItem)) {
    if (!GetLocalInt(oItem,"DestroyItem")) {
      TalentIdentifyItem(oItem);
      switch (GetBaseItemType(oItem)) {

      case BASE_ITEM_ARMOR:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_CHEST,"piece of armor");
        break;

      case BASE_ITEM_LARGESHIELD:
      case BASE_ITEM_SMALLSHIELD:
      case BASE_ITEM_TOWERSHIELD:
        SpeakString("Thanks for the shield... I'll try to use it well.");
        break;

      case BASE_ITEM_CLOAK:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_CLOAK,"cloak");
        break;

      case BASE_ITEM_BOOTS:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_BOOTS,"pair of boots");
        break;

      case BASE_ITEM_BRACER:
      case BASE_ITEM_GLOVES:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_ARMS,"handwear");
        break;

      case BASE_ITEM_HELMET:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_HEAD,"helmet");
        break;

      case BASE_ITEM_BELT:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_BELT,"belt");
        break;

      case BASE_ITEM_RING:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_LEFTRING,"ring",INVENTORY_SLOT_RIGHTRING);
        break;

      case BASE_ITEM_AMULET:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_NECK,"amulet");
        break;

        // These items are auto-equipped by the ActionEquipMostDamagingRanged() command
      case BASE_ITEM_ARROW:
      case BASE_ITEM_BULLET:
      case BASE_ITEM_BOLT:

        // These items are auto-equipped by the EquipAppropriateWeapons() command
      case BASE_ITEM_BATTLEAXE:
      case BASE_ITEM_CLUB:
      case BASE_ITEM_DAGGER:
      case BASE_ITEM_DART:
      case BASE_ITEM_DIREMACE:
      case BASE_ITEM_DOUBLEAXE:
      case BASE_ITEM_GREATAXE:
      case BASE_ITEM_GREATSWORD:
      case BASE_ITEM_HALBERD:
      case BASE_ITEM_HANDAXE:
      case BASE_ITEM_HEAVYCROSSBOW:
      case BASE_ITEM_HEAVYFLAIL:
      case BASE_ITEM_KAMA:
      case BASE_ITEM_KATANA:
      case BASE_ITEM_KUKRI:
      case BASE_ITEM_LIGHTCROSSBOW:
      case BASE_ITEM_LIGHTFLAIL:
      case BASE_ITEM_LIGHTHAMMER:
      case BASE_ITEM_LIGHTMACE:
      case BASE_ITEM_LONGBOW:
      case BASE_ITEM_LONGSWORD:
      case BASE_ITEM_MORNINGSTAR:
      case BASE_ITEM_QUARTERSTAFF:
      case BASE_ITEM_RAPIER:
      case BASE_ITEM_SCIMITAR:
      case BASE_ITEM_SHORTBOW:
      case BASE_ITEM_SHORTSPEAR:
      case BASE_ITEM_SHORTSWORD:
      case BASE_ITEM_SHURIKEN:
      case BASE_ITEM_SICKLE:
      case BASE_ITEM_SLING:
      case BASE_ITEM_THROWINGAXE:
      case BASE_ITEM_TWOBLADEDSWORD:
      case BASE_ITEM_WARHAMMER:

        // THESE SHOULD BE EDITED SO THAT THE HENCHMAN DEALS WITH THEM
        // PROPERLY. FOR NOW THEY ARE IGNORED
      case BASE_ITEM_CREATUREITEM:
      case BASE_ITEM_GEM:
      case BASE_ITEM_KEY:
      case BASE_ITEM_MAGICROD:
      case BASE_ITEM_MAGICSTAFF:
      case BASE_ITEM_MAGICWAND:
      case BASE_ITEM_POTIONS:
      case BASE_ITEM_SPELLSCROLL:
      case BASE_ITEM_THIEVESTOOLS:
      case BASE_ITEM_TRAPKIT:
        break;

      case BASE_ITEM_TORCH:
        EquipIfWorthIt(oItem,INVENTORY_SLOT_LEFTHAND,"torch");
        break;

      default:
        if (!GetLocalInt(OBJECT_SELF,"GotAWeapon")) {
     SpeakString("Thanks for the weaponry. We'll have to wait until "+
         "combat to see how well I can use it!");
     SetLocalInt(OBJECT_SELF,"GotAWeapon",TRUE);
      }
      break;

      }
   }
   oItem = GetNextItemInInventory();
  }
  SpeakString("Please wait a little while I try to sort out my equipment.");
  ExecuteScript("hench_unbusify", OBJECT_SELF);
}

void main()
{
 object oContainer = GetLocalObject(OBJECT_SELF, "sContainer");
 AssignCommand(OBJECT_SELF,EquipItems(oContainer));
}
