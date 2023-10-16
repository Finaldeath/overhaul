// Kel-Garas user defined events (mostly to jump-attack-jump away

void JumpTo(object oWP)
{
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    DelayCommand(1.0, JumpToObject(oWP));
}

void JumpBack(string sWP = "Q2D_WP_KELGARAS_INIT")
{
    // clear actions to players
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        AssignCommand(oPC, ClearAllActions());
        oPC = GetNextPC();
    }
    ClearAllActions();
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    object oWP = GetWaypointByTag(sWP);
    DelayCommand(2.0, JumpToObject(oWP));
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // jump to first attack
    {
        SetLocalInt(OBJECT_SELF, "Q2_IGNORE_DEFAULT_AI", 1);
        object oWP = GetWaypointByTag("Q2D_WP_KELGARAS1");
        JumpTo(oWP);

        ClearAllActions();
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oWP);
        DelayCommand(2.0, SpeakOneLinerConversation("q2d_kelgtaunt1", oPC));
    }
    else if(nEvent == 102) // second attack
    {
        SetLocalInt(OBJECT_SELF, "Q2_IGNORE_DEFAULT_AI", 1);
        object oWP = GetWaypointByTag("Q2D_WP_KELGARAS2");
        JumpTo(oWP);
        ClearAllActions();
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oWP);
        DelayCommand(2.0, SpeakOneLinerConversation("q2d_kelgtaunt2", oPC));
    }
    else if(nEvent == 110) // jump away
    {
        JumpBack();
    }
    return;
}
