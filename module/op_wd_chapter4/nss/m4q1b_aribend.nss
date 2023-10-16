//::///////////////////////////////////////////////
//:: M4Q1B_ARIBEND
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets Aribeth to leave for the cell if she has surrendered
    Sets her to fight if she has not.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 11, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"
#include "NW_I0_GENERIC"

void main()
{
    if(GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER") ==2)
    {
        SetLocalInt(GetModule(),"NW_M4Q1_AribethHostile",0);
        SetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER",1);
        // * stop her custom music
        ExecuteScript("m4aribethsndstop", OBJECT_SELF);

        AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), OBJECT_SELF, 100);
        SetLocked(GetNearestObjectByTag("M4Q1B25InnerDoor"),FALSE);
        AssignCommand(GetNearestObjectByTag("M4Q1B25InnerDoor"), ActionOpenDoor(GetNearestObjectByTag("M4Q1B25InnerDoor")));
        ActionMoveToObject(GetNearestObjectByTag("NW_EXIT"));
        ActionJumpToObject(GetObjectByTag("M4_ARIBETH_CELL"));
        ActionDoCommand(SetCommandable(TRUE));
        SetCommandable(FALSE);
        RewardXP("M4Q01Aribeth",100,GetPCSpeaker());
        DestroyObject(GetItemPossessedBy(OBJECT_SELF,"M4AribSword"));
    }
    else if (GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER") == 0)
    {
        SetIsTemporaryEnemy(GetPCSpeaker());
        // * fully heal Aribeth before next round of combat
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(GetMaxHitPoints()), OBJECT_SELF);
        DetermineCombatRound();
    }
}
