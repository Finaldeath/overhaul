//::///////////////////////////////////////////////
//:: Name q2d_ent_fightpit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC to the fighting pit.
    And show a fight..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nState") == 0)
    {
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF, "nState", 1);
    }
    else
    {
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF, "nState", 0);
    }

    object oPC = GetLastUsedBy();
    //If the Pit fight as ready to go
    if (GetLocalInt(GetModule(), "X2_Q2DPitFightReady") == 1)
    {
        object oTarget = GetWaypointByTag("wp_q2d7start");
        SetLocalLocation(oPC, "X2_Q2DArenaJump", GetLocation(oPC));
        AssignCommand(oPC, JumpToObject(oTarget));
    }
    else
    {
        FloatingTextStrRefOnCreature(85720, oPC);//There is currently no fight happening. Speak with the pit boss.
    }

}
