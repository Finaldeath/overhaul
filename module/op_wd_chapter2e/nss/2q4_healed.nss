//::///////////////////////////////////////////////
//:: Temple Cast Heal
//:: 2q4_healed.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Dialog speak force casts Heal on the person
*/
//:://////////////////////////////////////////////
//:: Created By:     Brent
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    ActionCastSpellAtObject(SPELL_GREATER_RESTORATION, GetPCSpeaker(), METAMAGIC_NONE, TRUE);
}

