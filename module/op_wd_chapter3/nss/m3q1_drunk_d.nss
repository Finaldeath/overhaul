//::///////////////////////////////////////////////
//:: Drunken Soldier User Defined
//:: M3Q1_MEDITATE_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the soldier stumble around drunk
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: March 11, 2002
//:://////////////////////////////////////////////


void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001)
    {
//        object oWay = GetWaypointByTag("WP_M3Q1_MEDITATE");
        int nDrunkValue = GetLocalInt(OBJECT_SELF, "NW_M3Q1_PAUSE_DRUNK");
        if(nDrunkValue == FALSE && !IsInConversation(OBJECT_SELF) && !GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            SetLocalInt(OBJECT_SELF, "NW_M3Q1_PAUSE_DRUNK", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
//            vector vFace = GetPosition(oWay);
//            SetFacingPoint(vFace);
            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M3Q1_PAUSE_DRUNK", FALSE));
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M3Q1_PAUSE_DRUNK", FALSE);
    }
}
