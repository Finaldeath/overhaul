//::///////////////////////////////////////////////
//:: Drinking Customer User Defined
//:: M3Q1_DRINKING_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the bar patron drink
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
        int nDrinkingValue = GetLocalInt(OBJECT_SELF, "NW_M3Q1_DRINKING");
//        SpeakString("This is my heartbeat.");
        if(nDrinkingValue == FALSE
            && !IsInConversation(OBJECT_SELF)
                && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS")!=1
                    && !GetIsInCombat())
        {
//                        SpeakString("I am drinking.");
            SetLocalInt(OBJECT_SELF, "NW_M3Q1_DRINKING", TRUE);
            ClearAllActions();
            //          float fTime = HoursToSeconds(1);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            //          vector vFace = GetPosition(oWay);
            //            SetFacingPoint(vFace);
            ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_M3Q1_DRINKING", FALSE));
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M3Q1_DRINKING", FALSE);
    }
}
