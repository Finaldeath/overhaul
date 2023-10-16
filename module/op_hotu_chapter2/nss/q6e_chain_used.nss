// Challenge chains: (would work only if the player accepted the challenge
// - teleort player inside arena.
// - remove henchmen from party.
// - summon monster (each chain is a different monster)
// - Advance disease to next stage.

void BringMonster(string sBP, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sBP, lLoc);
}

void main()
{
    object oPC = GetLastUsedBy();

    if(GetLocalInt(OBJECT_SELF, "ACTIVE") == 0)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF, "ACTIVE", 1);
    }
    else
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF, "ACTIVE", 0);
    }

    object oCleric = GetNearestObjectByTag("q6_priest");
    if(GetLocalInt(oCleric, "STATUS") != 1) // chain is active only when cleric says so.
    {
        AssignCommand(oPC, SpeakStringByStrRef(84827));
        return;
    }
    SetLocalInt(oCleric, "STATUS", 2); // player is fighting inside the arena (for multiplayer)

    object oMonsterSP = GetWaypointByTag("q6e_wp_monster");
    object oWPJump = GetWaypointByTag("q6e_wp_pc_jump1");
    SetLocalObject(OBJECT_SELF, "DISEASE_TARGET", oPC);
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));

    // move henchmen to the side
    object oMove1 = GetWaypointByTag("q6e_wp_hench_move1");
    object oMove2 = GetWaypointByTag("q6e_wp_hench_move2");
    int i = 1;
    object oMove = oMove1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oHench, ActionForceMoveToObject(oMove, FALSE, 0.0, 3.0));
        DelayCommand(1.0, RemoveHenchman(oPC, oHench));
        SetLocalInt(oHench, "Q6_REMOVED_AT_TEMPLE", 1);
        DelayCommand(1.5, SetCommandable(FALSE, oHench));
        if(oMove == oMove1)
            oMove = oMove2;
        else
            oMove = oMove1;
        i++;
        oHench = GetHenchman(oPC, i);
    }
    // remove all other associates
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    if(oAnimal != OBJECT_INVALID) DestroyObject(oAnimal);
    if(oFamiliar != OBJECT_INVALID) DestroyObject(oFamiliar);
    if(oSummon != OBJECT_INVALID) DestroyObject(oSummon);
    if(oDominated != OBJECT_INVALID) DestroyObject(oDominated);

    effect eTeleport = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, GetLocation(oPC));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, GetLocation(oWPJump)));
    DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oWPJump)));
    SetLocalObject(oCleric, "FIGHTING_PC", oPC);
    int nType = StringToInt(GetStringRight(GetTag(OBJECT_SELF), 1));
    string sBP;
    if(nType == 1) // Troll
        sBP = "q6e_troll";
    else if(nType == 2) // Spider
        sBP = "q6e_spider";
    else if(nType == 3) // ghoul
        sBP = "q6e_ghoul";

    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oMonsterSP)));
    DelayCommand(3.0, BringMonster(sBP, GetLocation(oMonsterSP)));

}
