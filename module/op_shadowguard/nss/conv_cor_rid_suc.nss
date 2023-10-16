void main()
{
    string sTrapTag = "TRAP_COR_TOMB";

    object oPC = GetPCSpeaker();

    object oTrap = GetNearestObjectByTag(sTrapTag, oPC);

    SetTrapDisabled(oTrap);

    SetLocalInt(OBJECT_SELF, "N_RIDDLE_TOLD", 1);

    effect e = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, e, GetPCSpeaker());
}
