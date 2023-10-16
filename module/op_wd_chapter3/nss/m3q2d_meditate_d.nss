//::///////////////////////////////////////////////
//:: M3Q2D_MEDITATE_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the elk tribe worshipper pray.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: April 3, 2002
//:://////////////////////////////////////////////


void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001)
    {
        object oWay = GetWaypointByTag("WP_M3Q2_MEDITATE");
        int nPrayValue = GetLocalInt(OBJECT_SELF, "NW_M3Q2_PRAY_DELAY");
        if(nPrayValue == FALSE
            && !IsInConversation(OBJECT_SELF)
            && GetIsObjectValid(oWay)
            && !GetIsObjectValid(GetAttemptedAttackTarget())
            && !GetIsObjectValid(GetAttemptedSpellTarget())
            && !GetIsInCombat())
        {
            SetLocalInt(OBJECT_SELF, "NW_M3Q2_PRAY_DELAY", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            vector vFace = GetPosition(oWay);
            SetFacingPoint(vFace);
            ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M3Q2_PRAY_DELAY", FALSE));
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M3Q2_PRAY_DELAY", FALSE);
    }
}
