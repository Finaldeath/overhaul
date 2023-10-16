//::///////////////////////////////////////////////
//:: Name h4c_gemthrow_hb
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
    // The target for the gems.
    object oTarget;
    object oMimic = GetObjectByTag("hx_mimic");
    object oGem = GetLocalObject(OBJECT_SELF, "HXGemOwned");

    location lLoc;
    int iRandom = Random(3) + 1;

    vector vNew, vLoc;

    int iRandomX = Random(4);
    int iRandomY = Random(4);

    // Only spit out gems if AI is on and one is needed. Only keep one out at a time
    // for each thrower.
    if(GetMimicAI(oMimic) == 1 && !GetIsObjectValid(oGem))
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
        DelayCommand(0.7, PlaySound("sca_dragelec"));
        DelayCommand(1.0, ActionCastFakeSpellAtLocation(716, lLoc));
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF)));
        DelayCommand(3.45, MakeGem(lLoc));
    }
}

// Create a gem on impact.
void MakeGem(location lLoc)
{
    object oGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
    SetLocalObject(OBJECT_SELF, "HXGemOwned", oGem);
}
