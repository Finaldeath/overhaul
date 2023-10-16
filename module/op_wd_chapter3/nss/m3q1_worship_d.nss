//::///////////////////////////////////////////////
//:: Commoner Heartbeat User Defined
//:: M3Q1_MEDITATE_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the commoner worship.
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
        object oWay = GetWaypointByTag("WP_M3Q1_MEDITATE");
        int nPrayValue = GetLocalInt(OBJECT_SELF, "NW_M3Q1_PRAY_DELAY");
        if(nPrayValue == FALSE && !IsInConversation(OBJECT_SELF) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS")!=1 && GetIsObjectValid(oWay) && !GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            SetLocalInt(OBJECT_SELF, "NW_M3Q1_PRAY_DELAY", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            vector vFace = GetPosition(oWay);
            SetFacingPoint(vFace);
            ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M3Q1_PRAY_DELAY", FALSE));
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M3Q1_PRAY_DELAY", FALSE);
    }
}
