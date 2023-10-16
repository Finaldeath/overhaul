// make hostile after player removes petrification

void Attack(object oPC)
{
    //AdjustReputation(oPC, OBJECT_SELF, -100);
    //AdjustReputation(OBJECT_SELF, oPC, -100);
    SetIsTemporaryEnemy(oPC, OBJECT_SELF);
    ActionAttack(oPC);
}

void main()
{
    int nSpell = GetLastSpell();
    object oPC = GetLastSpellCaster();
    if(nSpell == SPELL_STONE_TO_FLESH)
    {
        ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 0.7);
        DelayCommand(1.0, PlayVoiceChat(VOICE_CHAT_BATTLECRY1));
        DelayCommand(2.0, Attack(oPC));
        SetPlotFlag(OBJECT_SELF, FALSE);
        SetLocalInt(OBJECT_SELF, "IMMUNE", 1); // so the triggers won't stone him again.
    }
}
