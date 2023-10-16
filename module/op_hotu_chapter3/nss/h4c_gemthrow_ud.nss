//::///////////////////////////////////////////////
//:: Name h4c_gemthrow_ud
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the gem thrower toss gems
     onto the level whenever one is needed.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 30, 2003
//:://////////////////////////////////////////////
#include "mimic_inc"
void MakeGem(location lLoc);
void main()
{
    int iEvent = GetUserDefinedEventNumber();

    // The target for the gems.
    object oTarget;
    object oMimic = GetObjectByTag("hx_mimic");

    location lLoc;
    int iRandom = Random(3) + 1;

    vector vNew, vLoc;

    int iRandomX = Random(4);
    int iRandomY = Random(4);

    // Only spit out gems if AI is on and one is needed. Only keep one out at a time
    // for each thrower.
    if(iEvent == 7777)
    {
        oTarget = GetNearestObjectByTag("hx_gem_thrower_wp", OBJECT_SELF, iRandom);
        vLoc = GetPosition(oTarget);

        if(Random(100) > 50)
            iRandomX = iRandomX * (-1);
        if(Random(100) > 50)
            iRandomY = iRandomY * (-1);

        vNew = Vector(vLoc.x + iRandomX, vLoc.y + iRandomY, vLoc.z);
        lLoc = Location(GetArea(OBJECT_SELF), vNew, 0.0);

        SetFacingPoint(GetPosition(oTarget));
        DelayCommand(0.7, SoundObjectPlay(GetNearestObjectByTag("sca_dragelec")));
        DelayCommand(1.0, ActionCastFakeSpellAtLocation(723, lLoc));
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF)));
        DelayCommand(3.45, MakeGem(lLoc));
        DelayCommand(4.0, SoundObjectStop(GetNearestObjectByTag("sca_dragelec")));
    }
    // Cutscene version - dictacte location.
    else if(iEvent == 7778)
    {
        oTarget = GetObjectByTag("hx_gem_thrower_wpx");
        lLoc = GetLocation(oTarget);

        SetFacingPoint(GetPosition(oTarget));
        DelayCommand(0.7, SoundObjectPlay(GetNearestObjectByTag("sca_dragelec")));
        DelayCommand(1.0, ActionCastFakeSpellAtLocation(723, lLoc));
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF)));
        DelayCommand(3.05, MakeGem(lLoc));
        DelayCommand(4.0, SoundObjectStop(GetNearestObjectByTag("sca_dragelec")));
    }
}
// Create a gem on impact.
void MakeGem(location lLoc)
{
    object oGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
    if(GetLocalInt(GetModule(), "PCHasHellRingOn") == 1)
        AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oGem));
}
