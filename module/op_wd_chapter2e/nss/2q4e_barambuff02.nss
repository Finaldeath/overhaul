//::///////////////////////////////////////////////
//:: Cast Lesser Spell Mantle on Baram
//:: 2Q4E_BaramBuff01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If baram does not have mantle then cast it
    on him.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 12, 2002
//:://////////////////////////////////////////////

void main()
{
    object oBaram = GetObjectByTag("2Q4E_Baram");
    if(GetIsObjectValid(oBaram))
    {
        if(!GetHasSpellEffect(SPELL_LESSER_SPELL_MANTLE, oBaram))
        {
            ActionCastSpellAtObject(SPELL_LESSER_SPELL_MANTLE, oBaram, METAMAGIC_ANY, TRUE);
        }
    }
}
