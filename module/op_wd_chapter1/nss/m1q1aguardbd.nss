//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oDoor = GetNearestObjectByTag("M1Q1_M1Q5A3");
        int nCount = GetLocalInt(OBJECT_SELF,"NW_L_HBCount");
        if(GetIsOpen(oDoor) &&
           IsInConversation(OBJECT_SELF) == FALSE &&
           GetCurrentAction() == ACTION_INVALID)
        {
            if(nCount >= 5)
            {
                nCount = 0;
                ClearAllActions();
                ActionCloseDoor(oDoor);
                ActionMoveToLocation(GetLocation(GetNearestObjectByTag("POST_" + GetTag(OBJECT_SELF))));
            }
            else
            {
                nCount++;
            }
        }
        else
        {
            nCount = 0;
        }
        SetLocalInt(OBJECT_SELF,"NW_L_HBCount",nCount);
    }
}

