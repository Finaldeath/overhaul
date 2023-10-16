//Set a variable on the PC so that they will be jumped to chapter 2
//if they save and load after this point...
//act_q2dhal_1
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2HalCon_JumpToChapter2", 1);

    //Raise Nathyrra if she's dead
    object oNathyrra = GetObjectByTag("x2_hen_nathyrra");
    object oWPNath = GetWaypointByTag("wp_q2d_nathend");
    if (GetIsDead(oNathyrra) == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oNathyrra);
        DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_RAISE_DEAD), GetLocation(oWPNath)));
        DelayCommand(3.0, AssignCommand(oNathyrra, ActionJumpToObject(oWPNath)));

    }
    else
    {
        AssignCommand(oNathyrra, ClearAllActions(TRUE));
        DelayCommand(0.5, AssignCommand(oNathyrra, JumpToObject(oWPNath)));

    }
    //Immobalize the PC during this conversation
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC);

    //Get the PC's henchmen to move closer to the conversation
    int nCount = 1;
    object oHench = GetHenchman(oPC, nCount);
    while (GetIsObjectValid(oHench) == TRUE)
    {
        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 4.0));
        nCount = nCount + 1;
        oHench = GetHenchman(oPC, nCount);
    }
}
