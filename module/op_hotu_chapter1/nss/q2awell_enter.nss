//::///////////////////////////////////////////////
//:: Name: q2awell_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first time a PC enters this area - more
    enemies will swarm out of the well...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 10/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void MakeCreatureNoFlash(location lTarget, string sCreature);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    if (GetIsPossessedFamiliar(oPC) == TRUE)
    {
        UnpossessFamiliar(oPC);
        return;
    }

    //Remove the Immortal Effect from any PCs entering the well room
    SetImmortal(oPC, FALSE);

    if (GetLocalInt(OBJECT_SELF, "nSpawned") != 1  && GetLocalInt(GetModule(), "X2_ypattack") == 2)
    {
        SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);
        SetCameraFacing(270.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);

        //SetLocalInt(GetModule(), "X2_ypattack", 2);

        BlackScreen(oPC);
        FadeFromBlack(oPC, FADE_SPEED_FASTEST);
        //Make sure that the four adventurers and Durnan have all spawned in down here
        object oDurnan = GetObjectByTag("q2adurnan");
        object oTomi = GetObjectByTag("pre_tomi");
        object oDaelan = GetObjectByTag("pre_daelan");
        object oLinu = GetObjectByTag("pre_linu");
        object oSharwyn = GetObjectByTag("pre_sharwyn");

        object oNPCJumpTarget = GetWaypointByTag("wp_q2awell_npcjumptarget");

        //    object oDurnan1 = GetWaypointByTag("wp_q2awell_durnan");
        SetCommandable(TRUE, oDurnan);
        AssignCommand(oDurnan, JumpToObject(oNPCJumpTarget));
        //AssignCommand(oDurnan, ClearAllActions());
        DelayCommand(1.5, AssignCommand(oDurnan, DetermineCombatRound()));

        SetLocalInt(oDurnan, "nJumpedWell", 1);

        //    object oDaelan1 = GetWaypointByTag("wp_q2awell_durst");
        SetCommandable(TRUE, oDaelan);
        AssignCommand(oDaelan, JumpToObject(oNPCJumpTarget));
        //AssignCommand(oDaelan, ClearAllActions());
        DelayCommand(1.5, AssignCommand(oDaelan, DetermineCombatRound()));
        SetLocalInt(oDaelan, "nJumpedWell", 1);

        //    object oTomi1 = GetWaypointByTag("wp_q2awell_jera");

        SetCommandable(TRUE, oTomi);
        AssignCommand(oTomi, JumpToObject(oNPCJumpTarget));
        //AssignCommand(oTomi, ClearAllActions());
        DelayCommand(1.5, AssignCommand(oTomi, DetermineCombatRound()));
        SetLocalInt(oTomi, "nJumpedWell", 1);

        //    object oLinu1 = GetWaypointByTag("wp_q2awell_brit");
        SetCommandable(TRUE, oLinu);
        AssignCommand(oLinu, JumpToObject(oNPCJumpTarget));
        //AssignCommand(oLinu, ClearAllActions());
        DelayCommand(1.5, AssignCommand(oLinu, DetermineCombatRound()));
        SetLocalInt(oLinu, "nJumpedWell", 1);

        //    object oSharwyn1 = GetWaypointByTag("wp_q2awell_teth");
        SetCommandable(TRUE, oSharwyn);
        AssignCommand(oSharwyn, JumpToObject(oNPCJumpTarget));
        //AssignCommand(oSharwyn, ClearAllActions());
        DelayCommand(1.5, AssignCommand(oSharwyn, DetermineCombatRound()));
        SetLocalInt(oSharwyn, "nJumpedWell", 1);

        SetLocalInt(OBJECT_SELF, "nSpawned", 1);

        //spawn locations
        location lSpawn1 = GetLocation(GetWaypointByTag("wp_q2awellatk_1"));
        location lSpawn2 = GetLocation(GetWaypointByTag("wp_q2awellatk_2"));
        location lSpawn3 = GetLocation(GetWaypointByTag("wp_q2awellatk_3"));


        //Spawn in a series of creatures...
        MakeCreatureNoFlash(lSpawn1, "well_drow1");
        MakeCreatureNoFlash(lSpawn1, "well_drow2");
        MakeCreatureNoFlash(lSpawn2, "well_drow1");
        MakeCreatureNoFlash(lSpawn2, "well_drow2");
        MakeCreatureNoFlash(lSpawn3, "well_drow1");
        MakeCreatureNoFlash(lSpawn3, "well_drow2");

        DelayCommand(10.0, MakeCreatureNoFlash(lSpawn1, "well_drow1"));
        DelayCommand(13.0, MakeCreatureNoFlash(lSpawn1, "well_drow2"));
        DelayCommand(13.0, MakeCreatureNoFlash(lSpawn2, "well_drow1"));
        DelayCommand(17.0, MakeCreatureNoFlash(lSpawn2, "well_drow2"));
        DelayCommand(10.0, MakeCreatureNoFlash(lSpawn3, "well_drow1"));
        DelayCommand(17.0, MakeCreatureNoFlash(lSpawn3, "well_drow2"));

        //First time into the well room - set a variable so that the PC can't leave until
        //after the fight...
        if (GetLocalInt(GetModule(), "X2_Q2AWellRoomFight") == 0)
            SetLocalInt(GetModule(), "X2_Q2AWellRoomFight", 1);
    }


}
// Create a creature, done so that it could be delayed.
void MakeCreatureNoFlash(location lTarget, string sCreature)
{

    CreateObject(OBJECT_TYPE_CREATURE, sCreature, lTarget);

}
