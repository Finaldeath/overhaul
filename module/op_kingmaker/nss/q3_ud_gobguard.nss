//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_gobguard
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User defined script for the goblin guards
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    object oArea = GetArea(OBJECT_SELF);
    if(nUser == 1001) //HEARTBEAT
    {
        int nGoblin = GetLocalInt(oArea,"OS_AREA_ENTER");
        if(nGoblin==10 && !GetIsInCombat())
        {
            ClearAllActions();
            SpeakOneLinerConversation();
        }
/*    if(nUser == 1001)
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
    }*/
    }
    else if(nUser == 1002) // PERCEIVE
    {
        object oPC = GetFirstPC();
        if(GetLastPerceived()==oPC)
        {
            SetLocalInt(oArea,"OS_AREA_ENTER",20);
        }

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

