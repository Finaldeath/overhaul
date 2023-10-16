//::///////////////////////////////////////////////
//:: Sitting & Drinking User Defined
//:: M4_SITDRINK_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the NPC sit and drink.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////


void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001)
    {

//        int nSit = GetLocalInt(OBJECT_SELF, "NW_M4_SITDRINK");
        int nDrink = GetLocalInt(OBJECT_SELF, "NW_M4_DRINK");
/*        if(nSit == FALSE && !IsInConversation(OBJECT_SELF) && !GetIsInCombat())
        {
            SetLocalInt(OBJECT_SELF, "NW_M4_SITDRINK", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M4_SITDRINK", FALSE));
        }*/
        if(nDrink == FALSE && !IsInConversation(OBJECT_SELF) && !GetIsInCombat())
        {
            SetLocalInt(OBJECT_SELF, "NW_M4_DRINK", TRUE);
            ClearAllActions();
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_M4_DRINK", FALSE));

        }
    }
    if(nUser == 1003)
    {
//        SetLocalInt(OBJECT_SELF, "NW_M4_SITDRINK", FALSE);
        SetLocalInt(OBJECT_SELF, "NW_M4_DRINK", FALSE);
    }
}
