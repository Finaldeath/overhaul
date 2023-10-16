//::///////////////////////////////////////////////
//:: Aribeth, Player Uses 3 Berries (Action Script)
//:: H2a_Ari_3Berry.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Build and clean up a 3-berry fire.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void CleanUpFire(object oPC);

void main()
{
    int iScript = 3;

    // The number of berries being used.
    int iNumBerries = iScript;

    object oPC = GetPCSpeaker();
    location lLoc = GetLocation(OBJECT_SELF);
    object oItem = GetFirstItemInInventory(oPC);
    int iStack = 0;

    // The fires and sound effects.
    string sFire;
    object oSound;

    // Set a variable on the PC so we know what to do if they abort the dialogue.
    SetLocalInt(oPC, "HX_PC_STARTED_FIRE", 1);
    SetLocalInt(oPC, "HX_FIRETYPE_SAFE", 0);

    if(iScript == 1)
    {
        sFire = "hx_bflame1";
        oSound = GetNearestObjectByTag("hx_bflame1_sound");
    }
    else if(iScript == 2)
    {
        sFire = "hx_bflame2";
        oSound = GetNearestObjectByTag("hx_bflame2_sound");
    }
    else
    {
        sFire = "hx_bflame3";
        oSound = GetNearestObjectByTag("hx_bflame3_sound");
    }

    // Create Fire.
    AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0));
    effect eFlash = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eFlash, OBJECT_SELF);
    object oFire = CreateObject(OBJECT_TYPE_PLACEABLE, sFire, lLoc);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PIXIEDUST), oFire);
    SoundObjectPlay(oSound);

    //Clean up the fire after a short delay.
    AssignCommand(GetModule(), DelayCommand(3.0, CleanUpFire(oPC)));

    //Add journal entry
//    AddJournalQuestEntry("XP2_Aribeth", 70, oPC, TRUE, TRUE);

    //Remove the appropriate number of Velox Berries.
    while(GetIsObjectValid(oItem))
    {
        if(GetTag(oItem) == "hx_fire_berries")
        {
            iStack = GetItemStackSize(oItem);
            if(iNumBerries >= iStack)
            {
                DestroyObject(oItem);
                iNumBerries = iNumBerries - iStack;
                if(iNumBerries <= 0)
                {
                    return;
                }
            }
            else
            {
                SetItemStackSize(oItem, iStack - iNumBerries);
                return;
            }
        }
        oItem = GetNextItemInInventory(oPC);
    }
}

void CleanUpFire(object oPC)
{
    object oFire1 = GetNearestObjectByTag("hx_bflame1", oPC);
    object oFire2 = GetNearestObjectByTag("hx_bflame2", oPC);
    object oFire3 = GetNearestObjectByTag("hx_bflame3", oPC);

    object oSound1 = GetNearestObjectByTag("hx_bflame1_sound", oPC);
    object oSound2 = GetNearestObjectByTag("hx_bflame2_sound", oPC);
    object oSound3 = GetNearestObjectByTag("hx_bflame3_sound", oPC);

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
