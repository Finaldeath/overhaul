//::///////////////////////////////////////////////
//:: kobold room trigger on-enter
//:: q2_trig_kbld_oe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a player enters the room have the kobold sergeant fire the correct dialog line:
    - Either the player has bashed or unlocked the door (Q2_KOBOLD_DOOR_PASSED)
    - or the player entered with a weapon drawn (Q2_WEAPON_DRAWN1)
    - otherwise the default line of entered the room without a weapon drawn will be fired
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 7/2/2003
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE_ON_ENTER");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE_ON_ENTER", 1);

    SetLocalInt(oPC, "Q2_IN_KOBOLD_ROOM", 1);
    object oKobold = GetNearestObjectByTag("Q2_KOBOLD_SER");

    if(GetLocalInt(oKobold, "Q2_KOBOLD_DOOR_PASSED") == 1)
    {
        AssignCommand(oKobold, SpeakOneLinerConversation());
        return;
    }

    if(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC) != OBJECT_INVALID)
            {
                object oKobold = GetNearestObjectByTag("Q2_KOBOLD_SER");
                SetLocalInt(oKobold, "Q2_WEAPON_DRAWN1", 1);
                /*AdjustReputation(oPC, oKobold, -100);
                AdjustReputation(oKobold, oPC, -100);
                AssignCommand(oKobold, ClearAllActions());
                AssignCommand(oKobold, ActionMoveAwayFromObject(oPC, TRUE));
                AssignCommand(oKobold, ActionAttack(oPC));
                AssignCommand(oKobold, SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT));
                AssignCommand(oKobold, SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_SHOUT));*/
            }

    AssignCommand(oKobold, SpeakOneLinerConversation());

}
