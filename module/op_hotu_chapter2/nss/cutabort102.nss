//::///////////////////////////////////////////////
//:: Name cutabort102
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of initial chapter cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 28/03
//:://////////////////////////////////////////////
void ReturnDeekin();
void main()
{
    object oSeer = GetObjectByTag("q2aseer");
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oPCTeleport = GetWaypointByTag("wp_cut102_pcstart");
    //Variable for conversation starting
    SetLocalInt(oSeer, "nCutscene102Aborted", 1);
    SetLocalInt(GetModule(), "X2_nCutscene102Aborted", 1);

    BlackScreen(oPC);
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    AssignCommand(oNathyrra, JumpToObject(oPCTeleport));
    AssignCommand(oSeer, ActionStartConversation(oPC));
    ReturnDeekin();
}

void ReturnDeekin()
{
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        effect eEffect = GetFirstEffect(oDeekin);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENE_PARALYZE)
                RemoveEffect(oDeekin, eEffect);

            eEffect = GetNextEffect(oDeekin);
        }
        object oTarget = GetWaypointByTag("wp_q2a1_deekpostcut");
        DelayCommand(1.0, AssignCommand(oDeekin, JumpToObject(oTarget)));
    }
}
