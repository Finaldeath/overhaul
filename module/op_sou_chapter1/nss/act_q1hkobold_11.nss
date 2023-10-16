//Apply Bard song effect to PC
void main()
{
    object oPC = GetPCSpeaker();
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_BARD_SONG), oPC, 4.0);
    object oKobold = GetObjectByTag("q1h2_kblake");
    SetLocalInt(oKobold, "nBabyMessage", 1);
}
