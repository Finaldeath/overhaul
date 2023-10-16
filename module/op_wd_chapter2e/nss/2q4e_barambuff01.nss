//::///////////////////////////////////////////////
//:: Cast Stone Skin on Baram
//:: 2Q4E_BaramBuff01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If baram does not have stoneskin then cast it
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
        if(!GetHasSpellEffect(SPELL_STONESKIN, oBaram))
        {
            ActionCastSpellAtObject(SPELL_STONESKIN, oBaram, METAMAGIC_ANY, TRUE);
        }
    }
}
