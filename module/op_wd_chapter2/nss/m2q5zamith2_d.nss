//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q5ZAMITH2_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zamithra moves inside her room.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 12, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    int nMaxHP = GetMaxHitPoints();
    int nCurrHP = GetCurrentHitPoints();
    object oWaypoint = GetWaypointByTag("WP_ZAMITH2");
    object oDoor = GetObjectByTag("M2Q5DZAMITHDOOR");

    switch (nEvent)
    {
        case 501:
            SetLocalInt(OBJECT_SELF,"NW_L_Moving",10);
            ActionMoveToObject(oDoor,FALSE,1.9);
            ActionOpenDoor(oDoor);
            ActionMoveToObject(oWaypoint);
            ActionEquipItem(GetItemPossessedBy(OBJECT_SELF,"M2_CLOTH_014"),INVENTORY_SLOT_CHEST);
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moving",0));
            ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Moved",10));
            ActionWait(1.0);
            ActionDoCommand(SetFacing(GetFacing(oWaypoint)));
            ActionDoCommand(SetCommandable(TRUE));
            SetCommandable(FALSE);
        break;
        case 502:
            if (GetDistanceToObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)) < 10.0)
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Moved",30);
                AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100);
                AssignCommand(GetNearestObjectByTag("M2Q1CWITL"),DetermineCombatRound());
                DetermineCombatRound();
            }
            else
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Moved",10);
            }
        break;
        case 503:
            SpeakOneLinerConversation();
        break;
        case 1006:
            int nMaxHP = GetMaxHitPoints();
            int nCurrHP = GetCurrentHitPoints();

             // * generic surrender should only fire once
            if((nCurrHP <= 30) && GetLocalInt(OBJECT_SELF,"Generic_Surrender") == 0 &&
                GetLocalInt(GetModule(),"NW_G_ZamithraRobbed") == 0)
            {
                SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
                SurrenderToEnemies();
                ClearAllActions();
                SpeakOneLinerConversation();
            }
        break;
    }
}
