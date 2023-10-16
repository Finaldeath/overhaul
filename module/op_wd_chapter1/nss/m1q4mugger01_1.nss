//::///////////////////////////////////////////////
//::
//:: OnHeartBeat
//::
//:: M1Q4Mugger01_1.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: The mugger will begin to follow someone with
//:: equiped weapons or armor.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 14, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    int nRand = 0;
    object oPC = GetLocalObject(OBJECT_SELF,"NW_L_PCMark");

    // This script is turned off during conversation.
    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        // There is a valid object to be following.
        if (GetLocalInt(OBJECT_SELF,"NW_L_FindMark") == 40 && GetIsObjectValid(oPC) == TRUE)
        {
            // If the mark has left the area, reset.
            if (GetArea(OBJECT_SELF) != GetArea(oPC))
            {
                ClearAllActions();
                SetLocalObject(OBJECT_SELF,"NW_L_PCMark",OBJECT_INVALID);
                SetLocalInt(OBJECT_SELF,"NW_L_FindMark",0);
            }
            // If the mark gets too close, move away.
            if (GetDistanceToObject(oPC) <= 8.0)
            {
                ActionMoveAwayFromObject(oPC);
            }
            // Keep a distance from the mark.  Do not follow to close.
            else if (GetDistanceToObject(oPC) <= 15.0)
            {
                ClearAllActions();
            }
            // Follow the mark.
            else
            {
                ClearAllActions();
                ActionMoveToObject(oPC);
            }
        }
        // If the PC has no equiped items, leave him alone.  This should check value.
        else if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC)) == FALSE &&
                 GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC)) == FALSE &&
                 GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC)) == FALSE &&
                 GetDistanceToObject(oPC) < 8.0 && GetIsObjectValid(oPC) == TRUE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_FindMark",10);
            nRand = Random(5);
        }
        // If the PC has armor equiped, set the mark.
        else if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC)) == TRUE &&
                 GetDistanceToObject(oPC) < 8.0 && GetIsObjectValid(oPC) == TRUE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_FindMark",20);
        }
        // If the PC has a weapon equiped, set the mark.
        else if ((GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC)) == TRUE ||
                  GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC)) == TRUE) &&
                  GetDistanceToObject(oPC) < 8.0 && GetIsObjectValid(oPC) == TRUE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_FindMark",30);
        }
        // If no one is close enough, complain to self.
        else
        {
            SetLocalInt(OBJECT_SELF,"NW_L_FindMark",0);
            nRand = Random(5);
        }

        nRand = Random(5);

        if (nRand == 0)
        {
            ActionStartConversation(OBJECT_SELF);
        }
    }
}
