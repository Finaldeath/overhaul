//::///////////////////////////////////////////////
//:: Acolyte Heartbeat User Defined
//:: 2Q4_ACOLYTE_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the acolytes pray.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 1, 2002
//:://////////////////////////////////////////////


void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001)
    {
        object oWay = GetWaypointByTag("2Q4_Pray");
        int nPrayValue = GetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY");
        if(nPrayValue == FALSE && GetIsObjectValid(oWay) && !GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            SetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            vector vFace = GetPosition(oWay);
            SetFacingPoint(vFace);
            ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY", FALSE));
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY", FALSE);
    }
}
