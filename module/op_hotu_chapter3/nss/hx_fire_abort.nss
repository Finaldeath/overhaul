//::///////////////////////////////////////////////
//:: Name hx_fire_abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will handle the player aborting the conv.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

// Destroy camp.
void RestCleanup(object oPC);

void main()
{
    object oPC = GetPCSpeaker();
    // Variable on the PC so we know what to do if they abort the dialogue.
    int iFire = GetLocalInt(GetFirstPC(), "HX_PC_STARTED_FIRE");

    if(iFire == 1)
    {
        RestCleanup(oPC);
    }
}

void RestCleanup(object oPC)
{
    object oFire1 = GetNearestObjectByTag("hx_bflame1");
    object oFire2 = GetNearestObjectByTag("hx_bflame2");
    object oFire3 = GetNearestObjectByTag("hx_bflame3");

    object oSound1 = GetNearestObjectByTag("hx_bflame1_sound");
    object oSound2 = GetNearestObjectByTag("hx_bflame2_sound");
    object oSound3 = GetNearestObjectByTag("hx_bflame3_sound");

    if(GetIsObjectValid(oFire1))
    {
        SetLocalInt(oPC, "HX_FIRETYPE", 1);
        SoundObjectStop(oSound1);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oFire1));
        DestroyObject(oFire1);
    }
    else if(GetIsObjectValid(oFire2))
    {
        SetLocalInt(oPC, "HX_FIRETYPE", 2);
        SoundObjectStop(oSound2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oFire2));
        DestroyObject(oFire2);
    }
    else if(GetIsObjectValid(oFire3))
    {
        SetLocalInt(oPC, "HX_FIRETYPE", 3);
        SoundObjectStop(oSound3);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oFire3));
        DestroyObject(oFire3);
    }
    SetLocalInt(oPC, "HX_PC_STARTED_FIRE", 0);
}
