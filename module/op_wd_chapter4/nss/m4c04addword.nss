//::///////////////////////////////////////////////
//:: M4C04AddWord.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy Word of Power and 'Unlock'
    entrance into SourceStone
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


#include "M4PlotInclude"
void main()
{
    if (HasWordOfPower(OBJECT_SELF) == TRUE)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE, "M4C04Sparks", GetLocation(OBJECT_SELF));
        SetLocalInt(GetModule(),"NW_G_SOURCESTONEISOPEN", 10);

        effect eVis = EffectVisualEffect(VFX_FNF_SUNBEAM);
        object oSource = GetObjectByTag("M4C04WordTrigger");
        location lSource = GetLocation(oSource);
        ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lSource);

        DestroyWordOfPower(OBJECT_SELF);
    }
}
