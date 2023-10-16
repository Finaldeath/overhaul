//::///////////////////////////////////////////////
//:: Lair of the Shadow Lich (OnEnter)
//:: En_Wizard_05.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If the player has defeated the Shadow Lich,
     spawn in the Shadow Servant for the player
     to interact with.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();

    if (GetIsPC(oEnterer) == TRUE)
    {
        //Create shadow vfx on placeables the first time in the area..
        if (GetLocalInt(OBJECT_SELF, "CreateShadowVFX") != 1)
        {
            object oRefPoint = GetObjectByTag("wp_Reference_Wizard_05");
            SetLocalInt(OBJECT_SELF, "CreateShadowVFX", 1);
            effect eEffect = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
            int nCount = 1;
            object oThing = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount);
            while (oThing != OBJECT_INVALID)
            {
                if (GetStringLeft(GetTag(oThing), 5) == "shdfx")
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oThing);
                }
                nCount++;
                oThing = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount);
            }
            //anti light vfx
            effect eEffect2 = EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10);
            int nCount2 = 1;
            object oThing2 = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount2);
            while (oThing2 != OBJECT_INVALID)
            {
                if (GetStringRight(GetTag(oThing2), 6) == "alight")
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect2, oThing2);
                }
                nCount2++;
                oThing2 = GetNearestObject(OBJECT_TYPE_PLACEABLE, oRefPoint, nCount2);
            }
        }
    }
}
