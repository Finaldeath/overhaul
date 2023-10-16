void main()
{

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oGuard = GetNearestObjectByTag("NW_SKELCHIEF");
    if(GetIsDead(oGuard))
        return;

    object oPC = GetLastOpenedBy();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastKiller();
    AssignCommand(oGuard, ActionCastSpellAtObject(SPELLABILITY_AURA_MENACE, OBJECT_SELF, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    AssignCommand(oGuard, ActionCastSpellAtObject(SPELL_PRAYER, OBJECT_SELF, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    DelayCommand(10.0, PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oGuard));
    AssignCommand(oGuard, ActionMoveToObject(oPC, TRUE, 10.0));
    AssignCommand(oGuard, ActionAttack(oPC));
}
