//::///////////////////////////////////////////////
//:: Name h4x_onclose2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will destroy "ring vision" treasure chest
     waypoints, so they can only be looted once.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
void RemoveItems();
void main()
{
    object oWP;
    object oWPOn = GetNearestObjectByTag("h4a_ring_wp", OBJECT_SELF);
    object oWPOff = GetNearestObjectByTag("h4a_ringoff_wp", OBJECT_SELF);

    if((GetDistanceToObject(oWPOn) < GetDistanceToObject(oWPOff)) || GetDistanceToObject(oWPOff) == -1.0)
        oWP = oWPOn;
    else
        oWP = oWPOff;

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        RemoveItems();
        DestroyObject(oWP);
    }
}

void RemoveItems()
{
    object oInv = GetFirstItemInInventory();

    while(GetIsObjectValid(oInv))
    {
        DestroyObject(oInv);
        oInv = GetNextItemInInventory();
    }
}
