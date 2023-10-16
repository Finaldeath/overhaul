//::///////////////////////////////////////////////
//:: Acolyte Heartbeat User Defined
//:: 2Q4E_SKELETON_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the acolytes pray.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 1, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001)
    {
        int nPrayValue = GetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY");
        if(nPrayValue == FALSE && !GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
        {
            SetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY", TRUE);
            ClearAllActions();
            float fTime = HoursToSeconds(3);
            object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
            ActionUnequipItem(oWeapon);
            ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, fTime);
            DelayCommand(fTime, SetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY", FALSE));
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_2Q4_PRAY_DELAY", FALSE);
    }
    else if(nUser == 1004)
    {
        SpeakOneLinerConversation("2q4_Skeleton");
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        ClearAllActions();
        AdjustReputation(oPC, OBJECT_SELF, -100);
        DetermineCombatRound(oPC);
        SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT, FALSE);
    }
}
