//::///////////////////////////////////////////////
//:: Name hx_on_equip
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create the "ring vision" when a PC
     equips the ring that guides them through Hell.
     It will make the area dark, and will create a
     bunch of glowing arrows pointing in the
     direction the PC needs to go.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void main()
{
    object oPC = GetPCItemLastEquippedBy();
    object oRing = GetPCItemLastEquipped();
    string sRing = "hx_puzzle_ring";
    object oArea = GetArea(oPC);

    ExecuteScript("x2_onequip", OBJECT_SELF);

    // Check to see if special ring was equipped.
    if(GetTag(oRing) == sRing)
    {
        if(GetTag(oArea) != "KnowerofPlaces" && GetTag(oArea) != "Waterdeep")
        {
            AstralPlaneCreate(oPC);
        }
        else
        {
           //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] The ring does not seem to function here.");
            SendMessageToPCByStrRef(oPC, 85523);
        }
    }

    if(GetTag(oRing) == "hx_berry_torch")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PIXIEDUST), oPC, 5.0);
    }
}
