//::///////////////////////////////////////////////
//:: Name hx_velox_b_use3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will note that the player has made a camp
     with 3 berries.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

void main()
{
    // Just change this variable for each script.
    int iScript = 3;

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
    SetLocalInt(oPC, "HX_FIRE_POTION", 0);

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
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SUNSTRIKE), OBJECT_SELF);
    object oFire = CreateObject(OBJECT_TYPE_PLACEABLE, sFire, lLoc);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PIXIEDUST), oFire);
    SoundObjectPlay(oSound);

    // Take the berries.
    while(GetIsObjectValid(oItem))
    {
        if(GetTag(oItem) == "hx_fire_berries")
        {
            iStack = GetItemStackSize(oItem);
            if(iScript >= iStack)
            {
                DestroyObject(oItem);
                iScript = iScript - iStack;
                if(iScript <= 0)
                {
                    return;
                }
            }
            else
            {
                SetItemStackSize(oItem, iStack - iScript);
                return;
            }
        }
        oItem = GetNextItemInInventory(oPC);
    }
}
