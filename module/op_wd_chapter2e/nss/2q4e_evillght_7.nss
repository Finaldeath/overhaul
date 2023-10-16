//::///////////////////////////////////////////////
//:: Evil Light On Death
//:: 2Q4E_EvilLght_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the fake conjurer and the dark light
    and replaces them with a real Yuan-Ti
    conjurer.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 12, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void CreateYuanTi(location lLocal);

void main()
{
    int nPlot = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nPlot == 0)
    {
        object oLight =  GetObjectByTag("2Q4_NecroPillar01");
        object oConjure = GetObjectByTag("2Q4E_Y_FAKE_01");
        location lLocal = GetLocation(oConjure);
        effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
        DestroyObject(oConjure, 0.5);
        DestroyObject(oLight, 0.5);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal);
        DelayCommand(1.0, CreateYuanTi(lLocal));
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }
}

void CreateYuanTi(location lLocal)
{
    CreateObject(OBJECT_TYPE_CREATURE, "2Q4E_YuanTiConj", lLocal);
}
