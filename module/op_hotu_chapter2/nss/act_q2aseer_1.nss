//::///////////////////////////////////////////////
//:: Name act_q2aseer_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has rested prior to the siege.
    The Matron summons the PC in a dream to get
    him to betray the rebels.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    ForceRest(oPC);
    //Get rid of the cutscene mode that was on the player
    SetCutsceneMode(oPC, FALSE);
    //Get rid of Siege speech variable for Seer's conversation
    SetLocalInt(GetModule(), "X2_StartSeerSiegeSpeech", 2);

    //PC jumps to the Matron's tower in 'dream-state'
    object oTarget = GetWaypointByTag("wp_q2a9_pcsiegeoffer");
    FadeToBlack(oPC);
    DelayCommand(1.5, AssignCommand(oPC, JumpToObject(oTarget)));
    DelayCommand(3.0, FadeFromBlack(oPC));
    object oGate = GetObjectByTag("q2ainnergate");
    SetPlotFlag(oGate, FALSE);

    //Make sure any henchmen don't appear in the dream
    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        ForceRest(oHench);
        DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oHench));
        i++;
        oHench = GetHenchman(oPC, i);
    }
}
