//::///////////////////////////////////////////////
//:: Sitting User Defined
//:: M3Q1_Sitting_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the uthgardt sit.
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
        int nPrayValue = GetLocalInt(OBJECT_SELF, "NW_M3Q1_SIT_DELAY");
        if(nPrayValue == FALSE && !IsInConversation(OBJECT_SELF)
            && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS")!=1
            && !GetIsObjectValid(GetAttemptedAttackTarget())
            && !GetIsObjectValid(GetAttemptedSpellTarget())
            && GetLocalInt(OBJECT_SELF,"NW_G_M3Q1_TRIALOVER")!=TRUE)
        {
            SetLocalInt(OBJECT_SELF, "NW_M3Q1_SIT_DELAY", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(1);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M3Q1_SIT_DELAY", FALSE));
        }
        else if(GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS")==1)
        {
            ClearAllActions();
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M3Q1_SIT_DELAY", FALSE);
    }
}
