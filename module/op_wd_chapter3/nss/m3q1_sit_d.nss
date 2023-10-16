//::///////////////////////////////////////////////
//:: Sitting User Defined
//:: M3Q1_SIT_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the tavern goer sit.
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
        int nSitValue = GetLocalInt(OBJECT_SELF, "NW_M3Q1_SITTING");
        if(nSitValue == FALSE && !IsInConversation(OBJECT_SELF) && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS")!=1 && !GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            SetLocalInt(OBJECT_SELF, "NW_M3Q1_SITTING", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M3Q1_SITTING", FALSE));
        }
        else if(GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS")==1)
        {
            ClearAllActions();
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M3Q1_SITTING", FALSE);
    }
}
