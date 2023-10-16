//::///////////////////////////////////////////////
//:: Jendra's Corpse (OnSpellCastAt)
//:: SCA_JendraCorpse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Provide feedback if the player tries to cast
     Raise Dead or Resurrection on Jendra's
     corpse.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastSpellCaster();
    int iSpell = GetLastSpell();
    if (iSpell == SPELL_RAISE_DEAD ||
        iSpell == SPELL_RESURRECTION)
    {
        ActionStartConversation(oPC, "", FALSE, FALSE);
    }
}
