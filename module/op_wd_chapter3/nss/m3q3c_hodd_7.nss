//::///////////////////////////////////////////////
//:: M3Q3C_HODD_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shouts to allies that they have been killed.
    Respawns at 'home' in 30 seconds
    and then tries to walk back here.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 25, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "M3PlotInclude"
void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    if(nClass > 0 && nAlign == ALIGNMENT_GOOD)
    {
        object oKiller = GetLastKiller();
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }

    // * rebirth self
    object oDwarf = CreateObject(OBJECT_TYPE_CREATURE,"M3Q3C07_HODD", GetLocation(GetObjectByTag("M3Q3CDwarfHome")));
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    location lDwarf = GetLocation(GetObjectByTag("M3Q3CDwarfHome"));
    DelayCommand(0.7, ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lDwarf));

//    RebirthBehavior(oDwarf);
    ActionMoveToObject(GetObjectByTag("POST_M3Q3C07_HODD"));

}
