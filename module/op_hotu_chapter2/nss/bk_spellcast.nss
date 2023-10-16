//::///////////////////////////////////////////////
//:: bk_spellcast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If dispel magic is cast near the
    shadow bridge, the bridge is dispelled.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nSpell = GetLastSpell();
    if (nSpell == SPELL_LESSER_DISPEL || nSpell == SPELL_DISPEL_MAGIC || SPELL_MORDENKAINENS_DISJUNCTION)
       ExecuteScript("bk_invis_remove", OBJECT_SELF);
}
