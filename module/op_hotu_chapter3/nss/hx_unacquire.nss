//::///////////////////////////////////////////////
//:: Name hx_unacquire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check for the Glowing Gems and create the
     actual placeable.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

void main()
{
    object oGem = GetModuleItemLost();
    object oPC = GetModuleItemLostBy();

    //Verify that it's the PC doing the unacquiring
    if (GetIsPC(oPC) == TRUE)
    {
        // Check for Glowing Gem.
        if(GetTag(oGem) == "hx_mimic_gem")
        {
            //vector vPos = GetPosition(oGem);
            //vector vNew = Vector(vPos.x, vPos.y, vPos.z - 0.3);
            //location lLoc = Location(GetArea(oGem), vNew, 0.0);
            location lLoc = GetLocation(oGem);

            DestroyObject(oGem);
            object oGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
            if(GetLocalInt(GetModule(), "PCHasHellRingOn") == 1)
                AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oGem));
        }
    }
}
