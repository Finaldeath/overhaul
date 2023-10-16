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
    int iScript = 20;

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

    if(iScript == 20)
    {
        // Create Fire.
        AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(464), OBJECT_SELF);
        DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oPC));
    }

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
