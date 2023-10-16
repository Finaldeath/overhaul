//::///////////////////////////////////////////////
//:: M3Q3C10WeakDragon.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Guardian casts a spell that weakens
    the Dragon, so it can be killed (removes the plot flag).
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////

void main()
{
    SetPlotFlag(GetObjectByTag("M3Q3C_GUARDIAN"), FALSE);
    effect eVis = EffectVisualEffect(VFX_IMP_GOOD_HELP);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    eVis = EffectVisualEffect(VFX_IMP_DESTRUCTION);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetObjectByTag("M3Q3C_GUARDIAN"));

    eVis = EffectVisualEffect(VFX_DUR_LIGHT_WHITE_20);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);

    SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",1);
    DelayCommand(7.0, ActionDoCommand(SpeakOneLinerConversation()));
}
