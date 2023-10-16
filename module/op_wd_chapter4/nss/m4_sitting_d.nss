//::///////////////////////////////////////////////
//:: Sitting User Defined
//:: M4_SITTING_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the NPC sit on a chair.
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
        object oCouch = GetObjectByTag("M4_OLDMANCHAIR");
        object oWay = GetWaypointByTag("M4_ASGARD_FACE");
        int nSit = GetLocalInt(OBJECT_SELF, "NW_M4_SIT");
        if(nSit == FALSE && !IsInConversation(OBJECT_SELF) && !GetIsInCombat())
        {
            SetLocalInt(OBJECT_SELF, "NW_M4_SIT", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
/*            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            vector vFace = GetPosition(oWay);
            SetFacingPoint(vFace);
            ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, fTime);*/
            ActionSit(oCouch);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_M4_SIT", FALSE));

        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M4_SIT", FALSE);
    }
}
