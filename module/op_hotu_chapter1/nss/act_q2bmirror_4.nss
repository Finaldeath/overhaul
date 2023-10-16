//::///////////////////////////////////////////////
//:: Name act_q2bmirror_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in the Clone of the PC and attack
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 10/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void CloneFight()
{
    DetermineCombatRound();
    DelayCommand(4.0, CloneFight());
}
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nCopy") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nCopy", 1);

    location lMirror = GetLocation(GetWaypointByTag("wp_q2bmirror_spawn"));
    object oPC = GetPCSpeaker();

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(471), lMirror);

    object oCopy1 = CopyObject(oPC, lMirror, OBJECT_INVALID, "q2bclone1");

    //Create the heartbeat object to keep the clone attacking
    object oHeart = CreateObject(OBJECT_TYPE_PLACEABLE, "q2bclonehb", lMirror);

    //Make sure the copies don't drop anything
    object oGear = GetItemInSlot(INVENTORY_SLOT_ARMS, oCopy1);


    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_ARROWS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BELT, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BOOTS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_BULLETS, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_CHEST, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_CLOAK, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_HEAD, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_NECK, oCopy1);
    if(GetIsObjectValid(oGear))
    {
        SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }
    oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oCopy1);
    if(GetIsObjectValid(oGear))
    {
         SetDroppableFlag(oGear, FALSE);
    }


    //Empty all items from copy 1's inventory
    oGear = GetFirstItemInInventory(oCopy1);
    while (oGear != OBJECT_INVALID)
    {
        SetDroppableFlag(oGear, FALSE);
        oGear = GetNextItemInInventory(oCopy1);
    }

    ChangeToStandardFaction(oCopy1, STANDARD_FACTION_HOSTILE);

    int nGold = GetGold(oCopy1);
    TakeGoldFromCreature(nGold, oCopy1, TRUE);
    //create a back up dagger - in case the PC didn't have any melee weapons
    object oDagger = CreateItemOnObject("nw_wswmdg008", oCopy1);
    SetDroppableFlag(oDagger, FALSE);
    AssignCommand(oCopy1, ClearAllActions());
    AssignCommand(oCopy1, ActionEquipMostDamagingMelee());
//    DelayCommand(1.5, AssignCommand(oCopy1, ActionAttack(oPC)));
    DelayCommand(2.0, AssignCommand(oCopy1, CloneFight()));

}
