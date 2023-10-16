//::///////////////////////////////////////////////
//:: Valindra Warned
//:: 2Q6G_ValinWarn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a PC has tripped an alarm then Valindra
    will start casting prep spells early.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 28, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
void main()
{
    int nPlot = GetLocalInt(GetArea(OBJECT_SELF), "2Q6G_ALARM_TRIPPED");
    object oValin = GetObjectByTag("2Q6G_Valindra");
    object oStone = GetObjectByTag("2Q6G_PowerStone");
    if(GetIsObjectValid(oValin) && nPlot == 1)
    {
        AssignCommand(oStone,ActionCastSpellAtObject(SPELL_SPELL_MANTLE, oValin, METAMAGIC_QUICKEN, TRUE));
        AssignCommand(oStone,ActionCastSpellAtObject(SPELL_LESSER_SPELL_MANTLE, oValin, METAMAGIC_QUICKEN, TRUE));
        AssignCommand(oStone,ActionCastSpellAtObject(SPELL_ENDURANCE, oValin, METAMAGIC_QUICKEN, TRUE));
        DestroyObject(OBJECT_SELF, 0.5);
    }
}
