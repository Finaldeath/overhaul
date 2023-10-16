//::///////////////////////////////////////////////
//:: Uber Attack on End of Conversation
//:: NW_D1_AttOnEndPL
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
    - Turns Plot Flag off temporarily to allow hostility
    - Adjust both global and personal reputation
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Edited By: Brad Prince
//:: Created On: January 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "x2_inc_cutscene"

void main()
{
    object oPC = GetPCSpeaker();
    object oDurnan = GetObjectByTag("hx_end_fight_durnan");
    int iSleep = GetLocalInt(GetModule(), "HX_SLEEPING_END_BATTLE");

    DestroyObject(oDurnan);

    if(GetLocalInt(GetModule(), "HX_HAD_TO_SET_CAMERA") == TRUE)
    {
        SetLocalInt(GetModule(), "HX_HAD_TO_SET_CAMERA", FALSE);
        DelayCommand(0.5, RestoreCameraFacing());
    }

    // * If GetPCSpeaker is invalid, then try last talker
    if (GetIsObjectValid(oPC) == FALSE)
    {
        oPC = GetLastSpeaker();
    }

    // Sleeping Man busts in.
    if(iSleep == TRUE)
    {
        if(!GetIsObjectValid(GetObjectByTag("hx_sleepman_end")))
        {
            CreateObject(OBJECT_TYPE_CREATURE, "hx_sleepman_end", GetLocation(oPC));
        }
    }

    object oAribeth = GetNearestObjectByTag("H2_Aribeth", oPC);
    int iAribeth = GetLocalInt(GetModule(), "bAribethBetrays");
    object oDeekin = GetNearestObjectByTag("x2_hen_deekin", oPC);
    int iDeekin = GetLocalInt(GetModule(), "bDeekinBetrays");
    object oValen = GetNearestObjectByTag("x2_hen_valen", oPC);
    int iValen = GetLocalInt(GetModule(), "bValenBetrays");
    object oNathyrra = GetNearestObjectByTag("x2_hen_nathyra", oPC);
    int iNathyrra = GetLocalInt(GetModule(), "bNathyrraBetrays");

    if(iAribeth == TRUE)
    {
        RemoveHenchman(oPC, oAribeth);
        ChangeToStandardFaction(oAribeth, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oAribeth, ActionAttack(oPC)));
    }
    if(iDeekin == TRUE)
    {
        RemoveHenchman(oPC, oDeekin);
        ChangeToStandardFaction(oDeekin, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oDeekin, ActionAttack(oPC)));
    }
    if(iValen == TRUE)
    {
        RemoveHenchman(oPC, oValen);
        ChangeToStandardFaction(oValen, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oValen, ActionAttack(oPC)));
    }
    if(iNathyrra == TRUE)
    {
        RemoveHenchman(oPC, oNathyrra);
        ChangeToStandardFaction(oNathyrra, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oNathyrra, ActionAttack(oPC)));
    }

    SetLocalString(GetModule(), "sMephistophelesFate", "NotCommanded");
    //SetPlotFlag(OBJECT_SELF, FALSE);
    //SetIsTemporaryEnemy(oPC);
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    AdjustReputation(oPC, OBJECT_SELF, -100);
    //SetPlotFlag(OBJECT_SELF, TRUE);
    DetermineCombatRound(oPC);
    CutDisableCutscene(300, 0.0, 0.0, RESTORE_TYPE_NONE);
}
