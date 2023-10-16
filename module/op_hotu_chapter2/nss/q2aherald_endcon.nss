
//q2aherald_endcon
void JumpPCToBattle2();
void main()
{

    object oPC = GetPCSpeaker();

    //Set a variable to help check the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad", 0);

    //Remove immobalize effect from PC (from end of battle conversation)
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }



    //if the battle has been won (Phase 1 of the siege) and conversation aborted - jump the PC
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Won") == 1)
    {

        if (GetLocalInt(OBJECT_SELF, "X2_Q2ABattle1Started") == 2)
        {
            return;
        }
        SetLocalInt(GetModule(), "X2_Q2ABattle1Won", 2);

        object oHerald = OBJECT_SELF;
        SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);
        object oHeraldStart = GetWaypointByTag("wp_q2abattle2_herald_lossstart");
        AssignCommand(oHerald, JumpToObject(oHeraldStart));

        JumpPCToBattle2();
        return;
    }
     //if the conversation is aborted prior to wave 2 or 3 - skip to the appropriate wave
    if (GetLocalInt(OBJECT_SELF, "nWave2Ready") == 1)
    {

        SetLocalInt(OBJECT_SELF, "nWave2Ready", 2);
        if (GetLocalInt(OBJECT_SELF, "nBattle2Wave2Started") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nBattle2Wave2Started", 1);
        //if Battle 1 was lost - go to cutscene 109 (Duergar)
        if (GetLocalInt(GetModule(), "X2_Q2ABattle1Lost") == 1)
            DelayCommand(0.5, ExecuteScript("cutscene109", oPC));
        //else go to cutscene 110
        else
            DelayCommand(0.5, ExecuteScript("cutscene110", oPC));

        return;
    }

    //If this is prior to Battle 1 - start Battle 1
    if (GetLocalInt(GetModule(), "X2_Q2AHeraldSpeak") == 1)
    {
        DelayCommand(0.5, ExecuteScript("act_q2aherald_11", oPC));

        return;
    }


}
void JumpPCToBattle2()
{
    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        SetLocalInt(oPC, "X2_Q2ABattle1Won", 1);
        //AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.5, AssignCommand(oPC, JumpToObject(oTarget)));
        oPC = GetNextPC();
    }
}







