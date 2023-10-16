//::///////////////////////////////////////////////
//:: Follow Player
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Follows Player.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 11, 2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetLocalObject(OBJECT_SELF,"NW_L_FollowPC");
    object oRevat = GetObjectByTag("Revat");

    if (GetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT") == 0)
    {
        if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 10 &&
            GetArea(OBJECT_SELF) == GetArea(oRevat))
        {
            ClearAllActions();
            ActionForceMoveToObject(oRevat,TRUE);
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Rescued",15));
        }
        else if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 10)
        {
            if (GetDistanceToObject(oPC) > 6.0)
            {
                ClearAllActions();
                ActionForceMoveToObject(oPC,TRUE);
            }
            else if (GetDistanceToObject(oPC) > 4.0)
            {
                ClearAllActions();
                ActionForceMoveToObject(oPC);
            }
            else if (GetArea(OBJECT_SELF) != GetArea(oPC))
            {
                ClearAllActions();
                ActionJumpToObject(oPC);
            }
        }
    }
}
